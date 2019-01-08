package org.zeus.service;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import org.zeus.bean.Database;
import org.zeus.common.ServerResponse;
import org.zeus.common.util.DBUtil;
import org.zeus.common.util.DMSConstant;
import org.zeus.common.util.WindowsUtils;
import org.zeus.dmsMapper.UniversityMapper;
import org.zeus.entity.University;

@Service
@Slf4j
public class UniversityService {

	@Autowired
    UniversityMapper mapper;

	public List<University> listUniversity() {
		return mapper.queryAllUniversity();
	}

	public List<University> findUniversity(String schoolNum, String schoolName, String strNum, String strRow) {
		return mapper.queryUniversity(schoolNum, schoolName, strNum, strRow);
	}

	
	
	
	public List<University> listUniversity1() {
		University university = new University();
		university.setDbip("192.168.100.66");
		university.setDbname("master_1000_db");
		university.setDbPassword("root");
		university.setSchoolName("root");
		DBUtil.addOrChangeDataSource(university);
		return mapper.queryAllUniversity();
	}
	
	
	
	public ServerResponse addUniversity(University university){
		if(mapper.addUniversity(university)>0){
			return ServerResponse.createBySuccess();
		}else{
			return ServerResponse.createByError();
		}
		
	}
	
	/**
	 * 新建数据库以及用户，复制标准库
	 * 
	 * @param base
	 * @return
	 */
	public ServerResponse createbase(Database base) {
		// 新建库用户名
		String strNewSCDBUsername = DMSConstant.DB_NAME_MASTER_START + base.getOldSchoolNum();
		// 新建库密码
		String strNewSCDBpassword = "12345678";/*该处为自动生成8位密码，生成后加密存储到数据库中*/
		// 新建库名称
		String strNewSCDBName = DMSConstant.DB_NAME_MASTER_START + base.getOldSchoolNum()
				+ DMSConstant.DB_NAME_MASTER_END;
		// 标准库数据库名
		String strOldDBName = "";
		// 标准库用户名
		String strOldDBUserName = "";
		// 标准库密码
		String strOldDBPassword = "";

		// 此处newSchoolNum为标准库学校编号。
		University university = mapper.findUniversityById(base.getNewSchoolNum());
		if (university != null && !"".equals(university)) {
			// 从数据库读取 标准库 (旧)用户名密码,并对数据进行解密操作
			strOldDBName = university.getDbname();

			strOldDBUserName = university.getDbUser();

			strOldDBPassword = university.getDbPassword();

		} else {
			return ServerResponse.createByError("查询学校信息出错,或该编号学校不存在");
		}

		try {

			/**
			 * 创建数据库
			 * 
			 */
			Class.forName("com.mysql.jdbc.Driver");

			// 必须填一个已经存在的数据库
			String url = "jdbc:mysql://" + base.getOldServerIp() + ":" + base.getPort() + "/mysql?"
					+ "characterEncoding=utf-8&serverTimezone=GMT%2B8&&useSSL=false";

			log.info("connect mysql base>>>>>>>>>>");
			java.sql.Connection conn = DriverManager.getConnection(url, base.getMysqlUser(), base.getMysqlPassowrd());
			Statement stat = conn.createStatement();
			log.info("create mysql base>>>>>>>>>>");

			// 创建数据库
			int intResult = stat.executeUpdate("create DATABASE  if not exists " + strNewSCDBName + " Character Set UTF8");
			if (intResult >= 0) {
				// 创建新数据库用户名密码
				intResult = stat.executeUpdate(
						"create USER " + strNewSCDBUsername + " IDENTIFIED by '" + strNewSCDBpassword + "';");

				if (intResult >= 0) {
					// 数据库授权
					intResult = stat.executeUpdate(
							"GRANT ALL ON " + strNewSCDBName + ".* TO '" + strNewSCDBUsername + "'@'%';");
				}

			}else{
				return ServerResponse.createByError("库已存在或新建库失败");
			}
			// 关闭数据库
			stat.close();
			if (intResult >= 0) {
				log.info("copy mysql base>>>>>>>>>>");
				// 复制数据库
				/*
				 * mysqldump -h 192.168.100.66 -d master_main_db -uroot -proot
				 * --add-drop-table | mysql -h 127.0.0.1 master_main_db -uroot
				 * -proot
				 */
				StringBuffer strBuffer = new StringBuffer();
				strBuffer.append("cmd /c mysqldump -h ");
				strBuffer.append(university.getDbip() +" "+ strOldDBName);
				strBuffer.append(" -u" + strOldDBUserName + " -p" + strOldDBPassword + " --add-drop-table | mysql -h ");
				strBuffer.append(base.getOldServerIp() + " ");
				strBuffer.append(strNewSCDBName);
				strBuffer.append(" -u" + strNewSCDBUsername + " -p" + strNewSCDBpassword);
				// 复制数据库执行
				if (WindowsUtils.execCMD(strBuffer.toString())) {
					log.info("update university>>>>>>>>>>");

					// base传递新创建数据库加密存储
					base.setMysqlUser(strNewSCDBUsername);
					base.setMysqlPassowrd(strNewSCDBpassword);
					base.setDbName(strNewSCDBName);
					if(mapper.updateUniversity(base)>0){
						ServerResponse.createBySuccess("创建成功并已存储");
					}
					// 更新用户开通数据库后的信息
				}
			}

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return ServerResponse.createByError(e.getMessage());
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
			return ServerResponse.createByError(e.getMessage());
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ServerResponse.createByError(e.getMessage());
		}
		return ServerResponse.createBySuccess();
	}
}
