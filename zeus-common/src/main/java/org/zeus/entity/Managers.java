package org.zeus.entity;

import java.io.Serializable;
import java.util.Date;

public class Managers extends ManagersKey implements Serializable {
    private String password;

    private String name;

    private String mobile;

    private String email;

    private Integer schoolNumber;

    private Integer serversNumber;

    private String loginIp;

    private Integer authority;

    private Integer status;

    private Date expireDate;

    private String loginToken;

    private String prefix;

    private String verifyUsername;

    private String verifyPassword;

    private String token;

    private String dbIp;

    private String dbName;

    private String verifyUsername2;

    private String verifyPassword2;

    private String verifyAddress2;

    private Date createtime;

    private Date lastmodifytime;

    private Integer displayScname;

    private Integer openScrivener;

    private Date openScrivenerTime;

    private Integer groupNumber;

    private String sysName;

    private Integer exportGroup;

    private String adminSms;

    private String teacherSms;

    private String verifyUpload;

    private String stuBatchImport;

    private String importStuMax;

    private String forgotPassword;

    private static final long serialVersionUID = 1L;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getSchoolNumber() {
        return schoolNumber;
    }

    public void setSchoolNumber(Integer schoolNumber) {
        this.schoolNumber = schoolNumber;
    }

    public Integer getServersNumber() {
        return serversNumber;
    }

    public void setServersNumber(Integer serversNumber) {
        this.serversNumber = serversNumber;
    }

    public String getLoginIp() {
        return loginIp;
    }

    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp == null ? null : loginIp.trim();
    }

    public Integer getAuthority() {
        return authority;
    }

    public void setAuthority(Integer authority) {
        this.authority = authority;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getExpireDate() {
        return expireDate;
    }

    public void setExpireDate(Date expireDate) {
        this.expireDate = expireDate;
    }

    public String getLoginToken() {
        return loginToken;
    }

    public void setLoginToken(String loginToken) {
        this.loginToken = loginToken == null ? null : loginToken.trim();
    }

    public String getPrefix() {
        return prefix;
    }

    public void setPrefix(String prefix) {
        this.prefix = prefix == null ? null : prefix.trim();
    }

    public String getVerifyUsername() {
        return verifyUsername;
    }

    public void setVerifyUsername(String verifyUsername) {
        this.verifyUsername = verifyUsername == null ? null : verifyUsername.trim();
    }

    public String getVerifyPassword() {
        return verifyPassword;
    }

    public void setVerifyPassword(String verifyPassword) {
        this.verifyPassword = verifyPassword == null ? null : verifyPassword.trim();
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token == null ? null : token.trim();
    }

    public String getDbIp() {
        return dbIp;
    }

    public void setDbIp(String dbIp) {
        this.dbIp = dbIp == null ? null : dbIp.trim();
    }

    public String getDbName() {
        return dbName;
    }

    public void setDbName(String dbName) {
        this.dbName = dbName == null ? null : dbName.trim();
    }

    public String getVerifyUsername2() {
        return verifyUsername2;
    }

    public void setVerifyUsername2(String verifyUsername2) {
        this.verifyUsername2 = verifyUsername2 == null ? null : verifyUsername2.trim();
    }

    public String getVerifyPassword2() {
        return verifyPassword2;
    }

    public void setVerifyPassword2(String verifyPassword2) {
        this.verifyPassword2 = verifyPassword2 == null ? null : verifyPassword2.trim();
    }

    public String getVerifyAddress2() {
        return verifyAddress2;
    }

    public void setVerifyAddress2(String verifyAddress2) {
        this.verifyAddress2 = verifyAddress2 == null ? null : verifyAddress2.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getLastmodifytime() {
        return lastmodifytime;
    }

    public void setLastmodifytime(Date lastmodifytime) {
        this.lastmodifytime = lastmodifytime;
    }

    public Integer getDisplayScname() {
        return displayScname;
    }

    public void setDisplayScname(Integer displayScname) {
        this.displayScname = displayScname;
    }

    public Integer getOpenScrivener() {
        return openScrivener;
    }

    public void setOpenScrivener(Integer openScrivener) {
        this.openScrivener = openScrivener;
    }

    public Date getOpenScrivenerTime() {
        return openScrivenerTime;
    }

    public void setOpenScrivenerTime(Date openScrivenerTime) {
        this.openScrivenerTime = openScrivenerTime;
    }

    public Integer getGroupNumber() {
        return groupNumber;
    }

    public void setGroupNumber(Integer groupNumber) {
        this.groupNumber = groupNumber;
    }

    public String getSysName() {
        return sysName;
    }

    public void setSysName(String sysName) {
        this.sysName = sysName == null ? null : sysName.trim();
    }

    public Integer getExportGroup() {
        return exportGroup;
    }

    public void setExportGroup(Integer exportGroup) {
        this.exportGroup = exportGroup;
    }

    public String getAdminSms() {
        return adminSms;
    }

    public void setAdminSms(String adminSms) {
        this.adminSms = adminSms == null ? null : adminSms.trim();
    }

    public String getTeacherSms() {
        return teacherSms;
    }

    public void setTeacherSms(String teacherSms) {
        this.teacherSms = teacherSms == null ? null : teacherSms.trim();
    }

    public String getVerifyUpload() {
        return verifyUpload;
    }

    public void setVerifyUpload(String verifyUpload) {
        this.verifyUpload = verifyUpload == null ? null : verifyUpload.trim();
    }

    public String getStuBatchImport() {
        return stuBatchImport;
    }

    public void setStuBatchImport(String stuBatchImport) {
        this.stuBatchImport = stuBatchImport == null ? null : stuBatchImport.trim();
    }

    public String getImportStuMax() {
        return importStuMax;
    }

    public void setImportStuMax(String importStuMax) {
        this.importStuMax = importStuMax == null ? null : importStuMax.trim();
    }

    public String getForgotPassword() {
        return forgotPassword;
    }

    public void setForgotPassword(String forgotPassword) {
        this.forgotPassword = forgotPassword == null ? null : forgotPassword.trim();
    }
}