package net.cnki.dmsMapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import net.cnki.bean.Database;
import net.cnki.entity.University;

public interface UniversityMapper {

	int addUniversity(University university);

	public int updateUniversity(@Param("database") Database database);

	University findUniversityById(String schoolNum);

	public List<University> queryAllUniversity();

	/**
	 * 学校信息查询，用于开通对比数据
	 * 
	 * @param schoolNum
	 *            学校编号
	 * @param schoolName
	 *            学校名称
	 * @param strNum
	 *            起始页码
	 * @param strRow
	 *            每页条数
	 * @return 返回list
	 */
	public List<University> queryUniversity(String schoolNum, String schoolName, String strNum, String strRow);

}
