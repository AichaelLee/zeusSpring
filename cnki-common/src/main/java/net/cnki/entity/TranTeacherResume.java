package net.cnki.entity;

import java.io.Serializable;
import java.util.Date;

public class TranTeacherResume implements Serializable {
    private Integer id;

    private Integer teacherId;

    private String school;

    private String teacheObject;

    private Date endTime;

    private Date beginTime;

    private String courseName;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school == null ? null : school.trim();
    }

    public String getTeacheObject() {
        return teacheObject;
    }

    public void setTeacheObject(String teacheObject) {
        this.teacheObject = teacheObject == null ? null : teacheObject.trim();
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Date getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(Date beginTime) {
        this.beginTime = beginTime;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName == null ? null : courseName.trim();
    }
}