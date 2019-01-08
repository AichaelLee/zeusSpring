package org.zeus.common.util;


import java.util.Map;

import com.alibaba.druid.pool.DruidDataSource;

import org.zeus.config.DataSourceContextHolder;
import org.zeus.config.DynamicDataSource;
import org.zeus.entity.University;

public class DBUtil {
	
	public static void addOrChangeDataSource(University user){

		/**
		 * 创建动态数据源
		 */
		Map<Object, Object> dataSourceMap = DynamicDataSource.getInstance().getDataSourceMap();
		if(!dataSourceMap.containsKey(user.getDbip())&&!"".equals(user.getDbip())&&null != user.getDbip()){
			DruidDataSource dynamicDataSource = new DruidDataSource();
			dynamicDataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
			dynamicDataSource.setUrl("jdbc:mysql://"+user.getDbip()+""
					+ ":3306/"+user.getDbname()+"?characterEncoding=utf-8&serverTimezone=GMT%2B8"
							+ "&&useSSL=false"
					);
			dynamicDataSource.setUsername(user.getSchoolName());
			dynamicDataSource.setPassword(user.getDbPassword());
			dataSourceMap.put(user.getDbip(), dynamicDataSource);
			DynamicDataSource.getInstance().setTargetDataSources(dataSourceMap);
			/**
			 * 切换为动态数据源实例，打印学生信息
			 */
			DataSourceContextHolder.setDBType(user.getDbip());
		}else{
			/**
			 * 切换为动态数据源实例，打印学生信息
			 */
			DataSourceContextHolder.setDBType(user.getDbip());
		}
		
	
	}

}
