package net.cnki.entity;

import java.io.Serializable;

public class HibernateSequences implements Serializable {
    private String sequenceName;

    private Integer sequenceNextHiValue;

    private static final long serialVersionUID = 1L;

    public String getSequenceName() {
        return sequenceName;
    }

    public void setSequenceName(String sequenceName) {
        this.sequenceName = sequenceName == null ? null : sequenceName.trim();
    }

    public Integer getSequenceNextHiValue() {
        return sequenceNextHiValue;
    }

    public void setSequenceNextHiValue(Integer sequenceNextHiValue) {
        this.sequenceNextHiValue = sequenceNextHiValue;
    }
}