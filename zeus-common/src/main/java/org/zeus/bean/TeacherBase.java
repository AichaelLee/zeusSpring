package org.zeus.bean;

import java.io.Serializable;
import java.util.Date;
/**
 * Created by lizhizhong on 2018/11/26.
 */
public class TeacherBase implements Serializable {


    private Integer TID;


    private String username;

    private String password;

    private Integer schoolNum;

    private Integer academyNum;

    private Integer teacherNum;

    private String name;

    private String title;

    private String education;

    private String bachelor;

    private Date position;



    private static final long serialVersionUID = 1L;

    public Integer getTID() {
        return TID;
    }

    public void setTID(Integer TID) {
        this.TID = TID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getSchoolNum() {
        return schoolNum;
    }

    public void setSchoolNum(Integer schoolNum) {
        this.schoolNum = schoolNum;
    }

    public Integer getAcademyNum() {
        return academyNum;
    }

    public void setAcademyNum(Integer academyNum) {
        this.academyNum = academyNum;
    }

    public Integer getTeacherNum() {
        return teacherNum;
    }

    public void setTeacherNum(Integer teacherNum) {
        this.teacherNum = teacherNum;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getBachelor() {
        return bachelor;
    }

    public void setBachelor(String bachelor) {
        this.bachelor = bachelor;
    }

    public Date getPosition() {
        return position;
    }

    public void setPosition(Date position) {
        this.position = position;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }
}