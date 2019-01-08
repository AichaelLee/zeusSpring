package org.zeus.entity;

import java.io.Serializable;

public class University implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8522253263675161409L;


	private String schoolId;
	private String schoolName;
	private String province;
	private String city;
	private String liaisonName;
	private String liaisonEmail;
	private String property;

	private String status;
	private String beginTime;
	private String expireTime;
	private String dbip;
	private String dbname;
	private String domain;

	private String showSchoolName;
	private String systemName;
	private String smsAdmin;
	private String smsTeacher;
	private String importStudent;
	private String checkOpen;
	private String checkUsername;

	private String checkPassword;
	private String checkCode;
	private String dbUser;
	private String dbPassword;


	public String getSchoolId() {
		return schoolId;
	}


	public void setSchoolId(String schoolId) {
		this.schoolId = schoolId;
	}


	public String getSchoolName() {
		return schoolName;
	}


	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}


	public String getProvince() {
		return province;
	}


	public void setProvince(String province) {
		this.province = province;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getLiaisonName() {
		return liaisonName;
	}


	public void setLiaisonName(String liaisonName) {
		this.liaisonName = liaisonName;
	}


	public String getLiaisonEmail() {
		return liaisonEmail;
	}


	public void setLiaisonEmail(String liaisonEmail) {
		this.liaisonEmail = liaisonEmail;
	}


	public String getProperty() {
		return property;
	}


	public void setProperty(String property) {
		this.property = property;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getBeginTime() {
		return beginTime;
	}


	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}


	public String getExpireTime() {
		return expireTime;
	}


	public void setExpireTime(String expireTime) {
		this.expireTime = expireTime;
	}


	public String getDbip() {
		return dbip;
	}


	public void setDbip(String dbip) {
		this.dbip = dbip;
	}


	public String getDbname() {
		return dbname;
	}


	public void setDbname(String dbname) {
		this.dbname = dbname;
	}


	public String getDomain() {
		return domain;
	}


	public void setDomain(String domain) {
		this.domain = domain;
	}


	public String getShowSchoolName() {
		return showSchoolName;
	}


	public void setShowSchoolName(String showSchoolName) {
		this.showSchoolName = showSchoolName;
	}


	public String getSystemName() {
		return systemName;
	}


	public void setSystemName(String systemName) {
		this.systemName = systemName;
	}


	public String getSmsAdmin() {
		return smsAdmin;
	}


	public void setSmsAdmin(String smsAdmin) {
		this.smsAdmin = smsAdmin;
	}


	public String getSmsTeacher() {
		return smsTeacher;
	}


	public void setSmsTeacher(String smsTeacher) {
		this.smsTeacher = smsTeacher;
	}


	public String getImportStudent() {
		return importStudent;
	}


	public void setImportStudent(String importStudent) {
		this.importStudent = importStudent;
	}


	public String getCheckOpen() {
		return checkOpen;
	}


	public void setCheckOpen(String checkOpen) {
		this.checkOpen = checkOpen;
	}


	public String getCheckUsername() {
		return checkUsername;
	}


	public void setCheckUsername(String checkUsername) {
		this.checkUsername = checkUsername;
	}


	public String getCheckPassword() {
		return checkPassword;
	}


	public void setCheckPassword(String checkPassword) {
		this.checkPassword = checkPassword;
	}


	public String getCheckCode() {
		return checkCode;
	}


	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}


	public String getDbUser() {
		return dbUser;
	}


	public void setDbUser(String dbUser) {
		this.dbUser = dbUser;
	}


	public String getDbPassword() {
		return dbPassword;
	}


	public void setDbPassword(String dbPassword) {
		this.dbPassword = dbPassword;
	}


	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
}
