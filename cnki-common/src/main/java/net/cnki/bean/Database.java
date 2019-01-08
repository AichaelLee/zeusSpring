package net.cnki.bean;


public class Database {
	
	private String newSchoolNum;
	
	private String oldSchoolNum;
	
	private String oldServerIp;
	
	private String delSameDb;
	
	private String dbName;
	
	private String port = "3306";
	
	private String MysqlUser;
	
	private String MysqlPassowrd;
	
	
	public String getMysqlUser() {
		return MysqlUser;
	}

	public void setMysqlUser(String mysqlUser) {
		MysqlUser = mysqlUser;
	}

	public String getMysqlPassowrd() {
		return MysqlPassowrd;
	}

	public void setMysqlPassowrd(String mysqlPassowrd) {
		MysqlPassowrd = mysqlPassowrd;
	}

	public String getPort() {
		return port;
	}

	public void setPort(String port) {
		this.port = port;
	}

	public String getDbName() {
		return dbName;
	}

	public void setDbName(String dbName) {
		this.dbName = dbName;
	}

	public String getNewSchoolNum() {
		return newSchoolNum;
	}

	public void setNewSchoolNum(String newSchoolNum) {
		this.newSchoolNum = newSchoolNum;
	}

	public String getOldSchoolNum() {
		return oldSchoolNum;
	}

	public void setOldSchoolNum(String oldSchoolNum) {
		this.oldSchoolNum = oldSchoolNum;
	}

	public String getOldServerIp() {
		return oldServerIp;
	}

	public void setOldServerIp(String oldServerIp) {
		this.oldServerIp = oldServerIp;
	}

	public String getDelSameDb() {
		return delSameDb;
	}

	public void setDelSameDb(String delSameDb) {
		this.delSameDb = delSameDb;
	}

	
	
	public Database() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	

}
