package net.cnki.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import net.cnki.bean.Database;
import net.cnki.common.ServerResponse;
import net.cnki.entity.University;
import net.cnki.service.UniversityService;

@RestController
@Api(value = "用户数据库相关接口", tags = { "用户数据库相关接口" })
@RequestMapping("/Handler")
public class RestHandlerController {

	/**
	 * 数据库服务器IP地址
	 */
	@Value("${service.ip}")
	private String strMysqlSeviceIp;

	/**
	 * 目标服务器mysql用户名
	 */
	@Value("${service.db.username}")
	private String strMysqlUserName;

	/**
	 * 目标服务器mysql密码
	 */
	@Value("${service.db.password}")
	private String strMysqlPassword;

	@Autowired
	UniversityService universityService;

	/**
	 * newSchoolNum: schoolNumText, sn: 1, oldSchoolNum:
	 * $("#list").datagrid("getData").rows[index]["学校编号"], :
	 * $("#databaseIp").combobox("getValue"), delSameDb: $("#delDataBase
	 * input[name='delDataBase']:checked").val()
	 * 
	 * @param database
	 * @return
	 */

	@PostMapping("/createDatabase")
	@ApiOperation(value = "用户开通数据库", notes = "用户开通数据库，并从标准库复制表。")
	public ServerResponse createDataBase(Database database) {
		database.setMysqlPassowrd(strMysqlPassword);

		database.setMysqlUser(strMysqlUserName);

		return universityService.createbase(database);
	}

	@PostMapping("listUniversity")
	@ApiOperation(value = "获取所有学校信息", notes = "获取所有学校信息")
	public List<University> getAllUniversity() {
		return universityService.listUniversity();
	}

	@PostMapping("addUniversity")
	@ApiOperation(value = "添加学校", notes = "添加学校基本信息接口")
	public ServerResponse addUniversity( University university) {
		return universityService.addUniversity(university);
	}
	
	@PostMapping("test")
	@ApiOperation(value="动态数据源测试接口",notes="动态数据源")
	public List<University> test(){
		return universityService.listUniversity1();
	}
	
	
}
