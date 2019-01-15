package org.zeus.entity;

import java.io.Serializable;
import java.util.Date;

public class FlowStepCheckState implements Serializable {
    private Integer id;

    private Integer stepId;

    private String state;

    private Date createTime;

    private String isend;

    private String operationlogType;

    private Integer operationId;

    private String auditor;

    private Integer projectId;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStepId() {
        return stepId;
    }

    public void setStepId(Integer stepId) {
        this.stepId = stepId;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getIsend() {
        return isend;
    }

    public void setIsend(String isend) {
        this.isend = isend == null ? null : isend.trim();
    }

    public String getOperationlogType() {
        return operationlogType;
    }

    public void setOperationlogType(String operationlogType) {
        this.operationlogType = operationlogType == null ? null : operationlogType.trim();
    }

    public Integer getOperationId() {
        return operationId;
    }

    public void setOperationId(Integer operationId) {
        this.operationId = operationId;
    }

    public String getAuditor() {
        return auditor;
    }

    public void setAuditor(String auditor) {
        this.auditor = auditor == null ? null : auditor.trim();
    }

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }
}