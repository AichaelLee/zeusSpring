package net.cnki.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ManagersExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ManagersExample() {
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

        public Criteria andMidIsNull() {
            addCriterion("MID is null");
            return (Criteria) this;
        }

        public Criteria andMidIsNotNull() {
            addCriterion("MID is not null");
            return (Criteria) this;
        }

        public Criteria andMidEqualTo(Integer value) {
            addCriterion("MID =", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidNotEqualTo(Integer value) {
            addCriterion("MID <>", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidGreaterThan(Integer value) {
            addCriterion("MID >", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidGreaterThanOrEqualTo(Integer value) {
            addCriterion("MID >=", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidLessThan(Integer value) {
            addCriterion("MID <", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidLessThanOrEqualTo(Integer value) {
            addCriterion("MID <=", value, "mid");
            return (Criteria) this;
        }

        public Criteria andMidIn(List<Integer> values) {
            addCriterion("MID in", values, "mid");
            return (Criteria) this;
        }

        public Criteria andMidNotIn(List<Integer> values) {
            addCriterion("MID not in", values, "mid");
            return (Criteria) this;
        }

        public Criteria andMidBetween(Integer value1, Integer value2) {
            addCriterion("MID between", value1, value2, "mid");
            return (Criteria) this;
        }

        public Criteria andMidNotBetween(Integer value1, Integer value2) {
            addCriterion("MID not between", value1, value2, "mid");
            return (Criteria) this;
        }

        public Criteria andUsernameIsNull() {
            addCriterion("username is null");
            return (Criteria) this;
        }

        public Criteria andUsernameIsNotNull() {
            addCriterion("username is not null");
            return (Criteria) this;
        }

        public Criteria andUsernameEqualTo(String value) {
            addCriterion("username =", value, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameNotEqualTo(String value) {
            addCriterion("username <>", value, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameGreaterThan(String value) {
            addCriterion("username >", value, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameGreaterThanOrEqualTo(String value) {
            addCriterion("username >=", value, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameLessThan(String value) {
            addCriterion("username <", value, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameLessThanOrEqualTo(String value) {
            addCriterion("username <=", value, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameLike(String value) {
            addCriterion("username like", value, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameNotLike(String value) {
            addCriterion("username not like", value, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameIn(List<String> values) {
            addCriterion("username in", values, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameNotIn(List<String> values) {
            addCriterion("username not in", values, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameBetween(String value1, String value2) {
            addCriterion("username between", value1, value2, "username");
            return (Criteria) this;
        }

        public Criteria andUsernameNotBetween(String value1, String value2) {
            addCriterion("username not between", value1, value2, "username");
            return (Criteria) this;
        }

        public Criteria andPasswordIsNull() {
            addCriterion("password is null");
            return (Criteria) this;
        }

        public Criteria andPasswordIsNotNull() {
            addCriterion("password is not null");
            return (Criteria) this;
        }

        public Criteria andPasswordEqualTo(String value) {
            addCriterion("password =", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordNotEqualTo(String value) {
            addCriterion("password <>", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordGreaterThan(String value) {
            addCriterion("password >", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordGreaterThanOrEqualTo(String value) {
            addCriterion("password >=", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordLessThan(String value) {
            addCriterion("password <", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordLessThanOrEqualTo(String value) {
            addCriterion("password <=", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordLike(String value) {
            addCriterion("password like", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordNotLike(String value) {
            addCriterion("password not like", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordIn(List<String> values) {
            addCriterion("password in", values, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordNotIn(List<String> values) {
            addCriterion("password not in", values, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordBetween(String value1, String value2) {
            addCriterion("password between", value1, value2, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordNotBetween(String value1, String value2) {
            addCriterion("password not between", value1, value2, "password");
            return (Criteria) this;
        }

        public Criteria andNameIsNull() {
            addCriterion("name is null");
            return (Criteria) this;
        }

        public Criteria andNameIsNotNull() {
            addCriterion("name is not null");
            return (Criteria) this;
        }

        public Criteria andNameEqualTo(String value) {
            addCriterion("name =", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotEqualTo(String value) {
            addCriterion("name <>", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThan(String value) {
            addCriterion("name >", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThanOrEqualTo(String value) {
            addCriterion("name >=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThan(String value) {
            addCriterion("name <", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThanOrEqualTo(String value) {
            addCriterion("name <=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLike(String value) {
            addCriterion("name like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotLike(String value) {
            addCriterion("name not like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameIn(List<String> values) {
            addCriterion("name in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotIn(List<String> values) {
            addCriterion("name not in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameBetween(String value1, String value2) {
            addCriterion("name between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotBetween(String value1, String value2) {
            addCriterion("name not between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andMobileIsNull() {
            addCriterion("mobile is null");
            return (Criteria) this;
        }

        public Criteria andMobileIsNotNull() {
            addCriterion("mobile is not null");
            return (Criteria) this;
        }

        public Criteria andMobileEqualTo(String value) {
            addCriterion("mobile =", value, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileNotEqualTo(String value) {
            addCriterion("mobile <>", value, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileGreaterThan(String value) {
            addCriterion("mobile >", value, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileGreaterThanOrEqualTo(String value) {
            addCriterion("mobile >=", value, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileLessThan(String value) {
            addCriterion("mobile <", value, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileLessThanOrEqualTo(String value) {
            addCriterion("mobile <=", value, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileLike(String value) {
            addCriterion("mobile like", value, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileNotLike(String value) {
            addCriterion("mobile not like", value, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileIn(List<String> values) {
            addCriterion("mobile in", values, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileNotIn(List<String> values) {
            addCriterion("mobile not in", values, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileBetween(String value1, String value2) {
            addCriterion("mobile between", value1, value2, "mobile");
            return (Criteria) this;
        }

        public Criteria andMobileNotBetween(String value1, String value2) {
            addCriterion("mobile not between", value1, value2, "mobile");
            return (Criteria) this;
        }

        public Criteria andEmailIsNull() {
            addCriterion("email is null");
            return (Criteria) this;
        }

        public Criteria andEmailIsNotNull() {
            addCriterion("email is not null");
            return (Criteria) this;
        }

        public Criteria andEmailEqualTo(String value) {
            addCriterion("email =", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailNotEqualTo(String value) {
            addCriterion("email <>", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailGreaterThan(String value) {
            addCriterion("email >", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailGreaterThanOrEqualTo(String value) {
            addCriterion("email >=", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailLessThan(String value) {
            addCriterion("email <", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailLessThanOrEqualTo(String value) {
            addCriterion("email <=", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailLike(String value) {
            addCriterion("email like", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailNotLike(String value) {
            addCriterion("email not like", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailIn(List<String> values) {
            addCriterion("email in", values, "email");
            return (Criteria) this;
        }

        public Criteria andEmailNotIn(List<String> values) {
            addCriterion("email not in", values, "email");
            return (Criteria) this;
        }

        public Criteria andEmailBetween(String value1, String value2) {
            addCriterion("email between", value1, value2, "email");
            return (Criteria) this;
        }

        public Criteria andEmailNotBetween(String value1, String value2) {
            addCriterion("email not between", value1, value2, "email");
            return (Criteria) this;
        }

        public Criteria andSchoolNumberIsNull() {
            addCriterion("school_number is null");
            return (Criteria) this;
        }

        public Criteria andSchoolNumberIsNotNull() {
            addCriterion("school_number is not null");
            return (Criteria) this;
        }

        public Criteria andSchoolNumberEqualTo(Integer value) {
            addCriterion("school_number =", value, "schoolNumber");
            return (Criteria) this;
        }

        public Criteria andSchoolNumberNotEqualTo(Integer value) {
            addCriterion("school_number <>", value, "schoolNumber");
            return (Criteria) this;
        }

        public Criteria andSchoolNumberGreaterThan(Integer value) {
            addCriterion("school_number >", value, "schoolNumber");
            return (Criteria) this;
        }

        public Criteria andSchoolNumberGreaterThanOrEqualTo(Integer value) {
            addCriterion("school_number >=", value, "schoolNumber");
            return (Criteria) this;
        }

        public Criteria andSchoolNumberLessThan(Integer value) {
            addCriterion("school_number <", value, "schoolNumber");
            return (Criteria) this;
        }

        public Criteria andSchoolNumberLessThanOrEqualTo(Integer value) {
            addCriterion("school_number <=", value, "schoolNumber");
            return (Criteria) this;
        }

        public Criteria andSchoolNumberIn(List<Integer> values) {
            addCriterion("school_number in", values, "schoolNumber");
            return (Criteria) this;
        }

        public Criteria andSchoolNumberNotIn(List<Integer> values) {
            addCriterion("school_number not in", values, "schoolNumber");
            return (Criteria) this;
        }

        public Criteria andSchoolNumberBetween(Integer value1, Integer value2) {
            addCriterion("school_number between", value1, value2, "schoolNumber");
            return (Criteria) this;
        }

        public Criteria andSchoolNumberNotBetween(Integer value1, Integer value2) {
            addCriterion("school_number not between", value1, value2, "schoolNumber");
            return (Criteria) this;
        }

        public Criteria andServersNumberIsNull() {
            addCriterion("servers_number is null");
            return (Criteria) this;
        }

        public Criteria andServersNumberIsNotNull() {
            addCriterion("servers_number is not null");
            return (Criteria) this;
        }

        public Criteria andServersNumberEqualTo(Integer value) {
            addCriterion("servers_number =", value, "serversNumber");
            return (Criteria) this;
        }

        public Criteria andServersNumberNotEqualTo(Integer value) {
            addCriterion("servers_number <>", value, "serversNumber");
            return (Criteria) this;
        }

        public Criteria andServersNumberGreaterThan(Integer value) {
            addCriterion("servers_number >", value, "serversNumber");
            return (Criteria) this;
        }

        public Criteria andServersNumberGreaterThanOrEqualTo(Integer value) {
            addCriterion("servers_number >=", value, "serversNumber");
            return (Criteria) this;
        }

        public Criteria andServersNumberLessThan(Integer value) {
            addCriterion("servers_number <", value, "serversNumber");
            return (Criteria) this;
        }

        public Criteria andServersNumberLessThanOrEqualTo(Integer value) {
            addCriterion("servers_number <=", value, "serversNumber");
            return (Criteria) this;
        }

        public Criteria andServersNumberIn(List<Integer> values) {
            addCriterion("servers_number in", values, "serversNumber");
            return (Criteria) this;
        }

        public Criteria andServersNumberNotIn(List<Integer> values) {
            addCriterion("servers_number not in", values, "serversNumber");
            return (Criteria) this;
        }

        public Criteria andServersNumberBetween(Integer value1, Integer value2) {
            addCriterion("servers_number between", value1, value2, "serversNumber");
            return (Criteria) this;
        }

        public Criteria andServersNumberNotBetween(Integer value1, Integer value2) {
            addCriterion("servers_number not between", value1, value2, "serversNumber");
            return (Criteria) this;
        }

        public Criteria andLoginIpIsNull() {
            addCriterion("login_ip is null");
            return (Criteria) this;
        }

        public Criteria andLoginIpIsNotNull() {
            addCriterion("login_ip is not null");
            return (Criteria) this;
        }

        public Criteria andLoginIpEqualTo(String value) {
            addCriterion("login_ip =", value, "loginIp");
            return (Criteria) this;
        }

        public Criteria andLoginIpNotEqualTo(String value) {
            addCriterion("login_ip <>", value, "loginIp");
            return (Criteria) this;
        }

        public Criteria andLoginIpGreaterThan(String value) {
            addCriterion("login_ip >", value, "loginIp");
            return (Criteria) this;
        }

        public Criteria andLoginIpGreaterThanOrEqualTo(String value) {
            addCriterion("login_ip >=", value, "loginIp");
            return (Criteria) this;
        }

        public Criteria andLoginIpLessThan(String value) {
            addCriterion("login_ip <", value, "loginIp");
            return (Criteria) this;
        }

        public Criteria andLoginIpLessThanOrEqualTo(String value) {
            addCriterion("login_ip <=", value, "loginIp");
            return (Criteria) this;
        }

        public Criteria andLoginIpLike(String value) {
            addCriterion("login_ip like", value, "loginIp");
            return (Criteria) this;
        }

        public Criteria andLoginIpNotLike(String value) {
            addCriterion("login_ip not like", value, "loginIp");
            return (Criteria) this;
        }

        public Criteria andLoginIpIn(List<String> values) {
            addCriterion("login_ip in", values, "loginIp");
            return (Criteria) this;
        }

        public Criteria andLoginIpNotIn(List<String> values) {
            addCriterion("login_ip not in", values, "loginIp");
            return (Criteria) this;
        }

        public Criteria andLoginIpBetween(String value1, String value2) {
            addCriterion("login_ip between", value1, value2, "loginIp");
            return (Criteria) this;
        }

        public Criteria andLoginIpNotBetween(String value1, String value2) {
            addCriterion("login_ip not between", value1, value2, "loginIp");
            return (Criteria) this;
        }

        public Criteria andAuthorityIsNull() {
            addCriterion("authority is null");
            return (Criteria) this;
        }

        public Criteria andAuthorityIsNotNull() {
            addCriterion("authority is not null");
            return (Criteria) this;
        }

        public Criteria andAuthorityEqualTo(Integer value) {
            addCriterion("authority =", value, "authority");
            return (Criteria) this;
        }

        public Criteria andAuthorityNotEqualTo(Integer value) {
            addCriterion("authority <>", value, "authority");
            return (Criteria) this;
        }

        public Criteria andAuthorityGreaterThan(Integer value) {
            addCriterion("authority >", value, "authority");
            return (Criteria) this;
        }

        public Criteria andAuthorityGreaterThanOrEqualTo(Integer value) {
            addCriterion("authority >=", value, "authority");
            return (Criteria) this;
        }

        public Criteria andAuthorityLessThan(Integer value) {
            addCriterion("authority <", value, "authority");
            return (Criteria) this;
        }

        public Criteria andAuthorityLessThanOrEqualTo(Integer value) {
            addCriterion("authority <=", value, "authority");
            return (Criteria) this;
        }

        public Criteria andAuthorityIn(List<Integer> values) {
            addCriterion("authority in", values, "authority");
            return (Criteria) this;
        }

        public Criteria andAuthorityNotIn(List<Integer> values) {
            addCriterion("authority not in", values, "authority");
            return (Criteria) this;
        }

        public Criteria andAuthorityBetween(Integer value1, Integer value2) {
            addCriterion("authority between", value1, value2, "authority");
            return (Criteria) this;
        }

        public Criteria andAuthorityNotBetween(Integer value1, Integer value2) {
            addCriterion("authority not between", value1, value2, "authority");
            return (Criteria) this;
        }

        public Criteria andStatusIsNull() {
            addCriterion("status is null");
            return (Criteria) this;
        }

        public Criteria andStatusIsNotNull() {
            addCriterion("status is not null");
            return (Criteria) this;
        }

        public Criteria andStatusEqualTo(Integer value) {
            addCriterion("status =", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotEqualTo(Integer value) {
            addCriterion("status <>", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThan(Integer value) {
            addCriterion("status >", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("status >=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThan(Integer value) {
            addCriterion("status <", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThanOrEqualTo(Integer value) {
            addCriterion("status <=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusIn(List<Integer> values) {
            addCriterion("status in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotIn(List<Integer> values) {
            addCriterion("status not in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusBetween(Integer value1, Integer value2) {
            addCriterion("status between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotBetween(Integer value1, Integer value2) {
            addCriterion("status not between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andExpireDateIsNull() {
            addCriterion("expire_date is null");
            return (Criteria) this;
        }

        public Criteria andExpireDateIsNotNull() {
            addCriterion("expire_date is not null");
            return (Criteria) this;
        }

        public Criteria andExpireDateEqualTo(Date value) {
            addCriterion("expire_date =", value, "expireDate");
            return (Criteria) this;
        }

        public Criteria andExpireDateNotEqualTo(Date value) {
            addCriterion("expire_date <>", value, "expireDate");
            return (Criteria) this;
        }

        public Criteria andExpireDateGreaterThan(Date value) {
            addCriterion("expire_date >", value, "expireDate");
            return (Criteria) this;
        }

        public Criteria andExpireDateGreaterThanOrEqualTo(Date value) {
            addCriterion("expire_date >=", value, "expireDate");
            return (Criteria) this;
        }

        public Criteria andExpireDateLessThan(Date value) {
            addCriterion("expire_date <", value, "expireDate");
            return (Criteria) this;
        }

        public Criteria andExpireDateLessThanOrEqualTo(Date value) {
            addCriterion("expire_date <=", value, "expireDate");
            return (Criteria) this;
        }

        public Criteria andExpireDateIn(List<Date> values) {
            addCriterion("expire_date in", values, "expireDate");
            return (Criteria) this;
        }

        public Criteria andExpireDateNotIn(List<Date> values) {
            addCriterion("expire_date not in", values, "expireDate");
            return (Criteria) this;
        }

        public Criteria andExpireDateBetween(Date value1, Date value2) {
            addCriterion("expire_date between", value1, value2, "expireDate");
            return (Criteria) this;
        }

        public Criteria andExpireDateNotBetween(Date value1, Date value2) {
            addCriterion("expire_date not between", value1, value2, "expireDate");
            return (Criteria) this;
        }

        public Criteria andLoginTokenIsNull() {
            addCriterion("login_token is null");
            return (Criteria) this;
        }

        public Criteria andLoginTokenIsNotNull() {
            addCriterion("login_token is not null");
            return (Criteria) this;
        }

        public Criteria andLoginTokenEqualTo(String value) {
            addCriterion("login_token =", value, "loginToken");
            return (Criteria) this;
        }

        public Criteria andLoginTokenNotEqualTo(String value) {
            addCriterion("login_token <>", value, "loginToken");
            return (Criteria) this;
        }

        public Criteria andLoginTokenGreaterThan(String value) {
            addCriterion("login_token >", value, "loginToken");
            return (Criteria) this;
        }

        public Criteria andLoginTokenGreaterThanOrEqualTo(String value) {
            addCriterion("login_token >=", value, "loginToken");
            return (Criteria) this;
        }

        public Criteria andLoginTokenLessThan(String value) {
            addCriterion("login_token <", value, "loginToken");
            return (Criteria) this;
        }

        public Criteria andLoginTokenLessThanOrEqualTo(String value) {
            addCriterion("login_token <=", value, "loginToken");
            return (Criteria) this;
        }

        public Criteria andLoginTokenLike(String value) {
            addCriterion("login_token like", value, "loginToken");
            return (Criteria) this;
        }

        public Criteria andLoginTokenNotLike(String value) {
            addCriterion("login_token not like", value, "loginToken");
            return (Criteria) this;
        }

        public Criteria andLoginTokenIn(List<String> values) {
            addCriterion("login_token in", values, "loginToken");
            return (Criteria) this;
        }

        public Criteria andLoginTokenNotIn(List<String> values) {
            addCriterion("login_token not in", values, "loginToken");
            return (Criteria) this;
        }

        public Criteria andLoginTokenBetween(String value1, String value2) {
            addCriterion("login_token between", value1, value2, "loginToken");
            return (Criteria) this;
        }

        public Criteria andLoginTokenNotBetween(String value1, String value2) {
            addCriterion("login_token not between", value1, value2, "loginToken");
            return (Criteria) this;
        }

        public Criteria andPrefixIsNull() {
            addCriterion("prefix is null");
            return (Criteria) this;
        }

        public Criteria andPrefixIsNotNull() {
            addCriterion("prefix is not null");
            return (Criteria) this;
        }

        public Criteria andPrefixEqualTo(String value) {
            addCriterion("prefix =", value, "prefix");
            return (Criteria) this;
        }

        public Criteria andPrefixNotEqualTo(String value) {
            addCriterion("prefix <>", value, "prefix");
            return (Criteria) this;
        }

        public Criteria andPrefixGreaterThan(String value) {
            addCriterion("prefix >", value, "prefix");
            return (Criteria) this;
        }

        public Criteria andPrefixGreaterThanOrEqualTo(String value) {
            addCriterion("prefix >=", value, "prefix");
            return (Criteria) this;
        }

        public Criteria andPrefixLessThan(String value) {
            addCriterion("prefix <", value, "prefix");
            return (Criteria) this;
        }

        public Criteria andPrefixLessThanOrEqualTo(String value) {
            addCriterion("prefix <=", value, "prefix");
            return (Criteria) this;
        }

        public Criteria andPrefixLike(String value) {
            addCriterion("prefix like", value, "prefix");
            return (Criteria) this;
        }

        public Criteria andPrefixNotLike(String value) {
            addCriterion("prefix not like", value, "prefix");
            return (Criteria) this;
        }

        public Criteria andPrefixIn(List<String> values) {
            addCriterion("prefix in", values, "prefix");
            return (Criteria) this;
        }

        public Criteria andPrefixNotIn(List<String> values) {
            addCriterion("prefix not in", values, "prefix");
            return (Criteria) this;
        }

        public Criteria andPrefixBetween(String value1, String value2) {
            addCriterion("prefix between", value1, value2, "prefix");
            return (Criteria) this;
        }

        public Criteria andPrefixNotBetween(String value1, String value2) {
            addCriterion("prefix not between", value1, value2, "prefix");
            return (Criteria) this;
        }

        public Criteria andVerifyUsernameIsNull() {
            addCriterion("verify_username is null");
            return (Criteria) this;
        }

        public Criteria andVerifyUsernameIsNotNull() {
            addCriterion("verify_username is not null");
            return (Criteria) this;
        }

        public Criteria andVerifyUsernameEqualTo(String value) {
            addCriterion("verify_username =", value, "verifyUsername");
            return (Criteria) this;
        }

        public Criteria andVerifyUsernameNotEqualTo(String value) {
            addCriterion("verify_username <>", value, "verifyUsername");
            return (Criteria) this;
        }

        public Criteria andVerifyUsernameGreaterThan(String value) {
            addCriterion("verify_username >", value, "verifyUsername");
            return (Criteria) this;
        }

        public Criteria andVerifyUsernameGreaterThanOrEqualTo(String value) {
            addCriterion("verify_username >=", value, "verifyUsername");
            return (Criteria) this;
        }

        public Criteria andVerifyUsernameLessThan(String value) {
            addCriterion("verify_username <", value, "verifyUsername");
            return (Criteria) this;
        }

        public Criteria andVerifyUsernameLessThanOrEqualTo(String value) {
            addCriterion("verify_username <=", value, "verifyUsername");
            return (Criteria) this;
        }

        public Criteria andVerifyUsernameLike(String value) {
            addCriterion("verify_username like", value, "verifyUsername");
            return (Criteria) this;
        }

        public Criteria andVerifyUsernameNotLike(String value) {
            addCriterion("verify_username not like", value, "verifyUsername");
            return (Criteria) this;
        }

        public Criteria andVerifyUsernameIn(List<String> values) {
            addCriterion("verify_username in", values, "verifyUsername");
            return (Criteria) this;
        }

        public Criteria andVerifyUsernameNotIn(List<String> values) {
            addCriterion("verify_username not in", values, "verifyUsername");
            return (Criteria) this;
        }

        public Criteria andVerifyUsernameBetween(String value1, String value2) {
            addCriterion("verify_username between", value1, value2, "verifyUsername");
            return (Criteria) this;
        }

        public Criteria andVerifyUsernameNotBetween(String value1, String value2) {
            addCriterion("verify_username not between", value1, value2, "verifyUsername");
            return (Criteria) this;
        }

        public Criteria andVerifyPasswordIsNull() {
            addCriterion("verify_password is null");
            return (Criteria) this;
        }

        public Criteria andVerifyPasswordIsNotNull() {
            addCriterion("verify_password is not null");
            return (Criteria) this;
        }

        public Criteria andVerifyPasswordEqualTo(String value) {
            addCriterion("verify_password =", value, "verifyPassword");
            return (Criteria) this;
        }

        public Criteria andVerifyPasswordNotEqualTo(String value) {
            addCriterion("verify_password <>", value, "verifyPassword");
            return (Criteria) this;
        }

        public Criteria andVerifyPasswordGreaterThan(String value) {
            addCriterion("verify_password >", value, "verifyPassword");
            return (Criteria) this;
        }

        public Criteria andVerifyPasswordGreaterThanOrEqualTo(String value) {
            addCriterion("verify_password >=", value, "verifyPassword");
            return (Criteria) this;
        }

        public Criteria andVerifyPasswordLessThan(String value) {
            addCriterion("verify_password <", value, "verifyPassword");
            return (Criteria) this;
        }

        public Criteria andVerifyPasswordLessThanOrEqualTo(String value) {
            addCriterion("verify_password <=", value, "verifyPassword");
            return (Criteria) this;
        }

        public Criteria andVerifyPasswordLike(String value) {
            addCriterion("verify_password like", value, "verifyPassword");
            return (Criteria) this;
        }

        public Criteria andVerifyPasswordNotLike(String value) {
            addCriterion("verify_password not like", value, "verifyPassword");
            return (Criteria) this;
        }

        public Criteria andVerifyPasswordIn(List<String> values) {
            addCriterion("verify_password in", values, "verifyPassword");
            return (Criteria) this;
        }

        public Criteria andVerifyPasswordNotIn(List<String> values) {
            addCriterion("verify_password not in", values, "verifyPassword");
            return (Criteria) this;
        }

        public Criteria andVerifyPasswordBetween(String value1, String value2) {
            addCriterion("verify_password between", value1, value2, "verifyPassword");
            return (Criteria) this;
        }

        public Criteria andVerifyPasswordNotBetween(String value1, String value2) {
            addCriterion("verify_password not between", value1, value2, "verifyPassword");
            return (Criteria) this;
        }

        public Criteria andTokenIsNull() {
            addCriterion("token is null");
            return (Criteria) this;
        }

        public Criteria andTokenIsNotNull() {
            addCriterion("token is not null");
            return (Criteria) this;
        }

        public Criteria andTokenEqualTo(String value) {
            addCriterion("token =", value, "token");
            return (Criteria) this;
        }

        public Criteria andTokenNotEqualTo(String value) {
            addCriterion("token <>", value, "token");
            return (Criteria) this;
        }

        public Criteria andTokenGreaterThan(String value) {
            addCriterion("token >", value, "token");
            return (Criteria) this;
        }

        public Criteria andTokenGreaterThanOrEqualTo(String value) {
            addCriterion("token >=", value, "token");
            return (Criteria) this;
        }

        public Criteria andTokenLessThan(String value) {
            addCriterion("token <", value, "token");
            return (Criteria) this;
        }

        public Criteria andTokenLessThanOrEqualTo(String value) {
            addCriterion("token <=", value, "token");
            return (Criteria) this;
        }

        public Criteria andTokenLike(String value) {
            addCriterion("token like", value, "token");
            return (Criteria) this;
        }

        public Criteria andTokenNotLike(String value) {
            addCriterion("token not like", value, "token");
            return (Criteria) this;
        }

        public Criteria andTokenIn(List<String> values) {
            addCriterion("token in", values, "token");
            return (Criteria) this;
        }

        public Criteria andTokenNotIn(List<String> values) {
            addCriterion("token not in", values, "token");
            return (Criteria) this;
        }

        public Criteria andTokenBetween(String value1, String value2) {
            addCriterion("token between", value1, value2, "token");
            return (Criteria) this;
        }

        public Criteria andTokenNotBetween(String value1, String value2) {
            addCriterion("token not between", value1, value2, "token");
            return (Criteria) this;
        }

        public Criteria andDbIpIsNull() {
            addCriterion("db_ip is null");
            return (Criteria) this;
        }

        public Criteria andDbIpIsNotNull() {
            addCriterion("db_ip is not null");
            return (Criteria) this;
        }

        public Criteria andDbIpEqualTo(String value) {
            addCriterion("db_ip =", value, "dbIp");
            return (Criteria) this;
        }

        public Criteria andDbIpNotEqualTo(String value) {
            addCriterion("db_ip <>", value, "dbIp");
            return (Criteria) this;
        }

        public Criteria andDbIpGreaterThan(String value) {
            addCriterion("db_ip >", value, "dbIp");
            return (Criteria) this;
        }

        public Criteria andDbIpGreaterThanOrEqualTo(String value) {
            addCriterion("db_ip >=", value, "dbIp");
            return (Criteria) this;
        }

        public Criteria andDbIpLessThan(String value) {
            addCriterion("db_ip <", value, "dbIp");
            return (Criteria) this;
        }

        public Criteria andDbIpLessThanOrEqualTo(String value) {
            addCriterion("db_ip <=", value, "dbIp");
            return (Criteria) this;
        }

        public Criteria andDbIpLike(String value) {
            addCriterion("db_ip like", value, "dbIp");
            return (Criteria) this;
        }

        public Criteria andDbIpNotLike(String value) {
            addCriterion("db_ip not like", value, "dbIp");
            return (Criteria) this;
        }

        public Criteria andDbIpIn(List<String> values) {
            addCriterion("db_ip in", values, "dbIp");
            return (Criteria) this;
        }

        public Criteria andDbIpNotIn(List<String> values) {
            addCriterion("db_ip not in", values, "dbIp");
            return (Criteria) this;
        }

        public Criteria andDbIpBetween(String value1, String value2) {
            addCriterion("db_ip between", value1, value2, "dbIp");
            return (Criteria) this;
        }

        public Criteria andDbIpNotBetween(String value1, String value2) {
            addCriterion("db_ip not between", value1, value2, "dbIp");
            return (Criteria) this;
        }

        public Criteria andDbNameIsNull() {
            addCriterion("db_name is null");
            return (Criteria) this;
        }

        public Criteria andDbNameIsNotNull() {
            addCriterion("db_name is not null");
            return (Criteria) this;
        }

        public Criteria andDbNameEqualTo(String value) {
            addCriterion("db_name =", value, "dbName");
            return (Criteria) this;
        }

        public Criteria andDbNameNotEqualTo(String value) {
            addCriterion("db_name <>", value, "dbName");
            return (Criteria) this;
        }

        public Criteria andDbNameGreaterThan(String value) {
            addCriterion("db_name >", value, "dbName");
            return (Criteria) this;
        }

        public Criteria andDbNameGreaterThanOrEqualTo(String value) {
            addCriterion("db_name >=", value, "dbName");
            return (Criteria) this;
        }

        public Criteria andDbNameLessThan(String value) {
            addCriterion("db_name <", value, "dbName");
            return (Criteria) this;
        }

        public Criteria andDbNameLessThanOrEqualTo(String value) {
            addCriterion("db_name <=", value, "dbName");
            return (Criteria) this;
        }

        public Criteria andDbNameLike(String value) {
            addCriterion("db_name like", value, "dbName");
            return (Criteria) this;
        }

        public Criteria andDbNameNotLike(String value) {
            addCriterion("db_name not like", value, "dbName");
            return (Criteria) this;
        }

        public Criteria andDbNameIn(List<String> values) {
            addCriterion("db_name in", values, "dbName");
            return (Criteria) this;
        }

        public Criteria andDbNameNotIn(List<String> values) {
            addCriterion("db_name not in", values, "dbName");
            return (Criteria) this;
        }

        public Criteria andDbNameBetween(String value1, String value2) {
            addCriterion("db_name between", value1, value2, "dbName");
            return (Criteria) this;
        }

        public Criteria andDbNameNotBetween(String value1, String value2) {
            addCriterion("db_name not between", value1, value2, "dbName");
            return (Criteria) this;
        }

        public Criteria andVerifyUsername2IsNull() {
            addCriterion("verify_username2 is null");
            return (Criteria) this;
        }

        public Criteria andVerifyUsername2IsNotNull() {
            addCriterion("verify_username2 is not null");
            return (Criteria) this;
        }

        public Criteria andVerifyUsername2EqualTo(String value) {
            addCriterion("verify_username2 =", value, "verifyUsername2");
            return (Criteria) this;
        }

        public Criteria andVerifyUsername2NotEqualTo(String value) {
            addCriterion("verify_username2 <>", value, "verifyUsername2");
            return (Criteria) this;
        }

        public Criteria andVerifyUsername2GreaterThan(String value) {
            addCriterion("verify_username2 >", value, "verifyUsername2");
            return (Criteria) this;
        }

        public Criteria andVerifyUsername2GreaterThanOrEqualTo(String value) {
            addCriterion("verify_username2 >=", value, "verifyUsername2");
            return (Criteria) this;
        }

        public Criteria andVerifyUsername2LessThan(String value) {
            addCriterion("verify_username2 <", value, "verifyUsername2");
            return (Criteria) this;
        }

        public Criteria andVerifyUsername2LessThanOrEqualTo(String value) {
            addCriterion("verify_username2 <=", value, "verifyUsername2");
            return (Criteria) this;
        }

        public Criteria andVerifyUsername2Like(String value) {
            addCriterion("verify_username2 like", value, "verifyUsername2");
            return (Criteria) this;
        }

        public Criteria andVerifyUsername2NotLike(String value) {
            addCriterion("verify_username2 not like", value, "verifyUsername2");
            return (Criteria) this;
        }

        public Criteria andVerifyUsername2In(List<String> values) {
            addCriterion("verify_username2 in", values, "verifyUsername2");
            return (Criteria) this;
        }

        public Criteria andVerifyUsername2NotIn(List<String> values) {
            addCriterion("verify_username2 not in", values, "verifyUsername2");
            return (Criteria) this;
        }

        public Criteria andVerifyUsername2Between(String value1, String value2) {
            addCriterion("verify_username2 between", value1, value2, "verifyUsername2");
            return (Criteria) this;
        }

        public Criteria andVerifyUsername2NotBetween(String value1, String value2) {
            addCriterion("verify_username2 not between", value1, value2, "verifyUsername2");
            return (Criteria) this;
        }

        public Criteria andVerifyPassword2IsNull() {
            addCriterion("verify_password2 is null");
            return (Criteria) this;
        }

        public Criteria andVerifyPassword2IsNotNull() {
            addCriterion("verify_password2 is not null");
            return (Criteria) this;
        }

        public Criteria andVerifyPassword2EqualTo(String value) {
            addCriterion("verify_password2 =", value, "verifyPassword2");
            return (Criteria) this;
        }

        public Criteria andVerifyPassword2NotEqualTo(String value) {
            addCriterion("verify_password2 <>", value, "verifyPassword2");
            return (Criteria) this;
        }

        public Criteria andVerifyPassword2GreaterThan(String value) {
            addCriterion("verify_password2 >", value, "verifyPassword2");
            return (Criteria) this;
        }

        public Criteria andVerifyPassword2GreaterThanOrEqualTo(String value) {
            addCriterion("verify_password2 >=", value, "verifyPassword2");
            return (Criteria) this;
        }

        public Criteria andVerifyPassword2LessThan(String value) {
            addCriterion("verify_password2 <", value, "verifyPassword2");
            return (Criteria) this;
        }

        public Criteria andVerifyPassword2LessThanOrEqualTo(String value) {
            addCriterion("verify_password2 <=", value, "verifyPassword2");
            return (Criteria) this;
        }

        public Criteria andVerifyPassword2Like(String value) {
            addCriterion("verify_password2 like", value, "verifyPassword2");
            return (Criteria) this;
        }

        public Criteria andVerifyPassword2NotLike(String value) {
            addCriterion("verify_password2 not like", value, "verifyPassword2");
            return (Criteria) this;
        }

        public Criteria andVerifyPassword2In(List<String> values) {
            addCriterion("verify_password2 in", values, "verifyPassword2");
            return (Criteria) this;
        }

        public Criteria andVerifyPassword2NotIn(List<String> values) {
            addCriterion("verify_password2 not in", values, "verifyPassword2");
            return (Criteria) this;
        }

        public Criteria andVerifyPassword2Between(String value1, String value2) {
            addCriterion("verify_password2 between", value1, value2, "verifyPassword2");
            return (Criteria) this;
        }

        public Criteria andVerifyPassword2NotBetween(String value1, String value2) {
            addCriterion("verify_password2 not between", value1, value2, "verifyPassword2");
            return (Criteria) this;
        }

        public Criteria andVerifyAddress2IsNull() {
            addCriterion("verify_address2 is null");
            return (Criteria) this;
        }

        public Criteria andVerifyAddress2IsNotNull() {
            addCriterion("verify_address2 is not null");
            return (Criteria) this;
        }

        public Criteria andVerifyAddress2EqualTo(String value) {
            addCriterion("verify_address2 =", value, "verifyAddress2");
            return (Criteria) this;
        }

        public Criteria andVerifyAddress2NotEqualTo(String value) {
            addCriterion("verify_address2 <>", value, "verifyAddress2");
            return (Criteria) this;
        }

        public Criteria andVerifyAddress2GreaterThan(String value) {
            addCriterion("verify_address2 >", value, "verifyAddress2");
            return (Criteria) this;
        }

        public Criteria andVerifyAddress2GreaterThanOrEqualTo(String value) {
            addCriterion("verify_address2 >=", value, "verifyAddress2");
            return (Criteria) this;
        }

        public Criteria andVerifyAddress2LessThan(String value) {
            addCriterion("verify_address2 <", value, "verifyAddress2");
            return (Criteria) this;
        }

        public Criteria andVerifyAddress2LessThanOrEqualTo(String value) {
            addCriterion("verify_address2 <=", value, "verifyAddress2");
            return (Criteria) this;
        }

        public Criteria andVerifyAddress2Like(String value) {
            addCriterion("verify_address2 like", value, "verifyAddress2");
            return (Criteria) this;
        }

        public Criteria andVerifyAddress2NotLike(String value) {
            addCriterion("verify_address2 not like", value, "verifyAddress2");
            return (Criteria) this;
        }

        public Criteria andVerifyAddress2In(List<String> values) {
            addCriterion("verify_address2 in", values, "verifyAddress2");
            return (Criteria) this;
        }

        public Criteria andVerifyAddress2NotIn(List<String> values) {
            addCriterion("verify_address2 not in", values, "verifyAddress2");
            return (Criteria) this;
        }

        public Criteria andVerifyAddress2Between(String value1, String value2) {
            addCriterion("verify_address2 between", value1, value2, "verifyAddress2");
            return (Criteria) this;
        }

        public Criteria andVerifyAddress2NotBetween(String value1, String value2) {
            addCriterion("verify_address2 not between", value1, value2, "verifyAddress2");
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

        public Criteria andLastmodifytimeIsNull() {
            addCriterion("lastmodifytime is null");
            return (Criteria) this;
        }

        public Criteria andLastmodifytimeIsNotNull() {
            addCriterion("lastmodifytime is not null");
            return (Criteria) this;
        }

        public Criteria andLastmodifytimeEqualTo(Date value) {
            addCriterion("lastmodifytime =", value, "lastmodifytime");
            return (Criteria) this;
        }

        public Criteria andLastmodifytimeNotEqualTo(Date value) {
            addCriterion("lastmodifytime <>", value, "lastmodifytime");
            return (Criteria) this;
        }

        public Criteria andLastmodifytimeGreaterThan(Date value) {
            addCriterion("lastmodifytime >", value, "lastmodifytime");
            return (Criteria) this;
        }

        public Criteria andLastmodifytimeGreaterThanOrEqualTo(Date value) {
            addCriterion("lastmodifytime >=", value, "lastmodifytime");
            return (Criteria) this;
        }

        public Criteria andLastmodifytimeLessThan(Date value) {
            addCriterion("lastmodifytime <", value, "lastmodifytime");
            return (Criteria) this;
        }

        public Criteria andLastmodifytimeLessThanOrEqualTo(Date value) {
            addCriterion("lastmodifytime <=", value, "lastmodifytime");
            return (Criteria) this;
        }

        public Criteria andLastmodifytimeIn(List<Date> values) {
            addCriterion("lastmodifytime in", values, "lastmodifytime");
            return (Criteria) this;
        }

        public Criteria andLastmodifytimeNotIn(List<Date> values) {
            addCriterion("lastmodifytime not in", values, "lastmodifytime");
            return (Criteria) this;
        }

        public Criteria andLastmodifytimeBetween(Date value1, Date value2) {
            addCriterion("lastmodifytime between", value1, value2, "lastmodifytime");
            return (Criteria) this;
        }

        public Criteria andLastmodifytimeNotBetween(Date value1, Date value2) {
            addCriterion("lastmodifytime not between", value1, value2, "lastmodifytime");
            return (Criteria) this;
        }

        public Criteria andDisplayScnameIsNull() {
            addCriterion("display_scname is null");
            return (Criteria) this;
        }

        public Criteria andDisplayScnameIsNotNull() {
            addCriterion("display_scname is not null");
            return (Criteria) this;
        }

        public Criteria andDisplayScnameEqualTo(Integer value) {
            addCriterion("display_scname =", value, "displayScname");
            return (Criteria) this;
        }

        public Criteria andDisplayScnameNotEqualTo(Integer value) {
            addCriterion("display_scname <>", value, "displayScname");
            return (Criteria) this;
        }

        public Criteria andDisplayScnameGreaterThan(Integer value) {
            addCriterion("display_scname >", value, "displayScname");
            return (Criteria) this;
        }

        public Criteria andDisplayScnameGreaterThanOrEqualTo(Integer value) {
            addCriterion("display_scname >=", value, "displayScname");
            return (Criteria) this;
        }

        public Criteria andDisplayScnameLessThan(Integer value) {
            addCriterion("display_scname <", value, "displayScname");
            return (Criteria) this;
        }

        public Criteria andDisplayScnameLessThanOrEqualTo(Integer value) {
            addCriterion("display_scname <=", value, "displayScname");
            return (Criteria) this;
        }

        public Criteria andDisplayScnameIn(List<Integer> values) {
            addCriterion("display_scname in", values, "displayScname");
            return (Criteria) this;
        }

        public Criteria andDisplayScnameNotIn(List<Integer> values) {
            addCriterion("display_scname not in", values, "displayScname");
            return (Criteria) this;
        }

        public Criteria andDisplayScnameBetween(Integer value1, Integer value2) {
            addCriterion("display_scname between", value1, value2, "displayScname");
            return (Criteria) this;
        }

        public Criteria andDisplayScnameNotBetween(Integer value1, Integer value2) {
            addCriterion("display_scname not between", value1, value2, "displayScname");
            return (Criteria) this;
        }

        public Criteria andOpenScrivenerIsNull() {
            addCriterion("open_scrivener is null");
            return (Criteria) this;
        }

        public Criteria andOpenScrivenerIsNotNull() {
            addCriterion("open_scrivener is not null");
            return (Criteria) this;
        }

        public Criteria andOpenScrivenerEqualTo(Integer value) {
            addCriterion("open_scrivener =", value, "openScrivener");
            return (Criteria) this;
        }

        public Criteria andOpenScrivenerNotEqualTo(Integer value) {
            addCriterion("open_scrivener <>", value, "openScrivener");
            return (Criteria) this;
        }

        public Criteria andOpenScrivenerGreaterThan(Integer value) {
            addCriterion("open_scrivener >", value, "openScrivener");
            return (Criteria) this;
        }

        public Criteria andOpenScrivenerGreaterThanOrEqualTo(Integer value) {
            addCriterion("open_scrivener >=", value, "openScrivener");
            return (Criteria) this;
        }

        public Criteria andOpenScrivenerLessThan(Integer value) {
            addCriterion("open_scrivener <", value, "openScrivener");
            return (Criteria) this;
        }

        public Criteria andOpenScrivenerLessThanOrEqualTo(Integer value) {
            addCriterion("open_scrivener <=", value, "openScrivener");
            return (Criteria) this;
        }

        public Criteria andOpenScrivenerIn(List<Integer> values) {
            addCriterion("open_scrivener in", values, "openScrivener");
            return (Criteria) this;
        }

        public Criteria andOpenScrivenerNotIn(List<Integer> values) {
            addCriterion("open_scrivener not in", values, "openScrivener");
            return (Criteria) this;
        }

        public Criteria andOpenScrivenerBetween(Integer value1, Integer value2) {
            addCriterion("open_scrivener between", value1, value2, "openScrivener");
            return (Criteria) this;
        }

        public Criteria andOpenScrivenerNotBetween(Integer value1, Integer value2) {
            addCriterion("open_scrivener not between", value1, value2, "openScrivener");
            return (Criteria) this;
        }

        public Criteria andOpenScrivenerTimeIsNull() {
            addCriterion("open_scrivener_time is null");
            return (Criteria) this;
        }

        public Criteria andOpenScrivenerTimeIsNotNull() {
            addCriterion("open_scrivener_time is not null");
            return (Criteria) this;
        }

        public Criteria andOpenScrivenerTimeEqualTo(Date value) {
            addCriterion("open_scrivener_time =", value, "openScrivenerTime");
            return (Criteria) this;
        }

        public Criteria andOpenScrivenerTimeNotEqualTo(Date value) {
            addCriterion("open_scrivener_time <>", value, "openScrivenerTime");
            return (Criteria) this;
        }

        public Criteria andOpenScrivenerTimeGreaterThan(Date value) {
            addCriterion("open_scrivener_time >", value, "openScrivenerTime");
            return (Criteria) this;
        }

        public Criteria andOpenScrivenerTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("open_scrivener_time >=", value, "openScrivenerTime");
            return (Criteria) this;
        }

        public Criteria andOpenScrivenerTimeLessThan(Date value) {
            addCriterion("open_scrivener_time <", value, "openScrivenerTime");
            return (Criteria) this;
        }

        public Criteria andOpenScrivenerTimeLessThanOrEqualTo(Date value) {
            addCriterion("open_scrivener_time <=", value, "openScrivenerTime");
            return (Criteria) this;
        }

        public Criteria andOpenScrivenerTimeIn(List<Date> values) {
            addCriterion("open_scrivener_time in", values, "openScrivenerTime");
            return (Criteria) this;
        }

        public Criteria andOpenScrivenerTimeNotIn(List<Date> values) {
            addCriterion("open_scrivener_time not in", values, "openScrivenerTime");
            return (Criteria) this;
        }

        public Criteria andOpenScrivenerTimeBetween(Date value1, Date value2) {
            addCriterion("open_scrivener_time between", value1, value2, "openScrivenerTime");
            return (Criteria) this;
        }

        public Criteria andOpenScrivenerTimeNotBetween(Date value1, Date value2) {
            addCriterion("open_scrivener_time not between", value1, value2, "openScrivenerTime");
            return (Criteria) this;
        }

        public Criteria andGroupNumberIsNull() {
            addCriterion("group_number is null");
            return (Criteria) this;
        }

        public Criteria andGroupNumberIsNotNull() {
            addCriterion("group_number is not null");
            return (Criteria) this;
        }

        public Criteria andGroupNumberEqualTo(Integer value) {
            addCriterion("group_number =", value, "groupNumber");
            return (Criteria) this;
        }

        public Criteria andGroupNumberNotEqualTo(Integer value) {
            addCriterion("group_number <>", value, "groupNumber");
            return (Criteria) this;
        }

        public Criteria andGroupNumberGreaterThan(Integer value) {
            addCriterion("group_number >", value, "groupNumber");
            return (Criteria) this;
        }

        public Criteria andGroupNumberGreaterThanOrEqualTo(Integer value) {
            addCriterion("group_number >=", value, "groupNumber");
            return (Criteria) this;
        }

        public Criteria andGroupNumberLessThan(Integer value) {
            addCriterion("group_number <", value, "groupNumber");
            return (Criteria) this;
        }

        public Criteria andGroupNumberLessThanOrEqualTo(Integer value) {
            addCriterion("group_number <=", value, "groupNumber");
            return (Criteria) this;
        }

        public Criteria andGroupNumberIn(List<Integer> values) {
            addCriterion("group_number in", values, "groupNumber");
            return (Criteria) this;
        }

        public Criteria andGroupNumberNotIn(List<Integer> values) {
            addCriterion("group_number not in", values, "groupNumber");
            return (Criteria) this;
        }

        public Criteria andGroupNumberBetween(Integer value1, Integer value2) {
            addCriterion("group_number between", value1, value2, "groupNumber");
            return (Criteria) this;
        }

        public Criteria andGroupNumberNotBetween(Integer value1, Integer value2) {
            addCriterion("group_number not between", value1, value2, "groupNumber");
            return (Criteria) this;
        }

        public Criteria andSysNameIsNull() {
            addCriterion("sys_name is null");
            return (Criteria) this;
        }

        public Criteria andSysNameIsNotNull() {
            addCriterion("sys_name is not null");
            return (Criteria) this;
        }

        public Criteria andSysNameEqualTo(String value) {
            addCriterion("sys_name =", value, "sysName");
            return (Criteria) this;
        }

        public Criteria andSysNameNotEqualTo(String value) {
            addCriterion("sys_name <>", value, "sysName");
            return (Criteria) this;
        }

        public Criteria andSysNameGreaterThan(String value) {
            addCriterion("sys_name >", value, "sysName");
            return (Criteria) this;
        }

        public Criteria andSysNameGreaterThanOrEqualTo(String value) {
            addCriterion("sys_name >=", value, "sysName");
            return (Criteria) this;
        }

        public Criteria andSysNameLessThan(String value) {
            addCriterion("sys_name <", value, "sysName");
            return (Criteria) this;
        }

        public Criteria andSysNameLessThanOrEqualTo(String value) {
            addCriterion("sys_name <=", value, "sysName");
            return (Criteria) this;
        }

        public Criteria andSysNameLike(String value) {
            addCriterion("sys_name like", value, "sysName");
            return (Criteria) this;
        }

        public Criteria andSysNameNotLike(String value) {
            addCriterion("sys_name not like", value, "sysName");
            return (Criteria) this;
        }

        public Criteria andSysNameIn(List<String> values) {
            addCriterion("sys_name in", values, "sysName");
            return (Criteria) this;
        }

        public Criteria andSysNameNotIn(List<String> values) {
            addCriterion("sys_name not in", values, "sysName");
            return (Criteria) this;
        }

        public Criteria andSysNameBetween(String value1, String value2) {
            addCriterion("sys_name between", value1, value2, "sysName");
            return (Criteria) this;
        }

        public Criteria andSysNameNotBetween(String value1, String value2) {
            addCriterion("sys_name not between", value1, value2, "sysName");
            return (Criteria) this;
        }

        public Criteria andExportGroupIsNull() {
            addCriterion("export_group is null");
            return (Criteria) this;
        }

        public Criteria andExportGroupIsNotNull() {
            addCriterion("export_group is not null");
            return (Criteria) this;
        }

        public Criteria andExportGroupEqualTo(Integer value) {
            addCriterion("export_group =", value, "exportGroup");
            return (Criteria) this;
        }

        public Criteria andExportGroupNotEqualTo(Integer value) {
            addCriterion("export_group <>", value, "exportGroup");
            return (Criteria) this;
        }

        public Criteria andExportGroupGreaterThan(Integer value) {
            addCriterion("export_group >", value, "exportGroup");
            return (Criteria) this;
        }

        public Criteria andExportGroupGreaterThanOrEqualTo(Integer value) {
            addCriterion("export_group >=", value, "exportGroup");
            return (Criteria) this;
        }

        public Criteria andExportGroupLessThan(Integer value) {
            addCriterion("export_group <", value, "exportGroup");
            return (Criteria) this;
        }

        public Criteria andExportGroupLessThanOrEqualTo(Integer value) {
            addCriterion("export_group <=", value, "exportGroup");
            return (Criteria) this;
        }

        public Criteria andExportGroupIn(List<Integer> values) {
            addCriterion("export_group in", values, "exportGroup");
            return (Criteria) this;
        }

        public Criteria andExportGroupNotIn(List<Integer> values) {
            addCriterion("export_group not in", values, "exportGroup");
            return (Criteria) this;
        }

        public Criteria andExportGroupBetween(Integer value1, Integer value2) {
            addCriterion("export_group between", value1, value2, "exportGroup");
            return (Criteria) this;
        }

        public Criteria andExportGroupNotBetween(Integer value1, Integer value2) {
            addCriterion("export_group not between", value1, value2, "exportGroup");
            return (Criteria) this;
        }

        public Criteria andAdminSmsIsNull() {
            addCriterion("admin_sms is null");
            return (Criteria) this;
        }

        public Criteria andAdminSmsIsNotNull() {
            addCriterion("admin_sms is not null");
            return (Criteria) this;
        }

        public Criteria andAdminSmsEqualTo(String value) {
            addCriterion("admin_sms =", value, "adminSms");
            return (Criteria) this;
        }

        public Criteria andAdminSmsNotEqualTo(String value) {
            addCriterion("admin_sms <>", value, "adminSms");
            return (Criteria) this;
        }

        public Criteria andAdminSmsGreaterThan(String value) {
            addCriterion("admin_sms >", value, "adminSms");
            return (Criteria) this;
        }

        public Criteria andAdminSmsGreaterThanOrEqualTo(String value) {
            addCriterion("admin_sms >=", value, "adminSms");
            return (Criteria) this;
        }

        public Criteria andAdminSmsLessThan(String value) {
            addCriterion("admin_sms <", value, "adminSms");
            return (Criteria) this;
        }

        public Criteria andAdminSmsLessThanOrEqualTo(String value) {
            addCriterion("admin_sms <=", value, "adminSms");
            return (Criteria) this;
        }

        public Criteria andAdminSmsLike(String value) {
            addCriterion("admin_sms like", value, "adminSms");
            return (Criteria) this;
        }

        public Criteria andAdminSmsNotLike(String value) {
            addCriterion("admin_sms not like", value, "adminSms");
            return (Criteria) this;
        }

        public Criteria andAdminSmsIn(List<String> values) {
            addCriterion("admin_sms in", values, "adminSms");
            return (Criteria) this;
        }

        public Criteria andAdminSmsNotIn(List<String> values) {
            addCriterion("admin_sms not in", values, "adminSms");
            return (Criteria) this;
        }

        public Criteria andAdminSmsBetween(String value1, String value2) {
            addCriterion("admin_sms between", value1, value2, "adminSms");
            return (Criteria) this;
        }

        public Criteria andAdminSmsNotBetween(String value1, String value2) {
            addCriterion("admin_sms not between", value1, value2, "adminSms");
            return (Criteria) this;
        }

        public Criteria andTeacherSmsIsNull() {
            addCriterion("teacher_sms is null");
            return (Criteria) this;
        }

        public Criteria andTeacherSmsIsNotNull() {
            addCriterion("teacher_sms is not null");
            return (Criteria) this;
        }

        public Criteria andTeacherSmsEqualTo(String value) {
            addCriterion("teacher_sms =", value, "teacherSms");
            return (Criteria) this;
        }

        public Criteria andTeacherSmsNotEqualTo(String value) {
            addCriterion("teacher_sms <>", value, "teacherSms");
            return (Criteria) this;
        }

        public Criteria andTeacherSmsGreaterThan(String value) {
            addCriterion("teacher_sms >", value, "teacherSms");
            return (Criteria) this;
        }

        public Criteria andTeacherSmsGreaterThanOrEqualTo(String value) {
            addCriterion("teacher_sms >=", value, "teacherSms");
            return (Criteria) this;
        }

        public Criteria andTeacherSmsLessThan(String value) {
            addCriterion("teacher_sms <", value, "teacherSms");
            return (Criteria) this;
        }

        public Criteria andTeacherSmsLessThanOrEqualTo(String value) {
            addCriterion("teacher_sms <=", value, "teacherSms");
            return (Criteria) this;
        }

        public Criteria andTeacherSmsLike(String value) {
            addCriterion("teacher_sms like", value, "teacherSms");
            return (Criteria) this;
        }

        public Criteria andTeacherSmsNotLike(String value) {
            addCriterion("teacher_sms not like", value, "teacherSms");
            return (Criteria) this;
        }

        public Criteria andTeacherSmsIn(List<String> values) {
            addCriterion("teacher_sms in", values, "teacherSms");
            return (Criteria) this;
        }

        public Criteria andTeacherSmsNotIn(List<String> values) {
            addCriterion("teacher_sms not in", values, "teacherSms");
            return (Criteria) this;
        }

        public Criteria andTeacherSmsBetween(String value1, String value2) {
            addCriterion("teacher_sms between", value1, value2, "teacherSms");
            return (Criteria) this;
        }

        public Criteria andTeacherSmsNotBetween(String value1, String value2) {
            addCriterion("teacher_sms not between", value1, value2, "teacherSms");
            return (Criteria) this;
        }

        public Criteria andVerifyUploadIsNull() {
            addCriterion("verify_upload is null");
            return (Criteria) this;
        }

        public Criteria andVerifyUploadIsNotNull() {
            addCriterion("verify_upload is not null");
            return (Criteria) this;
        }

        public Criteria andVerifyUploadEqualTo(String value) {
            addCriterion("verify_upload =", value, "verifyUpload");
            return (Criteria) this;
        }

        public Criteria andVerifyUploadNotEqualTo(String value) {
            addCriterion("verify_upload <>", value, "verifyUpload");
            return (Criteria) this;
        }

        public Criteria andVerifyUploadGreaterThan(String value) {
            addCriterion("verify_upload >", value, "verifyUpload");
            return (Criteria) this;
        }

        public Criteria andVerifyUploadGreaterThanOrEqualTo(String value) {
            addCriterion("verify_upload >=", value, "verifyUpload");
            return (Criteria) this;
        }

        public Criteria andVerifyUploadLessThan(String value) {
            addCriterion("verify_upload <", value, "verifyUpload");
            return (Criteria) this;
        }

        public Criteria andVerifyUploadLessThanOrEqualTo(String value) {
            addCriterion("verify_upload <=", value, "verifyUpload");
            return (Criteria) this;
        }

        public Criteria andVerifyUploadLike(String value) {
            addCriterion("verify_upload like", value, "verifyUpload");
            return (Criteria) this;
        }

        public Criteria andVerifyUploadNotLike(String value) {
            addCriterion("verify_upload not like", value, "verifyUpload");
            return (Criteria) this;
        }

        public Criteria andVerifyUploadIn(List<String> values) {
            addCriterion("verify_upload in", values, "verifyUpload");
            return (Criteria) this;
        }

        public Criteria andVerifyUploadNotIn(List<String> values) {
            addCriterion("verify_upload not in", values, "verifyUpload");
            return (Criteria) this;
        }

        public Criteria andVerifyUploadBetween(String value1, String value2) {
            addCriterion("verify_upload between", value1, value2, "verifyUpload");
            return (Criteria) this;
        }

        public Criteria andVerifyUploadNotBetween(String value1, String value2) {
            addCriterion("verify_upload not between", value1, value2, "verifyUpload");
            return (Criteria) this;
        }

        public Criteria andStuBatchImportIsNull() {
            addCriterion("stu_batch_import is null");
            return (Criteria) this;
        }

        public Criteria andStuBatchImportIsNotNull() {
            addCriterion("stu_batch_import is not null");
            return (Criteria) this;
        }

        public Criteria andStuBatchImportEqualTo(String value) {
            addCriterion("stu_batch_import =", value, "stuBatchImport");
            return (Criteria) this;
        }

        public Criteria andStuBatchImportNotEqualTo(String value) {
            addCriterion("stu_batch_import <>", value, "stuBatchImport");
            return (Criteria) this;
        }

        public Criteria andStuBatchImportGreaterThan(String value) {
            addCriterion("stu_batch_import >", value, "stuBatchImport");
            return (Criteria) this;
        }

        public Criteria andStuBatchImportGreaterThanOrEqualTo(String value) {
            addCriterion("stu_batch_import >=", value, "stuBatchImport");
            return (Criteria) this;
        }

        public Criteria andStuBatchImportLessThan(String value) {
            addCriterion("stu_batch_import <", value, "stuBatchImport");
            return (Criteria) this;
        }

        public Criteria andStuBatchImportLessThanOrEqualTo(String value) {
            addCriterion("stu_batch_import <=", value, "stuBatchImport");
            return (Criteria) this;
        }

        public Criteria andStuBatchImportLike(String value) {
            addCriterion("stu_batch_import like", value, "stuBatchImport");
            return (Criteria) this;
        }

        public Criteria andStuBatchImportNotLike(String value) {
            addCriterion("stu_batch_import not like", value, "stuBatchImport");
            return (Criteria) this;
        }

        public Criteria andStuBatchImportIn(List<String> values) {
            addCriterion("stu_batch_import in", values, "stuBatchImport");
            return (Criteria) this;
        }

        public Criteria andStuBatchImportNotIn(List<String> values) {
            addCriterion("stu_batch_import not in", values, "stuBatchImport");
            return (Criteria) this;
        }

        public Criteria andStuBatchImportBetween(String value1, String value2) {
            addCriterion("stu_batch_import between", value1, value2, "stuBatchImport");
            return (Criteria) this;
        }

        public Criteria andStuBatchImportNotBetween(String value1, String value2) {
            addCriterion("stu_batch_import not between", value1, value2, "stuBatchImport");
            return (Criteria) this;
        }

        public Criteria andImportStuMaxIsNull() {
            addCriterion("import_stu_max is null");
            return (Criteria) this;
        }

        public Criteria andImportStuMaxIsNotNull() {
            addCriterion("import_stu_max is not null");
            return (Criteria) this;
        }

        public Criteria andImportStuMaxEqualTo(String value) {
            addCriterion("import_stu_max =", value, "importStuMax");
            return (Criteria) this;
        }

        public Criteria andImportStuMaxNotEqualTo(String value) {
            addCriterion("import_stu_max <>", value, "importStuMax");
            return (Criteria) this;
        }

        public Criteria andImportStuMaxGreaterThan(String value) {
            addCriterion("import_stu_max >", value, "importStuMax");
            return (Criteria) this;
        }

        public Criteria andImportStuMaxGreaterThanOrEqualTo(String value) {
            addCriterion("import_stu_max >=", value, "importStuMax");
            return (Criteria) this;
        }

        public Criteria andImportStuMaxLessThan(String value) {
            addCriterion("import_stu_max <", value, "importStuMax");
            return (Criteria) this;
        }

        public Criteria andImportStuMaxLessThanOrEqualTo(String value) {
            addCriterion("import_stu_max <=", value, "importStuMax");
            return (Criteria) this;
        }

        public Criteria andImportStuMaxLike(String value) {
            addCriterion("import_stu_max like", value, "importStuMax");
            return (Criteria) this;
        }

        public Criteria andImportStuMaxNotLike(String value) {
            addCriterion("import_stu_max not like", value, "importStuMax");
            return (Criteria) this;
        }

        public Criteria andImportStuMaxIn(List<String> values) {
            addCriterion("import_stu_max in", values, "importStuMax");
            return (Criteria) this;
        }

        public Criteria andImportStuMaxNotIn(List<String> values) {
            addCriterion("import_stu_max not in", values, "importStuMax");
            return (Criteria) this;
        }

        public Criteria andImportStuMaxBetween(String value1, String value2) {
            addCriterion("import_stu_max between", value1, value2, "importStuMax");
            return (Criteria) this;
        }

        public Criteria andImportStuMaxNotBetween(String value1, String value2) {
            addCriterion("import_stu_max not between", value1, value2, "importStuMax");
            return (Criteria) this;
        }

        public Criteria andForgotPasswordIsNull() {
            addCriterion("forgot_password is null");
            return (Criteria) this;
        }

        public Criteria andForgotPasswordIsNotNull() {
            addCriterion("forgot_password is not null");
            return (Criteria) this;
        }

        public Criteria andForgotPasswordEqualTo(String value) {
            addCriterion("forgot_password =", value, "forgotPassword");
            return (Criteria) this;
        }

        public Criteria andForgotPasswordNotEqualTo(String value) {
            addCriterion("forgot_password <>", value, "forgotPassword");
            return (Criteria) this;
        }

        public Criteria andForgotPasswordGreaterThan(String value) {
            addCriterion("forgot_password >", value, "forgotPassword");
            return (Criteria) this;
        }

        public Criteria andForgotPasswordGreaterThanOrEqualTo(String value) {
            addCriterion("forgot_password >=", value, "forgotPassword");
            return (Criteria) this;
        }

        public Criteria andForgotPasswordLessThan(String value) {
            addCriterion("forgot_password <", value, "forgotPassword");
            return (Criteria) this;
        }

        public Criteria andForgotPasswordLessThanOrEqualTo(String value) {
            addCriterion("forgot_password <=", value, "forgotPassword");
            return (Criteria) this;
        }

        public Criteria andForgotPasswordLike(String value) {
            addCriterion("forgot_password like", value, "forgotPassword");
            return (Criteria) this;
        }

        public Criteria andForgotPasswordNotLike(String value) {
            addCriterion("forgot_password not like", value, "forgotPassword");
            return (Criteria) this;
        }

        public Criteria andForgotPasswordIn(List<String> values) {
            addCriterion("forgot_password in", values, "forgotPassword");
            return (Criteria) this;
        }

        public Criteria andForgotPasswordNotIn(List<String> values) {
            addCriterion("forgot_password not in", values, "forgotPassword");
            return (Criteria) this;
        }

        public Criteria andForgotPasswordBetween(String value1, String value2) {
            addCriterion("forgot_password between", value1, value2, "forgotPassword");
            return (Criteria) this;
        }

        public Criteria andForgotPasswordNotBetween(String value1, String value2) {
            addCriterion("forgot_password not between", value1, value2, "forgotPassword");
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