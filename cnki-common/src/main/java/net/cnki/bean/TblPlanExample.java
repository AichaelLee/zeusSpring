package net.cnki.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TblPlanExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TblPlanExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andPlanIdIsNull() {
            addCriterion("plan_id is null");
            return (Criteria) this;
        }

        public Criteria andPlanIdIsNotNull() {
            addCriterion("plan_id is not null");
            return (Criteria) this;
        }

        public Criteria andPlanIdEqualTo(Integer value) {
            addCriterion("plan_id =", value, "planId");
            return (Criteria) this;
        }

        public Criteria andPlanIdNotEqualTo(Integer value) {
            addCriterion("plan_id <>", value, "planId");
            return (Criteria) this;
        }

        public Criteria andPlanIdGreaterThan(Integer value) {
            addCriterion("plan_id >", value, "planId");
            return (Criteria) this;
        }

        public Criteria andPlanIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("plan_id >=", value, "planId");
            return (Criteria) this;
        }

        public Criteria andPlanIdLessThan(Integer value) {
            addCriterion("plan_id <", value, "planId");
            return (Criteria) this;
        }

        public Criteria andPlanIdLessThanOrEqualTo(Integer value) {
            addCriterion("plan_id <=", value, "planId");
            return (Criteria) this;
        }

        public Criteria andPlanIdIn(List<Integer> values) {
            addCriterion("plan_id in", values, "planId");
            return (Criteria) this;
        }

        public Criteria andPlanIdNotIn(List<Integer> values) {
            addCriterion("plan_id not in", values, "planId");
            return (Criteria) this;
        }

        public Criteria andPlanIdBetween(Integer value1, Integer value2) {
            addCriterion("plan_id between", value1, value2, "planId");
            return (Criteria) this;
        }

        public Criteria andPlanIdNotBetween(Integer value1, Integer value2) {
            addCriterion("plan_id not between", value1, value2, "planId");
            return (Criteria) this;
        }

        public Criteria andSchoolNumIsNull() {
            addCriterion("school_num is null");
            return (Criteria) this;
        }

        public Criteria andSchoolNumIsNotNull() {
            addCriterion("school_num is not null");
            return (Criteria) this;
        }

        public Criteria andSchoolNumEqualTo(Integer value) {
            addCriterion("school_num =", value, "schoolNum");
            return (Criteria) this;
        }

        public Criteria andSchoolNumNotEqualTo(Integer value) {
            addCriterion("school_num <>", value, "schoolNum");
            return (Criteria) this;
        }

        public Criteria andSchoolNumGreaterThan(Integer value) {
            addCriterion("school_num >", value, "schoolNum");
            return (Criteria) this;
        }

        public Criteria andSchoolNumGreaterThanOrEqualTo(Integer value) {
            addCriterion("school_num >=", value, "schoolNum");
            return (Criteria) this;
        }

        public Criteria andSchoolNumLessThan(Integer value) {
            addCriterion("school_num <", value, "schoolNum");
            return (Criteria) this;
        }

        public Criteria andSchoolNumLessThanOrEqualTo(Integer value) {
            addCriterion("school_num <=", value, "schoolNum");
            return (Criteria) this;
        }

        public Criteria andSchoolNumIn(List<Integer> values) {
            addCriterion("school_num in", values, "schoolNum");
            return (Criteria) this;
        }

        public Criteria andSchoolNumNotIn(List<Integer> values) {
            addCriterion("school_num not in", values, "schoolNum");
            return (Criteria) this;
        }

        public Criteria andSchoolNumBetween(Integer value1, Integer value2) {
            addCriterion("school_num between", value1, value2, "schoolNum");
            return (Criteria) this;
        }

        public Criteria andSchoolNumNotBetween(Integer value1, Integer value2) {
            addCriterion("school_num not between", value1, value2, "schoolNum");
            return (Criteria) this;
        }

        public Criteria andSchoolYearIsNull() {
            addCriterion("school_year is null");
            return (Criteria) this;
        }

        public Criteria andSchoolYearIsNotNull() {
            addCriterion("school_year is not null");
            return (Criteria) this;
        }

        public Criteria andSchoolYearEqualTo(String value) {
            addCriterion("school_year =", value, "schoolYear");
            return (Criteria) this;
        }

        public Criteria andSchoolYearNotEqualTo(String value) {
            addCriterion("school_year <>", value, "schoolYear");
            return (Criteria) this;
        }

        public Criteria andSchoolYearGreaterThan(String value) {
            addCriterion("school_year >", value, "schoolYear");
            return (Criteria) this;
        }

        public Criteria andSchoolYearGreaterThanOrEqualTo(String value) {
            addCriterion("school_year >=", value, "schoolYear");
            return (Criteria) this;
        }

        public Criteria andSchoolYearLessThan(String value) {
            addCriterion("school_year <", value, "schoolYear");
            return (Criteria) this;
        }

        public Criteria andSchoolYearLessThanOrEqualTo(String value) {
            addCriterion("school_year <=", value, "schoolYear");
            return (Criteria) this;
        }

        public Criteria andSchoolYearLike(String value) {
            addCriterion("school_year like", value, "schoolYear");
            return (Criteria) this;
        }

        public Criteria andSchoolYearNotLike(String value) {
            addCriterion("school_year not like", value, "schoolYear");
            return (Criteria) this;
        }

        public Criteria andSchoolYearIn(List<String> values) {
            addCriterion("school_year in", values, "schoolYear");
            return (Criteria) this;
        }

        public Criteria andSchoolYearNotIn(List<String> values) {
            addCriterion("school_year not in", values, "schoolYear");
            return (Criteria) this;
        }

        public Criteria andSchoolYearBetween(String value1, String value2) {
            addCriterion("school_year between", value1, value2, "schoolYear");
            return (Criteria) this;
        }

        public Criteria andSchoolYearNotBetween(String value1, String value2) {
            addCriterion("school_year not between", value1, value2, "schoolYear");
            return (Criteria) this;
        }

        public Criteria andDefaultIsNull() {
            addCriterion("default is null");
            return (Criteria) this;
        }

        public Criteria andDefaultIsNotNull() {
            addCriterion("default is not null");
            return (Criteria) this;
        }

        public Criteria andDefaultEqualTo(String value) {
            addCriterion("default =", value, "default");
            return (Criteria) this;
        }

        public Criteria andDefaultNotEqualTo(String value) {
            addCriterion("default <>", value, "default");
            return (Criteria) this;
        }

        public Criteria andDefaultGreaterThan(String value) {
            addCriterion("default >", value, "default");
            return (Criteria) this;
        }

        public Criteria andDefaultGreaterThanOrEqualTo(String value) {
            addCriterion("default >=", value, "default");
            return (Criteria) this;
        }

        public Criteria andDefaultLessThan(String value) {
            addCriterion("default <", value, "default");
            return (Criteria) this;
        }

        public Criteria andDefaultLessThanOrEqualTo(String value) {
            addCriterion("default <=", value, "default");
            return (Criteria) this;
        }

        public Criteria andDefaultLike(String value) {
            addCriterion("default like", value, "default");
            return (Criteria) this;
        }

        public Criteria andDefaultNotLike(String value) {
            addCriterion("default not like", value, "default");
            return (Criteria) this;
        }

        public Criteria andDefaultIn(List<String> values) {
            addCriterion("default in", values, "default");
            return (Criteria) this;
        }

        public Criteria andDefaultNotIn(List<String> values) {
            addCriterion("default not in", values, "default");
            return (Criteria) this;
        }

        public Criteria andDefaultBetween(String value1, String value2) {
            addCriterion("default between", value1, value2, "default");
            return (Criteria) this;
        }

        public Criteria andDefaultNotBetween(String value1, String value2) {
            addCriterion("default not between", value1, value2, "default");
            return (Criteria) this;
        }

        public Criteria andOpentimenodeIsNull() {
            addCriterion("opentimenode is null");
            return (Criteria) this;
        }

        public Criteria andOpentimenodeIsNotNull() {
            addCriterion("opentimenode is not null");
            return (Criteria) this;
        }

        public Criteria andOpentimenodeEqualTo(String value) {
            addCriterion("opentimenode =", value, "opentimenode");
            return (Criteria) this;
        }

        public Criteria andOpentimenodeNotEqualTo(String value) {
            addCriterion("opentimenode <>", value, "opentimenode");
            return (Criteria) this;
        }

        public Criteria andOpentimenodeGreaterThan(String value) {
            addCriterion("opentimenode >", value, "opentimenode");
            return (Criteria) this;
        }

        public Criteria andOpentimenodeGreaterThanOrEqualTo(String value) {
            addCriterion("opentimenode >=", value, "opentimenode");
            return (Criteria) this;
        }

        public Criteria andOpentimenodeLessThan(String value) {
            addCriterion("opentimenode <", value, "opentimenode");
            return (Criteria) this;
        }

        public Criteria andOpentimenodeLessThanOrEqualTo(String value) {
            addCriterion("opentimenode <=", value, "opentimenode");
            return (Criteria) this;
        }

        public Criteria andOpentimenodeLike(String value) {
            addCriterion("opentimenode like", value, "opentimenode");
            return (Criteria) this;
        }

        public Criteria andOpentimenodeNotLike(String value) {
            addCriterion("opentimenode not like", value, "opentimenode");
            return (Criteria) this;
        }

        public Criteria andOpentimenodeIn(List<String> values) {
            addCriterion("opentimenode in", values, "opentimenode");
            return (Criteria) this;
        }

        public Criteria andOpentimenodeNotIn(List<String> values) {
            addCriterion("opentimenode not in", values, "opentimenode");
            return (Criteria) this;
        }

        public Criteria andOpentimenodeBetween(String value1, String value2) {
            addCriterion("opentimenode between", value1, value2, "opentimenode");
            return (Criteria) this;
        }

        public Criteria andOpentimenodeNotBetween(String value1, String value2) {
            addCriterion("opentimenode not between", value1, value2, "opentimenode");
            return (Criteria) this;
        }

        public Criteria andAllowsetIsNull() {
            addCriterion("allowset is null");
            return (Criteria) this;
        }

        public Criteria andAllowsetIsNotNull() {
            addCriterion("allowset is not null");
            return (Criteria) this;
        }

        public Criteria andAllowsetEqualTo(String value) {
            addCriterion("allowset =", value, "allowset");
            return (Criteria) this;
        }

        public Criteria andAllowsetNotEqualTo(String value) {
            addCriterion("allowset <>", value, "allowset");
            return (Criteria) this;
        }

        public Criteria andAllowsetGreaterThan(String value) {
            addCriterion("allowset >", value, "allowset");
            return (Criteria) this;
        }

        public Criteria andAllowsetGreaterThanOrEqualTo(String value) {
            addCriterion("allowset >=", value, "allowset");
            return (Criteria) this;
        }

        public Criteria andAllowsetLessThan(String value) {
            addCriterion("allowset <", value, "allowset");
            return (Criteria) this;
        }

        public Criteria andAllowsetLessThanOrEqualTo(String value) {
            addCriterion("allowset <=", value, "allowset");
            return (Criteria) this;
        }

        public Criteria andAllowsetLike(String value) {
            addCriterion("allowset like", value, "allowset");
            return (Criteria) this;
        }

        public Criteria andAllowsetNotLike(String value) {
            addCriterion("allowset not like", value, "allowset");
            return (Criteria) this;
        }

        public Criteria andAllowsetIn(List<String> values) {
            addCriterion("allowset in", values, "allowset");
            return (Criteria) this;
        }

        public Criteria andAllowsetNotIn(List<String> values) {
            addCriterion("allowset not in", values, "allowset");
            return (Criteria) this;
        }

        public Criteria andAllowsetBetween(String value1, String value2) {
            addCriterion("allowset between", value1, value2, "allowset");
            return (Criteria) this;
        }

        public Criteria andAllowsetNotBetween(String value1, String value2) {
            addCriterion("allowset not between", value1, value2, "allowset");
            return (Criteria) this;
        }

        public Criteria andCreatetimeIsNull() {
            addCriterion("createtime is null");
            return (Criteria) this;
        }

        public Criteria andCreatetimeIsNotNull() {
            addCriterion("createtime is not null");
            return (Criteria) this;
        }

        public Criteria andCreatetimeEqualTo(Date value) {
            addCriterion("createtime =", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeNotEqualTo(Date value) {
            addCriterion("createtime <>", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeGreaterThan(Date value) {
            addCriterion("createtime >", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeGreaterThanOrEqualTo(Date value) {
            addCriterion("createtime >=", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeLessThan(Date value) {
            addCriterion("createtime <", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeLessThanOrEqualTo(Date value) {
            addCriterion("createtime <=", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeIn(List<Date> values) {
            addCriterion("createtime in", values, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeNotIn(List<Date> values) {
            addCriterion("createtime not in", values, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeBetween(Date value1, Date value2) {
            addCriterion("createtime between", value1, value2, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeNotBetween(Date value1, Date value2) {
            addCriterion("createtime not between", value1, value2, "createtime");
            return (Criteria) this;
        }

        public Criteria andBegintimeIsNull() {
            addCriterion("begintime is null");
            return (Criteria) this;
        }

        public Criteria andBegintimeIsNotNull() {
            addCriterion("begintime is not null");
            return (Criteria) this;
        }

        public Criteria andBegintimeEqualTo(Date value) {
            addCriterion("begintime =", value, "begintime");
            return (Criteria) this;
        }

        public Criteria andBegintimeNotEqualTo(Date value) {
            addCriterion("begintime <>", value, "begintime");
            return (Criteria) this;
        }

        public Criteria andBegintimeGreaterThan(Date value) {
            addCriterion("begintime >", value, "begintime");
            return (Criteria) this;
        }

        public Criteria andBegintimeGreaterThanOrEqualTo(Date value) {
            addCriterion("begintime >=", value, "begintime");
            return (Criteria) this;
        }

        public Criteria andBegintimeLessThan(Date value) {
            addCriterion("begintime <", value, "begintime");
            return (Criteria) this;
        }

        public Criteria andBegintimeLessThanOrEqualTo(Date value) {
            addCriterion("begintime <=", value, "begintime");
            return (Criteria) this;
        }

        public Criteria andBegintimeIn(List<Date> values) {
            addCriterion("begintime in", values, "begintime");
            return (Criteria) this;
        }

        public Criteria andBegintimeNotIn(List<Date> values) {
            addCriterion("begintime not in", values, "begintime");
            return (Criteria) this;
        }

        public Criteria andBegintimeBetween(Date value1, Date value2) {
            addCriterion("begintime between", value1, value2, "begintime");
            return (Criteria) this;
        }

        public Criteria andBegintimeNotBetween(Date value1, Date value2) {
            addCriterion("begintime not between", value1, value2, "begintime");
            return (Criteria) this;
        }

        public Criteria andEndtimeIsNull() {
            addCriterion("endtime is null");
            return (Criteria) this;
        }

        public Criteria andEndtimeIsNotNull() {
            addCriterion("endtime is not null");
            return (Criteria) this;
        }

        public Criteria andEndtimeEqualTo(Date value) {
            addCriterion("endtime =", value, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeNotEqualTo(Date value) {
            addCriterion("endtime <>", value, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeGreaterThan(Date value) {
            addCriterion("endtime >", value, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeGreaterThanOrEqualTo(Date value) {
            addCriterion("endtime >=", value, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeLessThan(Date value) {
            addCriterion("endtime <", value, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeLessThanOrEqualTo(Date value) {
            addCriterion("endtime <=", value, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeIn(List<Date> values) {
            addCriterion("endtime in", values, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeNotIn(List<Date> values) {
            addCriterion("endtime not in", values, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeBetween(Date value1, Date value2) {
            addCriterion("endtime between", value1, value2, "endtime");
            return (Criteria) this;
        }

        public Criteria andEndtimeNotBetween(Date value1, Date value2) {
            addCriterion("endtime not between", value1, value2, "endtime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeIsNull() {
            addCriterion("update_time is null");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeIsNotNull() {
            addCriterion("update_time is not null");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeEqualTo(Date value) {
            addCriterion("update_time =", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeNotEqualTo(Date value) {
            addCriterion("update_time <>", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeGreaterThan(Date value) {
            addCriterion("update_time >", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("update_time >=", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeLessThan(Date value) {
            addCriterion("update_time <", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeLessThanOrEqualTo(Date value) {
            addCriterion("update_time <=", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeIn(List<Date> values) {
            addCriterion("update_time in", values, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeNotIn(List<Date> values) {
            addCriterion("update_time not in", values, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeBetween(Date value1, Date value2) {
            addCriterion("update_time between", value1, value2, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeNotBetween(Date value1, Date value2) {
            addCriterion("update_time not between", value1, value2, "updateTime");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}