package com.lzz.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UsersExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public UsersExample() {
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

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
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

        public Criteria andPasswordLastModifiedIsNull() {
            addCriterion("password_last_modified is null");
            return (Criteria) this;
        }

        public Criteria andPasswordLastModifiedIsNotNull() {
            addCriterion("password_last_modified is not null");
            return (Criteria) this;
        }

        public Criteria andPasswordLastModifiedEqualTo(Date value) {
            addCriterion("password_last_modified =", value, "passwordLastModified");
            return (Criteria) this;
        }

        public Criteria andPasswordLastModifiedNotEqualTo(Date value) {
            addCriterion("password_last_modified <>", value, "passwordLastModified");
            return (Criteria) this;
        }

        public Criteria andPasswordLastModifiedGreaterThan(Date value) {
            addCriterion("password_last_modified >", value, "passwordLastModified");
            return (Criteria) this;
        }

        public Criteria andPasswordLastModifiedGreaterThanOrEqualTo(Date value) {
            addCriterion("password_last_modified >=", value, "passwordLastModified");
            return (Criteria) this;
        }

        public Criteria andPasswordLastModifiedLessThan(Date value) {
            addCriterion("password_last_modified <", value, "passwordLastModified");
            return (Criteria) this;
        }

        public Criteria andPasswordLastModifiedLessThanOrEqualTo(Date value) {
            addCriterion("password_last_modified <=", value, "passwordLastModified");
            return (Criteria) this;
        }

        public Criteria andPasswordLastModifiedIn(List<Date> values) {
            addCriterion("password_last_modified in", values, "passwordLastModified");
            return (Criteria) this;
        }

        public Criteria andPasswordLastModifiedNotIn(List<Date> values) {
            addCriterion("password_last_modified not in", values, "passwordLastModified");
            return (Criteria) this;
        }

        public Criteria andPasswordLastModifiedBetween(Date value1, Date value2) {
            addCriterion("password_last_modified between", value1, value2, "passwordLastModified");
            return (Criteria) this;
        }

        public Criteria andPasswordLastModifiedNotBetween(Date value1, Date value2) {
            addCriterion("password_last_modified not between", value1, value2, "passwordLastModified");
            return (Criteria) this;
        }

        public Criteria andAccontTypeIsNull() {
            addCriterion("accont_type is null");
            return (Criteria) this;
        }

        public Criteria andAccontTypeIsNotNull() {
            addCriterion("accont_type is not null");
            return (Criteria) this;
        }

        public Criteria andAccontTypeEqualTo(Integer value) {
            addCriterion("accont_type =", value, "accontType");
            return (Criteria) this;
        }

        public Criteria andAccontTypeNotEqualTo(Integer value) {
            addCriterion("accont_type <>", value, "accontType");
            return (Criteria) this;
        }

        public Criteria andAccontTypeGreaterThan(Integer value) {
            addCriterion("accont_type >", value, "accontType");
            return (Criteria) this;
        }

        public Criteria andAccontTypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("accont_type >=", value, "accontType");
            return (Criteria) this;
        }

        public Criteria andAccontTypeLessThan(Integer value) {
            addCriterion("accont_type <", value, "accontType");
            return (Criteria) this;
        }

        public Criteria andAccontTypeLessThanOrEqualTo(Integer value) {
            addCriterion("accont_type <=", value, "accontType");
            return (Criteria) this;
        }

        public Criteria andAccontTypeIn(List<Integer> values) {
            addCriterion("accont_type in", values, "accontType");
            return (Criteria) this;
        }

        public Criteria andAccontTypeNotIn(List<Integer> values) {
            addCriterion("accont_type not in", values, "accontType");
            return (Criteria) this;
        }

        public Criteria andAccontTypeBetween(Integer value1, Integer value2) {
            addCriterion("accont_type between", value1, value2, "accontType");
            return (Criteria) this;
        }

        public Criteria andAccontTypeNotBetween(Integer value1, Integer value2) {
            addCriterion("accont_type not between", value1, value2, "accontType");
            return (Criteria) this;
        }

        public Criteria andAdminTypeIsNull() {
            addCriterion("admin_type is null");
            return (Criteria) this;
        }

        public Criteria andAdminTypeIsNotNull() {
            addCriterion("admin_type is not null");
            return (Criteria) this;
        }

        public Criteria andAdminTypeEqualTo(Integer value) {
            addCriterion("admin_type =", value, "adminType");
            return (Criteria) this;
        }

        public Criteria andAdminTypeNotEqualTo(Integer value) {
            addCriterion("admin_type <>", value, "adminType");
            return (Criteria) this;
        }

        public Criteria andAdminTypeGreaterThan(Integer value) {
            addCriterion("admin_type >", value, "adminType");
            return (Criteria) this;
        }

        public Criteria andAdminTypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("admin_type >=", value, "adminType");
            return (Criteria) this;
        }

        public Criteria andAdminTypeLessThan(Integer value) {
            addCriterion("admin_type <", value, "adminType");
            return (Criteria) this;
        }

        public Criteria andAdminTypeLessThanOrEqualTo(Integer value) {
            addCriterion("admin_type <=", value, "adminType");
            return (Criteria) this;
        }

        public Criteria andAdminTypeIn(List<Integer> values) {
            addCriterion("admin_type in", values, "adminType");
            return (Criteria) this;
        }

        public Criteria andAdminTypeNotIn(List<Integer> values) {
            addCriterion("admin_type not in", values, "adminType");
            return (Criteria) this;
        }

        public Criteria andAdminTypeBetween(Integer value1, Integer value2) {
            addCriterion("admin_type between", value1, value2, "adminType");
            return (Criteria) this;
        }

        public Criteria andAdminTypeNotBetween(Integer value1, Integer value2) {
            addCriterion("admin_type not between", value1, value2, "adminType");
            return (Criteria) this;
        }

        public Criteria andTokuisakiCdIsNull() {
            addCriterion("tokuisaki_cd is null");
            return (Criteria) this;
        }

        public Criteria andTokuisakiCdIsNotNull() {
            addCriterion("tokuisaki_cd is not null");
            return (Criteria) this;
        }

        public Criteria andTokuisakiCdEqualTo(String value) {
            addCriterion("tokuisaki_cd =", value, "tokuisakiCd");
            return (Criteria) this;
        }

        public Criteria andTokuisakiCdNotEqualTo(String value) {
            addCriterion("tokuisaki_cd <>", value, "tokuisakiCd");
            return (Criteria) this;
        }

        public Criteria andTokuisakiCdGreaterThan(String value) {
            addCriterion("tokuisaki_cd >", value, "tokuisakiCd");
            return (Criteria) this;
        }

        public Criteria andTokuisakiCdGreaterThanOrEqualTo(String value) {
            addCriterion("tokuisaki_cd >=", value, "tokuisakiCd");
            return (Criteria) this;
        }

        public Criteria andTokuisakiCdLessThan(String value) {
            addCriterion("tokuisaki_cd <", value, "tokuisakiCd");
            return (Criteria) this;
        }

        public Criteria andTokuisakiCdLessThanOrEqualTo(String value) {
            addCriterion("tokuisaki_cd <=", value, "tokuisakiCd");
            return (Criteria) this;
        }

        public Criteria andTokuisakiCdLike(String value) {
            addCriterion("tokuisaki_cd like", value, "tokuisakiCd");
            return (Criteria) this;
        }

        public Criteria andTokuisakiCdNotLike(String value) {
            addCriterion("tokuisaki_cd not like", value, "tokuisakiCd");
            return (Criteria) this;
        }

        public Criteria andTokuisakiCdIn(List<String> values) {
            addCriterion("tokuisaki_cd in", values, "tokuisakiCd");
            return (Criteria) this;
        }

        public Criteria andTokuisakiCdNotIn(List<String> values) {
            addCriterion("tokuisaki_cd not in", values, "tokuisakiCd");
            return (Criteria) this;
        }

        public Criteria andTokuisakiCdBetween(String value1, String value2) {
            addCriterion("tokuisaki_cd between", value1, value2, "tokuisakiCd");
            return (Criteria) this;
        }

        public Criteria andTokuisakiCdNotBetween(String value1, String value2) {
            addCriterion("tokuisaki_cd not between", value1, value2, "tokuisakiCd");
            return (Criteria) this;
        }

        public Criteria andShiiresakiCdIsNull() {
            addCriterion("shiiresaki_cd is null");
            return (Criteria) this;
        }

        public Criteria andShiiresakiCdIsNotNull() {
            addCriterion("shiiresaki_cd is not null");
            return (Criteria) this;
        }

        public Criteria andShiiresakiCdEqualTo(String value) {
            addCriterion("shiiresaki_cd =", value, "shiiresakiCd");
            return (Criteria) this;
        }

        public Criteria andShiiresakiCdNotEqualTo(String value) {
            addCriterion("shiiresaki_cd <>", value, "shiiresakiCd");
            return (Criteria) this;
        }

        public Criteria andShiiresakiCdGreaterThan(String value) {
            addCriterion("shiiresaki_cd >", value, "shiiresakiCd");
            return (Criteria) this;
        }

        public Criteria andShiiresakiCdGreaterThanOrEqualTo(String value) {
            addCriterion("shiiresaki_cd >=", value, "shiiresakiCd");
            return (Criteria) this;
        }

        public Criteria andShiiresakiCdLessThan(String value) {
            addCriterion("shiiresaki_cd <", value, "shiiresakiCd");
            return (Criteria) this;
        }

        public Criteria andShiiresakiCdLessThanOrEqualTo(String value) {
            addCriterion("shiiresaki_cd <=", value, "shiiresakiCd");
            return (Criteria) this;
        }

        public Criteria andShiiresakiCdLike(String value) {
            addCriterion("shiiresaki_cd like", value, "shiiresakiCd");
            return (Criteria) this;
        }

        public Criteria andShiiresakiCdNotLike(String value) {
            addCriterion("shiiresaki_cd not like", value, "shiiresakiCd");
            return (Criteria) this;
        }

        public Criteria andShiiresakiCdIn(List<String> values) {
            addCriterion("shiiresaki_cd in", values, "shiiresakiCd");
            return (Criteria) this;
        }

        public Criteria andShiiresakiCdNotIn(List<String> values) {
            addCriterion("shiiresaki_cd not in", values, "shiiresakiCd");
            return (Criteria) this;
        }

        public Criteria andShiiresakiCdBetween(String value1, String value2) {
            addCriterion("shiiresaki_cd between", value1, value2, "shiiresakiCd");
            return (Criteria) this;
        }

        public Criteria andShiiresakiCdNotBetween(String value1, String value2) {
            addCriterion("shiiresaki_cd not between", value1, value2, "shiiresakiCd");
            return (Criteria) this;
        }

        public Criteria andLastLoginIsNull() {
            addCriterion("last_login is null");
            return (Criteria) this;
        }

        public Criteria andLastLoginIsNotNull() {
            addCriterion("last_login is not null");
            return (Criteria) this;
        }

        public Criteria andLastLoginEqualTo(Date value) {
            addCriterion("last_login =", value, "lastLogin");
            return (Criteria) this;
        }

        public Criteria andLastLoginNotEqualTo(Date value) {
            addCriterion("last_login <>", value, "lastLogin");
            return (Criteria) this;
        }

        public Criteria andLastLoginGreaterThan(Date value) {
            addCriterion("last_login >", value, "lastLogin");
            return (Criteria) this;
        }

        public Criteria andLastLoginGreaterThanOrEqualTo(Date value) {
            addCriterion("last_login >=", value, "lastLogin");
            return (Criteria) this;
        }

        public Criteria andLastLoginLessThan(Date value) {
            addCriterion("last_login <", value, "lastLogin");
            return (Criteria) this;
        }

        public Criteria andLastLoginLessThanOrEqualTo(Date value) {
            addCriterion("last_login <=", value, "lastLogin");
            return (Criteria) this;
        }

        public Criteria andLastLoginIn(List<Date> values) {
            addCriterion("last_login in", values, "lastLogin");
            return (Criteria) this;
        }

        public Criteria andLastLoginNotIn(List<Date> values) {
            addCriterion("last_login not in", values, "lastLogin");
            return (Criteria) this;
        }

        public Criteria andLastLoginBetween(Date value1, Date value2) {
            addCriterion("last_login between", value1, value2, "lastLogin");
            return (Criteria) this;
        }

        public Criteria andLastLoginNotBetween(Date value1, Date value2) {
            addCriterion("last_login not between", value1, value2, "lastLogin");
            return (Criteria) this;
        }

        public Criteria andCreatedIsNull() {
            addCriterion("created is null");
            return (Criteria) this;
        }

        public Criteria andCreatedIsNotNull() {
            addCriterion("created is not null");
            return (Criteria) this;
        }

        public Criteria andCreatedEqualTo(Date value) {
            addCriterion("created =", value, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedNotEqualTo(Date value) {
            addCriterion("created <>", value, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedGreaterThan(Date value) {
            addCriterion("created >", value, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedGreaterThanOrEqualTo(Date value) {
            addCriterion("created >=", value, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedLessThan(Date value) {
            addCriterion("created <", value, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedLessThanOrEqualTo(Date value) {
            addCriterion("created <=", value, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedIn(List<Date> values) {
            addCriterion("created in", values, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedNotIn(List<Date> values) {
            addCriterion("created not in", values, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedBetween(Date value1, Date value2) {
            addCriterion("created between", value1, value2, "created");
            return (Criteria) this;
        }

        public Criteria andCreatedNotBetween(Date value1, Date value2) {
            addCriterion("created not between", value1, value2, "created");
            return (Criteria) this;
        }

        public Criteria andNameLastIsNull() {
            addCriterion("name_last is null");
            return (Criteria) this;
        }

        public Criteria andNameLastIsNotNull() {
            addCriterion("name_last is not null");
            return (Criteria) this;
        }

        public Criteria andNameLastEqualTo(String value) {
            addCriterion("name_last =", value, "nameLast");
            return (Criteria) this;
        }

        public Criteria andNameLastNotEqualTo(String value) {
            addCriterion("name_last <>", value, "nameLast");
            return (Criteria) this;
        }

        public Criteria andNameLastGreaterThan(String value) {
            addCriterion("name_last >", value, "nameLast");
            return (Criteria) this;
        }

        public Criteria andNameLastGreaterThanOrEqualTo(String value) {
            addCriterion("name_last >=", value, "nameLast");
            return (Criteria) this;
        }

        public Criteria andNameLastLessThan(String value) {
            addCriterion("name_last <", value, "nameLast");
            return (Criteria) this;
        }

        public Criteria andNameLastLessThanOrEqualTo(String value) {
            addCriterion("name_last <=", value, "nameLast");
            return (Criteria) this;
        }

        public Criteria andNameLastLike(String value) {
            addCriterion("name_last like", value, "nameLast");
            return (Criteria) this;
        }

        public Criteria andNameLastNotLike(String value) {
            addCriterion("name_last not like", value, "nameLast");
            return (Criteria) this;
        }

        public Criteria andNameLastIn(List<String> values) {
            addCriterion("name_last in", values, "nameLast");
            return (Criteria) this;
        }

        public Criteria andNameLastNotIn(List<String> values) {
            addCriterion("name_last not in", values, "nameLast");
            return (Criteria) this;
        }

        public Criteria andNameLastBetween(String value1, String value2) {
            addCriterion("name_last between", value1, value2, "nameLast");
            return (Criteria) this;
        }

        public Criteria andNameLastNotBetween(String value1, String value2) {
            addCriterion("name_last not between", value1, value2, "nameLast");
            return (Criteria) this;
        }

        public Criteria andNameFirstFuriganaIsNull() {
            addCriterion("name_first_furigana is null");
            return (Criteria) this;
        }

        public Criteria andNameFirstFuriganaIsNotNull() {
            addCriterion("name_first_furigana is not null");
            return (Criteria) this;
        }

        public Criteria andNameFirstFuriganaEqualTo(String value) {
            addCriterion("name_first_furigana =", value, "nameFirstFurigana");
            return (Criteria) this;
        }

        public Criteria andNameFirstFuriganaNotEqualTo(String value) {
            addCriterion("name_first_furigana <>", value, "nameFirstFurigana");
            return (Criteria) this;
        }

        public Criteria andNameFirstFuriganaGreaterThan(String value) {
            addCriterion("name_first_furigana >", value, "nameFirstFurigana");
            return (Criteria) this;
        }

        public Criteria andNameFirstFuriganaGreaterThanOrEqualTo(String value) {
            addCriterion("name_first_furigana >=", value, "nameFirstFurigana");
            return (Criteria) this;
        }

        public Criteria andNameFirstFuriganaLessThan(String value) {
            addCriterion("name_first_furigana <", value, "nameFirstFurigana");
            return (Criteria) this;
        }

        public Criteria andNameFirstFuriganaLessThanOrEqualTo(String value) {
            addCriterion("name_first_furigana <=", value, "nameFirstFurigana");
            return (Criteria) this;
        }

        public Criteria andNameFirstFuriganaLike(String value) {
            addCriterion("name_first_furigana like", value, "nameFirstFurigana");
            return (Criteria) this;
        }

        public Criteria andNameFirstFuriganaNotLike(String value) {
            addCriterion("name_first_furigana not like", value, "nameFirstFurigana");
            return (Criteria) this;
        }

        public Criteria andNameFirstFuriganaIn(List<String> values) {
            addCriterion("name_first_furigana in", values, "nameFirstFurigana");
            return (Criteria) this;
        }

        public Criteria andNameFirstFuriganaNotIn(List<String> values) {
            addCriterion("name_first_furigana not in", values, "nameFirstFurigana");
            return (Criteria) this;
        }

        public Criteria andNameFirstFuriganaBetween(String value1, String value2) {
            addCriterion("name_first_furigana between", value1, value2, "nameFirstFurigana");
            return (Criteria) this;
        }

        public Criteria andNameFirstFuriganaNotBetween(String value1, String value2) {
            addCriterion("name_first_furigana not between", value1, value2, "nameFirstFurigana");
            return (Criteria) this;
        }

        public Criteria andNameLastFuriganaIsNull() {
            addCriterion("name_last_furigana is null");
            return (Criteria) this;
        }

        public Criteria andNameLastFuriganaIsNotNull() {
            addCriterion("name_last_furigana is not null");
            return (Criteria) this;
        }

        public Criteria andNameLastFuriganaEqualTo(String value) {
            addCriterion("name_last_furigana =", value, "nameLastFurigana");
            return (Criteria) this;
        }

        public Criteria andNameLastFuriganaNotEqualTo(String value) {
            addCriterion("name_last_furigana <>", value, "nameLastFurigana");
            return (Criteria) this;
        }

        public Criteria andNameLastFuriganaGreaterThan(String value) {
            addCriterion("name_last_furigana >", value, "nameLastFurigana");
            return (Criteria) this;
        }

        public Criteria andNameLastFuriganaGreaterThanOrEqualTo(String value) {
            addCriterion("name_last_furigana >=", value, "nameLastFurigana");
            return (Criteria) this;
        }

        public Criteria andNameLastFuriganaLessThan(String value) {
            addCriterion("name_last_furigana <", value, "nameLastFurigana");
            return (Criteria) this;
        }

        public Criteria andNameLastFuriganaLessThanOrEqualTo(String value) {
            addCriterion("name_last_furigana <=", value, "nameLastFurigana");
            return (Criteria) this;
        }

        public Criteria andNameLastFuriganaLike(String value) {
            addCriterion("name_last_furigana like", value, "nameLastFurigana");
            return (Criteria) this;
        }

        public Criteria andNameLastFuriganaNotLike(String value) {
            addCriterion("name_last_furigana not like", value, "nameLastFurigana");
            return (Criteria) this;
        }

        public Criteria andNameLastFuriganaIn(List<String> values) {
            addCriterion("name_last_furigana in", values, "nameLastFurigana");
            return (Criteria) this;
        }

        public Criteria andNameLastFuriganaNotIn(List<String> values) {
            addCriterion("name_last_furigana not in", values, "nameLastFurigana");
            return (Criteria) this;
        }

        public Criteria andNameLastFuriganaBetween(String value1, String value2) {
            addCriterion("name_last_furigana between", value1, value2, "nameLastFurigana");
            return (Criteria) this;
        }

        public Criteria andNameLastFuriganaNotBetween(String value1, String value2) {
            addCriterion("name_last_furigana not between", value1, value2, "nameLastFurigana");
            return (Criteria) this;
        }

        public Criteria andNameFirstKataganaIsNull() {
            addCriterion("name_first_katagana is null");
            return (Criteria) this;
        }

        public Criteria andNameFirstKataganaIsNotNull() {
            addCriterion("name_first_katagana is not null");
            return (Criteria) this;
        }

        public Criteria andNameFirstKataganaEqualTo(String value) {
            addCriterion("name_first_katagana =", value, "nameFirstKatagana");
            return (Criteria) this;
        }

        public Criteria andNameFirstKataganaNotEqualTo(String value) {
            addCriterion("name_first_katagana <>", value, "nameFirstKatagana");
            return (Criteria) this;
        }

        public Criteria andNameFirstKataganaGreaterThan(String value) {
            addCriterion("name_first_katagana >", value, "nameFirstKatagana");
            return (Criteria) this;
        }

        public Criteria andNameFirstKataganaGreaterThanOrEqualTo(String value) {
            addCriterion("name_first_katagana >=", value, "nameFirstKatagana");
            return (Criteria) this;
        }

        public Criteria andNameFirstKataganaLessThan(String value) {
            addCriterion("name_first_katagana <", value, "nameFirstKatagana");
            return (Criteria) this;
        }

        public Criteria andNameFirstKataganaLessThanOrEqualTo(String value) {
            addCriterion("name_first_katagana <=", value, "nameFirstKatagana");
            return (Criteria) this;
        }

        public Criteria andNameFirstKataganaLike(String value) {
            addCriterion("name_first_katagana like", value, "nameFirstKatagana");
            return (Criteria) this;
        }

        public Criteria andNameFirstKataganaNotLike(String value) {
            addCriterion("name_first_katagana not like", value, "nameFirstKatagana");
            return (Criteria) this;
        }

        public Criteria andNameFirstKataganaIn(List<String> values) {
            addCriterion("name_first_katagana in", values, "nameFirstKatagana");
            return (Criteria) this;
        }

        public Criteria andNameFirstKataganaNotIn(List<String> values) {
            addCriterion("name_first_katagana not in", values, "nameFirstKatagana");
            return (Criteria) this;
        }

        public Criteria andNameFirstKataganaBetween(String value1, String value2) {
            addCriterion("name_first_katagana between", value1, value2, "nameFirstKatagana");
            return (Criteria) this;
        }

        public Criteria andNameFirstKataganaNotBetween(String value1, String value2) {
            addCriterion("name_first_katagana not between", value1, value2, "nameFirstKatagana");
            return (Criteria) this;
        }

        public Criteria andNameLastKataganaIsNull() {
            addCriterion("name_last_katagana is null");
            return (Criteria) this;
        }

        public Criteria andNameLastKataganaIsNotNull() {
            addCriterion("name_last_katagana is not null");
            return (Criteria) this;
        }

        public Criteria andNameLastKataganaEqualTo(String value) {
            addCriterion("name_last_katagana =", value, "nameLastKatagana");
            return (Criteria) this;
        }

        public Criteria andNameLastKataganaNotEqualTo(String value) {
            addCriterion("name_last_katagana <>", value, "nameLastKatagana");
            return (Criteria) this;
        }

        public Criteria andNameLastKataganaGreaterThan(String value) {
            addCriterion("name_last_katagana >", value, "nameLastKatagana");
            return (Criteria) this;
        }

        public Criteria andNameLastKataganaGreaterThanOrEqualTo(String value) {
            addCriterion("name_last_katagana >=", value, "nameLastKatagana");
            return (Criteria) this;
        }

        public Criteria andNameLastKataganaLessThan(String value) {
            addCriterion("name_last_katagana <", value, "nameLastKatagana");
            return (Criteria) this;
        }

        public Criteria andNameLastKataganaLessThanOrEqualTo(String value) {
            addCriterion("name_last_katagana <=", value, "nameLastKatagana");
            return (Criteria) this;
        }

        public Criteria andNameLastKataganaLike(String value) {
            addCriterion("name_last_katagana like", value, "nameLastKatagana");
            return (Criteria) this;
        }

        public Criteria andNameLastKataganaNotLike(String value) {
            addCriterion("name_last_katagana not like", value, "nameLastKatagana");
            return (Criteria) this;
        }

        public Criteria andNameLastKataganaIn(List<String> values) {
            addCriterion("name_last_katagana in", values, "nameLastKatagana");
            return (Criteria) this;
        }

        public Criteria andNameLastKataganaNotIn(List<String> values) {
            addCriterion("name_last_katagana not in", values, "nameLastKatagana");
            return (Criteria) this;
        }

        public Criteria andNameLastKataganaBetween(String value1, String value2) {
            addCriterion("name_last_katagana between", value1, value2, "nameLastKatagana");
            return (Criteria) this;
        }

        public Criteria andNameLastKataganaNotBetween(String value1, String value2) {
            addCriterion("name_last_katagana not between", value1, value2, "nameLastKatagana");
            return (Criteria) this;
        }

        public Criteria andDeletedflagIsNull() {
            addCriterion("deletedflag is null");
            return (Criteria) this;
        }

        public Criteria andDeletedflagIsNotNull() {
            addCriterion("deletedflag is not null");
            return (Criteria) this;
        }

        public Criteria andDeletedflagEqualTo(Integer value) {
            addCriterion("deletedflag =", value, "deletedflag");
            return (Criteria) this;
        }

        public Criteria andDeletedflagNotEqualTo(Integer value) {
            addCriterion("deletedflag <>", value, "deletedflag");
            return (Criteria) this;
        }

        public Criteria andDeletedflagGreaterThan(Integer value) {
            addCriterion("deletedflag >", value, "deletedflag");
            return (Criteria) this;
        }

        public Criteria andDeletedflagGreaterThanOrEqualTo(Integer value) {
            addCriterion("deletedflag >=", value, "deletedflag");
            return (Criteria) this;
        }

        public Criteria andDeletedflagLessThan(Integer value) {
            addCriterion("deletedflag <", value, "deletedflag");
            return (Criteria) this;
        }

        public Criteria andDeletedflagLessThanOrEqualTo(Integer value) {
            addCriterion("deletedflag <=", value, "deletedflag");
            return (Criteria) this;
        }

        public Criteria andDeletedflagIn(List<Integer> values) {
            addCriterion("deletedflag in", values, "deletedflag");
            return (Criteria) this;
        }

        public Criteria andDeletedflagNotIn(List<Integer> values) {
            addCriterion("deletedflag not in", values, "deletedflag");
            return (Criteria) this;
        }

        public Criteria andDeletedflagBetween(Integer value1, Integer value2) {
            addCriterion("deletedflag between", value1, value2, "deletedflag");
            return (Criteria) this;
        }

        public Criteria andDeletedflagNotBetween(Integer value1, Integer value2) {
            addCriterion("deletedflag not between", value1, value2, "deletedflag");
            return (Criteria) this;
        }

        public Criteria andAccountStatusIsNull() {
            addCriterion("account_status is null");
            return (Criteria) this;
        }

        public Criteria andAccountStatusIsNotNull() {
            addCriterion("account_status is not null");
            return (Criteria) this;
        }

        public Criteria andAccountStatusEqualTo(String value) {
            addCriterion("account_status =", value, "accountStatus");
            return (Criteria) this;
        }

        public Criteria andAccountStatusNotEqualTo(String value) {
            addCriterion("account_status <>", value, "accountStatus");
            return (Criteria) this;
        }

        public Criteria andAccountStatusGreaterThan(String value) {
            addCriterion("account_status >", value, "accountStatus");
            return (Criteria) this;
        }

        public Criteria andAccountStatusGreaterThanOrEqualTo(String value) {
            addCriterion("account_status >=", value, "accountStatus");
            return (Criteria) this;
        }

        public Criteria andAccountStatusLessThan(String value) {
            addCriterion("account_status <", value, "accountStatus");
            return (Criteria) this;
        }

        public Criteria andAccountStatusLessThanOrEqualTo(String value) {
            addCriterion("account_status <=", value, "accountStatus");
            return (Criteria) this;
        }

        public Criteria andAccountStatusLike(String value) {
            addCriterion("account_status like", value, "accountStatus");
            return (Criteria) this;
        }

        public Criteria andAccountStatusNotLike(String value) {
            addCriterion("account_status not like", value, "accountStatus");
            return (Criteria) this;
        }

        public Criteria andAccountStatusIn(List<String> values) {
            addCriterion("account_status in", values, "accountStatus");
            return (Criteria) this;
        }

        public Criteria andAccountStatusNotIn(List<String> values) {
            addCriterion("account_status not in", values, "accountStatus");
            return (Criteria) this;
        }

        public Criteria andAccountStatusBetween(String value1, String value2) {
            addCriterion("account_status between", value1, value2, "accountStatus");
            return (Criteria) this;
        }

        public Criteria andAccountStatusNotBetween(String value1, String value2) {
            addCriterion("account_status not between", value1, value2, "accountStatus");
            return (Criteria) this;
        }

        public Criteria andHiraganaIsNull() {
            addCriterion("hiragana is null");
            return (Criteria) this;
        }

        public Criteria andHiraganaIsNotNull() {
            addCriterion("hiragana is not null");
            return (Criteria) this;
        }

        public Criteria andHiraganaEqualTo(String value) {
            addCriterion("hiragana =", value, "hiragana");
            return (Criteria) this;
        }

        public Criteria andHiraganaNotEqualTo(String value) {
            addCriterion("hiragana <>", value, "hiragana");
            return (Criteria) this;
        }

        public Criteria andHiraganaGreaterThan(String value) {
            addCriterion("hiragana >", value, "hiragana");
            return (Criteria) this;
        }

        public Criteria andHiraganaGreaterThanOrEqualTo(String value) {
            addCriterion("hiragana >=", value, "hiragana");
            return (Criteria) this;
        }

        public Criteria andHiraganaLessThan(String value) {
            addCriterion("hiragana <", value, "hiragana");
            return (Criteria) this;
        }

        public Criteria andHiraganaLessThanOrEqualTo(String value) {
            addCriterion("hiragana <=", value, "hiragana");
            return (Criteria) this;
        }

        public Criteria andHiraganaLike(String value) {
            addCriterion("hiragana like", value, "hiragana");
            return (Criteria) this;
        }

        public Criteria andHiraganaNotLike(String value) {
            addCriterion("hiragana not like", value, "hiragana");
            return (Criteria) this;
        }

        public Criteria andHiraganaIn(List<String> values) {
            addCriterion("hiragana in", values, "hiragana");
            return (Criteria) this;
        }

        public Criteria andHiraganaNotIn(List<String> values) {
            addCriterion("hiragana not in", values, "hiragana");
            return (Criteria) this;
        }

        public Criteria andHiraganaBetween(String value1, String value2) {
            addCriterion("hiragana between", value1, value2, "hiragana");
            return (Criteria) this;
        }

        public Criteria andHiraganaNotBetween(String value1, String value2) {
            addCriterion("hiragana not between", value1, value2, "hiragana");
            return (Criteria) this;
        }

        public Criteria andKatakanaIsNull() {
            addCriterion("katakana is null");
            return (Criteria) this;
        }

        public Criteria andKatakanaIsNotNull() {
            addCriterion("katakana is not null");
            return (Criteria) this;
        }

        public Criteria andKatakanaEqualTo(String value) {
            addCriterion("katakana =", value, "katakana");
            return (Criteria) this;
        }

        public Criteria andKatakanaNotEqualTo(String value) {
            addCriterion("katakana <>", value, "katakana");
            return (Criteria) this;
        }

        public Criteria andKatakanaGreaterThan(String value) {
            addCriterion("katakana >", value, "katakana");
            return (Criteria) this;
        }

        public Criteria andKatakanaGreaterThanOrEqualTo(String value) {
            addCriterion("katakana >=", value, "katakana");
            return (Criteria) this;
        }

        public Criteria andKatakanaLessThan(String value) {
            addCriterion("katakana <", value, "katakana");
            return (Criteria) this;
        }

        public Criteria andKatakanaLessThanOrEqualTo(String value) {
            addCriterion("katakana <=", value, "katakana");
            return (Criteria) this;
        }

        public Criteria andKatakanaLike(String value) {
            addCriterion("katakana like", value, "katakana");
            return (Criteria) this;
        }

        public Criteria andKatakanaNotLike(String value) {
            addCriterion("katakana not like", value, "katakana");
            return (Criteria) this;
        }

        public Criteria andKatakanaIn(List<String> values) {
            addCriterion("katakana in", values, "katakana");
            return (Criteria) this;
        }

        public Criteria andKatakanaNotIn(List<String> values) {
            addCriterion("katakana not in", values, "katakana");
            return (Criteria) this;
        }

        public Criteria andKatakanaBetween(String value1, String value2) {
            addCriterion("katakana between", value1, value2, "katakana");
            return (Criteria) this;
        }

        public Criteria andKatakanaNotBetween(String value1, String value2) {
            addCriterion("katakana not between", value1, value2, "katakana");
            return (Criteria) this;
        }

        public Criteria andTelIsNull() {
            addCriterion("tel is null");
            return (Criteria) this;
        }

        public Criteria andTelIsNotNull() {
            addCriterion("tel is not null");
            return (Criteria) this;
        }

        public Criteria andTelEqualTo(String value) {
            addCriterion("tel =", value, "tel");
            return (Criteria) this;
        }

        public Criteria andTelNotEqualTo(String value) {
            addCriterion("tel <>", value, "tel");
            return (Criteria) this;
        }

        public Criteria andTelGreaterThan(String value) {
            addCriterion("tel >", value, "tel");
            return (Criteria) this;
        }

        public Criteria andTelGreaterThanOrEqualTo(String value) {
            addCriterion("tel >=", value, "tel");
            return (Criteria) this;
        }

        public Criteria andTelLessThan(String value) {
            addCriterion("tel <", value, "tel");
            return (Criteria) this;
        }

        public Criteria andTelLessThanOrEqualTo(String value) {
            addCriterion("tel <=", value, "tel");
            return (Criteria) this;
        }

        public Criteria andTelLike(String value) {
            addCriterion("tel like", value, "tel");
            return (Criteria) this;
        }

        public Criteria andTelNotLike(String value) {
            addCriterion("tel not like", value, "tel");
            return (Criteria) this;
        }

        public Criteria andTelIn(List<String> values) {
            addCriterion("tel in", values, "tel");
            return (Criteria) this;
        }

        public Criteria andTelNotIn(List<String> values) {
            addCriterion("tel not in", values, "tel");
            return (Criteria) this;
        }

        public Criteria andTelBetween(String value1, String value2) {
            addCriterion("tel between", value1, value2, "tel");
            return (Criteria) this;
        }

        public Criteria andTelNotBetween(String value1, String value2) {
            addCriterion("tel not between", value1, value2, "tel");
            return (Criteria) this;
        }

        public Criteria andZipcodeIsNull() {
            addCriterion("zipcode is null");
            return (Criteria) this;
        }

        public Criteria andZipcodeIsNotNull() {
            addCriterion("zipcode is not null");
            return (Criteria) this;
        }

        public Criteria andZipcodeEqualTo(String value) {
            addCriterion("zipcode =", value, "zipcode");
            return (Criteria) this;
        }

        public Criteria andZipcodeNotEqualTo(String value) {
            addCriterion("zipcode <>", value, "zipcode");
            return (Criteria) this;
        }

        public Criteria andZipcodeGreaterThan(String value) {
            addCriterion("zipcode >", value, "zipcode");
            return (Criteria) this;
        }

        public Criteria andZipcodeGreaterThanOrEqualTo(String value) {
            addCriterion("zipcode >=", value, "zipcode");
            return (Criteria) this;
        }

        public Criteria andZipcodeLessThan(String value) {
            addCriterion("zipcode <", value, "zipcode");
            return (Criteria) this;
        }

        public Criteria andZipcodeLessThanOrEqualTo(String value) {
            addCriterion("zipcode <=", value, "zipcode");
            return (Criteria) this;
        }

        public Criteria andZipcodeLike(String value) {
            addCriterion("zipcode like", value, "zipcode");
            return (Criteria) this;
        }

        public Criteria andZipcodeNotLike(String value) {
            addCriterion("zipcode not like", value, "zipcode");
            return (Criteria) this;
        }

        public Criteria andZipcodeIn(List<String> values) {
            addCriterion("zipcode in", values, "zipcode");
            return (Criteria) this;
        }

        public Criteria andZipcodeNotIn(List<String> values) {
            addCriterion("zipcode not in", values, "zipcode");
            return (Criteria) this;
        }

        public Criteria andZipcodeBetween(String value1, String value2) {
            addCriterion("zipcode between", value1, value2, "zipcode");
            return (Criteria) this;
        }

        public Criteria andZipcodeNotBetween(String value1, String value2) {
            addCriterion("zipcode not between", value1, value2, "zipcode");
            return (Criteria) this;
        }

        public Criteria andAddressIsNull() {
            addCriterion("address is null");
            return (Criteria) this;
        }

        public Criteria andAddressIsNotNull() {
            addCriterion("address is not null");
            return (Criteria) this;
        }

        public Criteria andAddressEqualTo(String value) {
            addCriterion("address =", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotEqualTo(String value) {
            addCriterion("address <>", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressGreaterThan(String value) {
            addCriterion("address >", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressGreaterThanOrEqualTo(String value) {
            addCriterion("address >=", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressLessThan(String value) {
            addCriterion("address <", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressLessThanOrEqualTo(String value) {
            addCriterion("address <=", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressLike(String value) {
            addCriterion("address like", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotLike(String value) {
            addCriterion("address not like", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressIn(List<String> values) {
            addCriterion("address in", values, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotIn(List<String> values) {
            addCriterion("address not in", values, "address");
            return (Criteria) this;
        }

        public Criteria andAddressBetween(String value1, String value2) {
            addCriterion("address between", value1, value2, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotBetween(String value1, String value2) {
            addCriterion("address not between", value1, value2, "address");
            return (Criteria) this;
        }

        public Criteria andNameFirstIsNull() {
            addCriterion("name_first is null");
            return (Criteria) this;
        }

        public Criteria andNameFirstIsNotNull() {
            addCriterion("name_first is not null");
            return (Criteria) this;
        }

        public Criteria andNameFirstEqualTo(String value) {
            addCriterion("name_first =", value, "nameFirst");
            return (Criteria) this;
        }

        public Criteria andNameFirstNotEqualTo(String value) {
            addCriterion("name_first <>", value, "nameFirst");
            return (Criteria) this;
        }

        public Criteria andNameFirstGreaterThan(String value) {
            addCriterion("name_first >", value, "nameFirst");
            return (Criteria) this;
        }

        public Criteria andNameFirstGreaterThanOrEqualTo(String value) {
            addCriterion("name_first >=", value, "nameFirst");
            return (Criteria) this;
        }

        public Criteria andNameFirstLessThan(String value) {
            addCriterion("name_first <", value, "nameFirst");
            return (Criteria) this;
        }

        public Criteria andNameFirstLessThanOrEqualTo(String value) {
            addCriterion("name_first <=", value, "nameFirst");
            return (Criteria) this;
        }

        public Criteria andNameFirstLike(String value) {
            addCriterion("name_first like", value, "nameFirst");
            return (Criteria) this;
        }

        public Criteria andNameFirstNotLike(String value) {
            addCriterion("name_first not like", value, "nameFirst");
            return (Criteria) this;
        }

        public Criteria andNameFirstIn(List<String> values) {
            addCriterion("name_first in", values, "nameFirst");
            return (Criteria) this;
        }

        public Criteria andNameFirstNotIn(List<String> values) {
            addCriterion("name_first not in", values, "nameFirst");
            return (Criteria) this;
        }

        public Criteria andNameFirstBetween(String value1, String value2) {
            addCriterion("name_first between", value1, value2, "nameFirst");
            return (Criteria) this;
        }

        public Criteria andNameFirstNotBetween(String value1, String value2) {
            addCriterion("name_first not between", value1, value2, "nameFirst");
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