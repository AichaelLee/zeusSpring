package com.lzz.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class ProductExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ProductExample() {
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

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Long value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Long value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Long value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Long value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Long value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Long value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Long> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Long> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Long value1, Long value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Long value1, Long value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andCustomernameIsNull() {
            addCriterion("customername is null");
            return (Criteria) this;
        }

        public Criteria andCustomernameIsNotNull() {
            addCriterion("customername is not null");
            return (Criteria) this;
        }

        public Criteria andCustomernameEqualTo(String value) {
            addCriterion("customername =", value, "customername");
            return (Criteria) this;
        }

        public Criteria andCustomernameNotEqualTo(String value) {
            addCriterion("customername <>", value, "customername");
            return (Criteria) this;
        }

        public Criteria andCustomernameGreaterThan(String value) {
            addCriterion("customername >", value, "customername");
            return (Criteria) this;
        }

        public Criteria andCustomernameGreaterThanOrEqualTo(String value) {
            addCriterion("customername >=", value, "customername");
            return (Criteria) this;
        }

        public Criteria andCustomernameLessThan(String value) {
            addCriterion("customername <", value, "customername");
            return (Criteria) this;
        }

        public Criteria andCustomernameLessThanOrEqualTo(String value) {
            addCriterion("customername <=", value, "customername");
            return (Criteria) this;
        }

        public Criteria andCustomernameLike(String value) {
            addCriterion("customername like", value, "customername");
            return (Criteria) this;
        }

        public Criteria andCustomernameNotLike(String value) {
            addCriterion("customername not like", value, "customername");
            return (Criteria) this;
        }

        public Criteria andCustomernameIn(List<String> values) {
            addCriterion("customername in", values, "customername");
            return (Criteria) this;
        }

        public Criteria andCustomernameNotIn(List<String> values) {
            addCriterion("customername not in", values, "customername");
            return (Criteria) this;
        }

        public Criteria andCustomernameBetween(String value1, String value2) {
            addCriterion("customername between", value1, value2, "customername");
            return (Criteria) this;
        }

        public Criteria andCustomernameNotBetween(String value1, String value2) {
            addCriterion("customername not between", value1, value2, "customername");
            return (Criteria) this;
        }

        public Criteria andSuppliernameIsNull() {
            addCriterion("suppliername is null");
            return (Criteria) this;
        }

        public Criteria andSuppliernameIsNotNull() {
            addCriterion("suppliername is not null");
            return (Criteria) this;
        }

        public Criteria andSuppliernameEqualTo(String value) {
            addCriterion("suppliername =", value, "suppliername");
            return (Criteria) this;
        }

        public Criteria andSuppliernameNotEqualTo(String value) {
            addCriterion("suppliername <>", value, "suppliername");
            return (Criteria) this;
        }

        public Criteria andSuppliernameGreaterThan(String value) {
            addCriterion("suppliername >", value, "suppliername");
            return (Criteria) this;
        }

        public Criteria andSuppliernameGreaterThanOrEqualTo(String value) {
            addCriterion("suppliername >=", value, "suppliername");
            return (Criteria) this;
        }

        public Criteria andSuppliernameLessThan(String value) {
            addCriterion("suppliername <", value, "suppliername");
            return (Criteria) this;
        }

        public Criteria andSuppliernameLessThanOrEqualTo(String value) {
            addCriterion("suppliername <=", value, "suppliername");
            return (Criteria) this;
        }

        public Criteria andSuppliernameLike(String value) {
            addCriterion("suppliername like", value, "suppliername");
            return (Criteria) this;
        }

        public Criteria andSuppliernameNotLike(String value) {
            addCriterion("suppliername not like", value, "suppliername");
            return (Criteria) this;
        }

        public Criteria andSuppliernameIn(List<String> values) {
            addCriterion("suppliername in", values, "suppliername");
            return (Criteria) this;
        }

        public Criteria andSuppliernameNotIn(List<String> values) {
            addCriterion("suppliername not in", values, "suppliername");
            return (Criteria) this;
        }

        public Criteria andSuppliernameBetween(String value1, String value2) {
            addCriterion("suppliername between", value1, value2, "suppliername");
            return (Criteria) this;
        }

        public Criteria andSuppliernameNotBetween(String value1, String value2) {
            addCriterion("suppliername not between", value1, value2, "suppliername");
            return (Criteria) this;
        }

        public Criteria andCustomerordernoIsNull() {
            addCriterion("customerorderno is null");
            return (Criteria) this;
        }

        public Criteria andCustomerordernoIsNotNull() {
            addCriterion("customerorderno is not null");
            return (Criteria) this;
        }

        public Criteria andCustomerordernoEqualTo(Long value) {
            addCriterion("customerorderno =", value, "customerorderno");
            return (Criteria) this;
        }

        public Criteria andCustomerordernoNotEqualTo(Long value) {
            addCriterion("customerorderno <>", value, "customerorderno");
            return (Criteria) this;
        }

        public Criteria andCustomerordernoGreaterThan(Long value) {
            addCriterion("customerorderno >", value, "customerorderno");
            return (Criteria) this;
        }

        public Criteria andCustomerordernoGreaterThanOrEqualTo(Long value) {
            addCriterion("customerorderno >=", value, "customerorderno");
            return (Criteria) this;
        }

        public Criteria andCustomerordernoLessThan(Long value) {
            addCriterion("customerorderno <", value, "customerorderno");
            return (Criteria) this;
        }

        public Criteria andCustomerordernoLessThanOrEqualTo(Long value) {
            addCriterion("customerorderno <=", value, "customerorderno");
            return (Criteria) this;
        }

        public Criteria andCustomerordernoIn(List<Long> values) {
            addCriterion("customerorderno in", values, "customerorderno");
            return (Criteria) this;
        }

        public Criteria andCustomerordernoNotIn(List<Long> values) {
            addCriterion("customerorderno not in", values, "customerorderno");
            return (Criteria) this;
        }

        public Criteria andCustomerordernoBetween(Long value1, Long value2) {
            addCriterion("customerorderno between", value1, value2, "customerorderno");
            return (Criteria) this;
        }

        public Criteria andCustomerordernoNotBetween(Long value1, Long value2) {
            addCriterion("customerorderno not between", value1, value2, "customerorderno");
            return (Criteria) this;
        }

        public Criteria andAddresseeIsNull() {
            addCriterion("addressee is null");
            return (Criteria) this;
        }

        public Criteria andAddresseeIsNotNull() {
            addCriterion("addressee is not null");
            return (Criteria) this;
        }

        public Criteria andAddresseeEqualTo(String value) {
            addCriterion("addressee =", value, "addressee");
            return (Criteria) this;
        }

        public Criteria andAddresseeNotEqualTo(String value) {
            addCriterion("addressee <>", value, "addressee");
            return (Criteria) this;
        }

        public Criteria andAddresseeGreaterThan(String value) {
            addCriterion("addressee >", value, "addressee");
            return (Criteria) this;
        }

        public Criteria andAddresseeGreaterThanOrEqualTo(String value) {
            addCriterion("addressee >=", value, "addressee");
            return (Criteria) this;
        }

        public Criteria andAddresseeLessThan(String value) {
            addCriterion("addressee <", value, "addressee");
            return (Criteria) this;
        }

        public Criteria andAddresseeLessThanOrEqualTo(String value) {
            addCriterion("addressee <=", value, "addressee");
            return (Criteria) this;
        }

        public Criteria andAddresseeLike(String value) {
            addCriterion("addressee like", value, "addressee");
            return (Criteria) this;
        }

        public Criteria andAddresseeNotLike(String value) {
            addCriterion("addressee not like", value, "addressee");
            return (Criteria) this;
        }

        public Criteria andAddresseeIn(List<String> values) {
            addCriterion("addressee in", values, "addressee");
            return (Criteria) this;
        }

        public Criteria andAddresseeNotIn(List<String> values) {
            addCriterion("addressee not in", values, "addressee");
            return (Criteria) this;
        }

        public Criteria andAddresseeBetween(String value1, String value2) {
            addCriterion("addressee between", value1, value2, "addressee");
            return (Criteria) this;
        }

        public Criteria andAddresseeNotBetween(String value1, String value2) {
            addCriterion("addressee not between", value1, value2, "addressee");
            return (Criteria) this;
        }

        public Criteria andDearcustomerIsNull() {
            addCriterion("dearcustomer is null");
            return (Criteria) this;
        }

        public Criteria andDearcustomerIsNotNull() {
            addCriterion("dearcustomer is not null");
            return (Criteria) this;
        }

        public Criteria andDearcustomerEqualTo(String value) {
            addCriterion("dearcustomer =", value, "dearcustomer");
            return (Criteria) this;
        }

        public Criteria andDearcustomerNotEqualTo(String value) {
            addCriterion("dearcustomer <>", value, "dearcustomer");
            return (Criteria) this;
        }

        public Criteria andDearcustomerGreaterThan(String value) {
            addCriterion("dearcustomer >", value, "dearcustomer");
            return (Criteria) this;
        }

        public Criteria andDearcustomerGreaterThanOrEqualTo(String value) {
            addCriterion("dearcustomer >=", value, "dearcustomer");
            return (Criteria) this;
        }

        public Criteria andDearcustomerLessThan(String value) {
            addCriterion("dearcustomer <", value, "dearcustomer");
            return (Criteria) this;
        }

        public Criteria andDearcustomerLessThanOrEqualTo(String value) {
            addCriterion("dearcustomer <=", value, "dearcustomer");
            return (Criteria) this;
        }

        public Criteria andDearcustomerLike(String value) {
            addCriterion("dearcustomer like", value, "dearcustomer");
            return (Criteria) this;
        }

        public Criteria andDearcustomerNotLike(String value) {
            addCriterion("dearcustomer not like", value, "dearcustomer");
            return (Criteria) this;
        }

        public Criteria andDearcustomerIn(List<String> values) {
            addCriterion("dearcustomer in", values, "dearcustomer");
            return (Criteria) this;
        }

        public Criteria andDearcustomerNotIn(List<String> values) {
            addCriterion("dearcustomer not in", values, "dearcustomer");
            return (Criteria) this;
        }

        public Criteria andDearcustomerBetween(String value1, String value2) {
            addCriterion("dearcustomer between", value1, value2, "dearcustomer");
            return (Criteria) this;
        }

        public Criteria andDearcustomerNotBetween(String value1, String value2) {
            addCriterion("dearcustomer not between", value1, value2, "dearcustomer");
            return (Criteria) this;
        }

        public Criteria andOrderdateIsNull() {
            addCriterion("orderdate is null");
            return (Criteria) this;
        }

        public Criteria andOrderdateIsNotNull() {
            addCriterion("orderdate is not null");
            return (Criteria) this;
        }

        public Criteria andOrderdateEqualTo(Date value) {
            addCriterionForJDBCDate("orderdate =", value, "orderdate");
            return (Criteria) this;
        }

        public Criteria andOrderdateNotEqualTo(Date value) {
            addCriterionForJDBCDate("orderdate <>", value, "orderdate");
            return (Criteria) this;
        }

        public Criteria andOrderdateGreaterThan(Date value) {
            addCriterionForJDBCDate("orderdate >", value, "orderdate");
            return (Criteria) this;
        }

        public Criteria andOrderdateGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("orderdate >=", value, "orderdate");
            return (Criteria) this;
        }

        public Criteria andOrderdateLessThan(Date value) {
            addCriterionForJDBCDate("orderdate <", value, "orderdate");
            return (Criteria) this;
        }

        public Criteria andOrderdateLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("orderdate <=", value, "orderdate");
            return (Criteria) this;
        }

        public Criteria andOrderdateIn(List<Date> values) {
            addCriterionForJDBCDate("orderdate in", values, "orderdate");
            return (Criteria) this;
        }

        public Criteria andOrderdateNotIn(List<Date> values) {
            addCriterionForJDBCDate("orderdate not in", values, "orderdate");
            return (Criteria) this;
        }

        public Criteria andOrderdateBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("orderdate between", value1, value2, "orderdate");
            return (Criteria) this;
        }

        public Criteria andOrderdateNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("orderdate not between", value1, value2, "orderdate");
            return (Criteria) this;
        }

        public Criteria andDeliverydateIsNull() {
            addCriterion("deliverydate is null");
            return (Criteria) this;
        }

        public Criteria andDeliverydateIsNotNull() {
            addCriterion("deliverydate is not null");
            return (Criteria) this;
        }

        public Criteria andDeliverydateEqualTo(Date value) {
            addCriterionForJDBCDate("deliverydate =", value, "deliverydate");
            return (Criteria) this;
        }

        public Criteria andDeliverydateNotEqualTo(Date value) {
            addCriterionForJDBCDate("deliverydate <>", value, "deliverydate");
            return (Criteria) this;
        }

        public Criteria andDeliverydateGreaterThan(Date value) {
            addCriterionForJDBCDate("deliverydate >", value, "deliverydate");
            return (Criteria) this;
        }

        public Criteria andDeliverydateGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("deliverydate >=", value, "deliverydate");
            return (Criteria) this;
        }

        public Criteria andDeliverydateLessThan(Date value) {
            addCriterionForJDBCDate("deliverydate <", value, "deliverydate");
            return (Criteria) this;
        }

        public Criteria andDeliverydateLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("deliverydate <=", value, "deliverydate");
            return (Criteria) this;
        }

        public Criteria andDeliverydateIn(List<Date> values) {
            addCriterionForJDBCDate("deliverydate in", values, "deliverydate");
            return (Criteria) this;
        }

        public Criteria andDeliverydateNotIn(List<Date> values) {
            addCriterionForJDBCDate("deliverydate not in", values, "deliverydate");
            return (Criteria) this;
        }

        public Criteria andDeliverydateBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("deliverydate between", value1, value2, "deliverydate");
            return (Criteria) this;
        }

        public Criteria andDeliverydateNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("deliverydate not between", value1, value2, "deliverydate");
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

        public Criteria andStatusEqualTo(Long value) {
            addCriterion("status =", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotEqualTo(Long value) {
            addCriterion("status <>", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThan(Long value) {
            addCriterion("status >", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThanOrEqualTo(Long value) {
            addCriterion("status >=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThan(Long value) {
            addCriterion("status <", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThanOrEqualTo(Long value) {
            addCriterion("status <=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusIn(List<Long> values) {
            addCriterion("status in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotIn(List<Long> values) {
            addCriterion("status not in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusBetween(Long value1, Long value2) {
            addCriterion("status between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotBetween(Long value1, Long value2) {
            addCriterion("status not between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andCustomerremarksIsNull() {
            addCriterion("customerremarks is null");
            return (Criteria) this;
        }

        public Criteria andCustomerremarksIsNotNull() {
            addCriterion("customerremarks is not null");
            return (Criteria) this;
        }

        public Criteria andCustomerremarksEqualTo(String value) {
            addCriterion("customerremarks =", value, "customerremarks");
            return (Criteria) this;
        }

        public Criteria andCustomerremarksNotEqualTo(String value) {
            addCriterion("customerremarks <>", value, "customerremarks");
            return (Criteria) this;
        }

        public Criteria andCustomerremarksGreaterThan(String value) {
            addCriterion("customerremarks >", value, "customerremarks");
            return (Criteria) this;
        }

        public Criteria andCustomerremarksGreaterThanOrEqualTo(String value) {
            addCriterion("customerremarks >=", value, "customerremarks");
            return (Criteria) this;
        }

        public Criteria andCustomerremarksLessThan(String value) {
            addCriterion("customerremarks <", value, "customerremarks");
            return (Criteria) this;
        }

        public Criteria andCustomerremarksLessThanOrEqualTo(String value) {
            addCriterion("customerremarks <=", value, "customerremarks");
            return (Criteria) this;
        }

        public Criteria andCustomerremarksLike(String value) {
            addCriterion("customerremarks like", value, "customerremarks");
            return (Criteria) this;
        }

        public Criteria andCustomerremarksNotLike(String value) {
            addCriterion("customerremarks not like", value, "customerremarks");
            return (Criteria) this;
        }

        public Criteria andCustomerremarksIn(List<String> values) {
            addCriterion("customerremarks in", values, "customerremarks");
            return (Criteria) this;
        }

        public Criteria andCustomerremarksNotIn(List<String> values) {
            addCriterion("customerremarks not in", values, "customerremarks");
            return (Criteria) this;
        }

        public Criteria andCustomerremarksBetween(String value1, String value2) {
            addCriterion("customerremarks between", value1, value2, "customerremarks");
            return (Criteria) this;
        }

        public Criteria andCustomerremarksNotBetween(String value1, String value2) {
            addCriterion("customerremarks not between", value1, value2, "customerremarks");
            return (Criteria) this;
        }

        public Criteria andMyordersheetIsNull() {
            addCriterion("myordersheet is null");
            return (Criteria) this;
        }

        public Criteria andMyordersheetIsNotNull() {
            addCriterion("myordersheet is not null");
            return (Criteria) this;
        }

        public Criteria andMyordersheetEqualTo(Long value) {
            addCriterion("myordersheet =", value, "myordersheet");
            return (Criteria) this;
        }

        public Criteria andMyordersheetNotEqualTo(Long value) {
            addCriterion("myordersheet <>", value, "myordersheet");
            return (Criteria) this;
        }

        public Criteria andMyordersheetGreaterThan(Long value) {
            addCriterion("myordersheet >", value, "myordersheet");
            return (Criteria) this;
        }

        public Criteria andMyordersheetGreaterThanOrEqualTo(Long value) {
            addCriterion("myordersheet >=", value, "myordersheet");
            return (Criteria) this;
        }

        public Criteria andMyordersheetLessThan(Long value) {
            addCriterion("myordersheet <", value, "myordersheet");
            return (Criteria) this;
        }

        public Criteria andMyordersheetLessThanOrEqualTo(Long value) {
            addCriterion("myordersheet <=", value, "myordersheet");
            return (Criteria) this;
        }

        public Criteria andMyordersheetIn(List<Long> values) {
            addCriterion("myordersheet in", values, "myordersheet");
            return (Criteria) this;
        }

        public Criteria andMyordersheetNotIn(List<Long> values) {
            addCriterion("myordersheet not in", values, "myordersheet");
            return (Criteria) this;
        }

        public Criteria andMyordersheetBetween(Long value1, Long value2) {
            addCriterion("myordersheet between", value1, value2, "myordersheet");
            return (Criteria) this;
        }

        public Criteria andMyordersheetNotBetween(Long value1, Long value2) {
            addCriterion("myordersheet not between", value1, value2, "myordersheet");
            return (Criteria) this;
        }

        public Criteria andPurchasehistoryIsNull() {
            addCriterion("purchasehistory is null");
            return (Criteria) this;
        }

        public Criteria andPurchasehistoryIsNotNull() {
            addCriterion("purchasehistory is not null");
            return (Criteria) this;
        }

        public Criteria andPurchasehistoryEqualTo(Long value) {
            addCriterion("purchasehistory =", value, "purchasehistory");
            return (Criteria) this;
        }

        public Criteria andPurchasehistoryNotEqualTo(Long value) {
            addCriterion("purchasehistory <>", value, "purchasehistory");
            return (Criteria) this;
        }

        public Criteria andPurchasehistoryGreaterThan(Long value) {
            addCriterion("purchasehistory >", value, "purchasehistory");
            return (Criteria) this;
        }

        public Criteria andPurchasehistoryGreaterThanOrEqualTo(Long value) {
            addCriterion("purchasehistory >=", value, "purchasehistory");
            return (Criteria) this;
        }

        public Criteria andPurchasehistoryLessThan(Long value) {
            addCriterion("purchasehistory <", value, "purchasehistory");
            return (Criteria) this;
        }

        public Criteria andPurchasehistoryLessThanOrEqualTo(Long value) {
            addCriterion("purchasehistory <=", value, "purchasehistory");
            return (Criteria) this;
        }

        public Criteria andPurchasehistoryIn(List<Long> values) {
            addCriterion("purchasehistory in", values, "purchasehistory");
            return (Criteria) this;
        }

        public Criteria andPurchasehistoryNotIn(List<Long> values) {
            addCriterion("purchasehistory not in", values, "purchasehistory");
            return (Criteria) this;
        }

        public Criteria andPurchasehistoryBetween(Long value1, Long value2) {
            addCriterion("purchasehistory between", value1, value2, "purchasehistory");
            return (Criteria) this;
        }

        public Criteria andPurchasehistoryNotBetween(Long value1, Long value2) {
            addCriterion("purchasehistory not between", value1, value2, "purchasehistory");
            return (Criteria) this;
        }

        public Criteria andProductcodeIsNull() {
            addCriterion("productcode is null");
            return (Criteria) this;
        }

        public Criteria andProductcodeIsNotNull() {
            addCriterion("productcode is not null");
            return (Criteria) this;
        }

        public Criteria andProductcodeEqualTo(Long value) {
            addCriterion("productcode =", value, "productcode");
            return (Criteria) this;
        }

        public Criteria andProductcodeNotEqualTo(Long value) {
            addCriterion("productcode <>", value, "productcode");
            return (Criteria) this;
        }

        public Criteria andProductcodeGreaterThan(Long value) {
            addCriterion("productcode >", value, "productcode");
            return (Criteria) this;
        }

        public Criteria andProductcodeGreaterThanOrEqualTo(Long value) {
            addCriterion("productcode >=", value, "productcode");
            return (Criteria) this;
        }

        public Criteria andProductcodeLessThan(Long value) {
            addCriterion("productcode <", value, "productcode");
            return (Criteria) this;
        }

        public Criteria andProductcodeLessThanOrEqualTo(Long value) {
            addCriterion("productcode <=", value, "productcode");
            return (Criteria) this;
        }

        public Criteria andProductcodeIn(List<Long> values) {
            addCriterion("productcode in", values, "productcode");
            return (Criteria) this;
        }

        public Criteria andProductcodeNotIn(List<Long> values) {
            addCriterion("productcode not in", values, "productcode");
            return (Criteria) this;
        }

        public Criteria andProductcodeBetween(Long value1, Long value2) {
            addCriterion("productcode between", value1, value2, "productcode");
            return (Criteria) this;
        }

        public Criteria andProductcodeNotBetween(Long value1, Long value2) {
            addCriterion("productcode not between", value1, value2, "productcode");
            return (Criteria) this;
        }

        public Criteria andItemnameIsNull() {
            addCriterion("itemname is null");
            return (Criteria) this;
        }

        public Criteria andItemnameIsNotNull() {
            addCriterion("itemname is not null");
            return (Criteria) this;
        }

        public Criteria andItemnameEqualTo(String value) {
            addCriterion("itemname =", value, "itemname");
            return (Criteria) this;
        }

        public Criteria andItemnameNotEqualTo(String value) {
            addCriterion("itemname <>", value, "itemname");
            return (Criteria) this;
        }

        public Criteria andItemnameGreaterThan(String value) {
            addCriterion("itemname >", value, "itemname");
            return (Criteria) this;
        }

        public Criteria andItemnameGreaterThanOrEqualTo(String value) {
            addCriterion("itemname >=", value, "itemname");
            return (Criteria) this;
        }

        public Criteria andItemnameLessThan(String value) {
            addCriterion("itemname <", value, "itemname");
            return (Criteria) this;
        }

        public Criteria andItemnameLessThanOrEqualTo(String value) {
            addCriterion("itemname <=", value, "itemname");
            return (Criteria) this;
        }

        public Criteria andItemnameLike(String value) {
            addCriterion("itemname like", value, "itemname");
            return (Criteria) this;
        }

        public Criteria andItemnameNotLike(String value) {
            addCriterion("itemname not like", value, "itemname");
            return (Criteria) this;
        }

        public Criteria andItemnameIn(List<String> values) {
            addCriterion("itemname in", values, "itemname");
            return (Criteria) this;
        }

        public Criteria andItemnameNotIn(List<String> values) {
            addCriterion("itemname not in", values, "itemname");
            return (Criteria) this;
        }

        public Criteria andItemnameBetween(String value1, String value2) {
            addCriterion("itemname between", value1, value2, "itemname");
            return (Criteria) this;
        }

        public Criteria andItemnameNotBetween(String value1, String value2) {
            addCriterion("itemname not between", value1, value2, "itemname");
            return (Criteria) this;
        }

        public Criteria andQuantityIsNull() {
            addCriterion("quantity is null");
            return (Criteria) this;
        }

        public Criteria andQuantityIsNotNull() {
            addCriterion("quantity is not null");
            return (Criteria) this;
        }

        public Criteria andQuantityEqualTo(Long value) {
            addCriterion("quantity =", value, "quantity");
            return (Criteria) this;
        }

        public Criteria andQuantityNotEqualTo(Long value) {
            addCriterion("quantity <>", value, "quantity");
            return (Criteria) this;
        }

        public Criteria andQuantityGreaterThan(Long value) {
            addCriterion("quantity >", value, "quantity");
            return (Criteria) this;
        }

        public Criteria andQuantityGreaterThanOrEqualTo(Long value) {
            addCriterion("quantity >=", value, "quantity");
            return (Criteria) this;
        }

        public Criteria andQuantityLessThan(Long value) {
            addCriterion("quantity <", value, "quantity");
            return (Criteria) this;
        }

        public Criteria andQuantityLessThanOrEqualTo(Long value) {
            addCriterion("quantity <=", value, "quantity");
            return (Criteria) this;
        }

        public Criteria andQuantityIn(List<Long> values) {
            addCriterion("quantity in", values, "quantity");
            return (Criteria) this;
        }

        public Criteria andQuantityNotIn(List<Long> values) {
            addCriterion("quantity not in", values, "quantity");
            return (Criteria) this;
        }

        public Criteria andQuantityBetween(Long value1, Long value2) {
            addCriterion("quantity between", value1, value2, "quantity");
            return (Criteria) this;
        }

        public Criteria andQuantityNotBetween(Long value1, Long value2) {
            addCriterion("quantity not between", value1, value2, "quantity");
            return (Criteria) this;
        }

        public Criteria andNumberofordersIsNull() {
            addCriterion("numberoforders is null");
            return (Criteria) this;
        }

        public Criteria andNumberofordersIsNotNull() {
            addCriterion("numberoforders is not null");
            return (Criteria) this;
        }

        public Criteria andNumberofordersEqualTo(Long value) {
            addCriterion("numberoforders =", value, "numberoforders");
            return (Criteria) this;
        }

        public Criteria andNumberofordersNotEqualTo(Long value) {
            addCriterion("numberoforders <>", value, "numberoforders");
            return (Criteria) this;
        }

        public Criteria andNumberofordersGreaterThan(Long value) {
            addCriterion("numberoforders >", value, "numberoforders");
            return (Criteria) this;
        }

        public Criteria andNumberofordersGreaterThanOrEqualTo(Long value) {
            addCriterion("numberoforders >=", value, "numberoforders");
            return (Criteria) this;
        }

        public Criteria andNumberofordersLessThan(Long value) {
            addCriterion("numberoforders <", value, "numberoforders");
            return (Criteria) this;
        }

        public Criteria andNumberofordersLessThanOrEqualTo(Long value) {
            addCriterion("numberoforders <=", value, "numberoforders");
            return (Criteria) this;
        }

        public Criteria andNumberofordersIn(List<Long> values) {
            addCriterion("numberoforders in", values, "numberoforders");
            return (Criteria) this;
        }

        public Criteria andNumberofordersNotIn(List<Long> values) {
            addCriterion("numberoforders not in", values, "numberoforders");
            return (Criteria) this;
        }

        public Criteria andNumberofordersBetween(Long value1, Long value2) {
            addCriterion("numberoforders between", value1, value2, "numberoforders");
            return (Criteria) this;
        }

        public Criteria andNumberofordersNotBetween(Long value1, Long value2) {
            addCriterion("numberoforders not between", value1, value2, "numberoforders");
            return (Criteria) this;
        }

        public Criteria andTotalnumberIsNull() {
            addCriterion("totalnumber is null");
            return (Criteria) this;
        }

        public Criteria andTotalnumberIsNotNull() {
            addCriterion("totalnumber is not null");
            return (Criteria) this;
        }

        public Criteria andTotalnumberEqualTo(Long value) {
            addCriterion("totalnumber =", value, "totalnumber");
            return (Criteria) this;
        }

        public Criteria andTotalnumberNotEqualTo(Long value) {
            addCriterion("totalnumber <>", value, "totalnumber");
            return (Criteria) this;
        }

        public Criteria andTotalnumberGreaterThan(Long value) {
            addCriterion("totalnumber >", value, "totalnumber");
            return (Criteria) this;
        }

        public Criteria andTotalnumberGreaterThanOrEqualTo(Long value) {
            addCriterion("totalnumber >=", value, "totalnumber");
            return (Criteria) this;
        }

        public Criteria andTotalnumberLessThan(Long value) {
            addCriterion("totalnumber <", value, "totalnumber");
            return (Criteria) this;
        }

        public Criteria andTotalnumberLessThanOrEqualTo(Long value) {
            addCriterion("totalnumber <=", value, "totalnumber");
            return (Criteria) this;
        }

        public Criteria andTotalnumberIn(List<Long> values) {
            addCriterion("totalnumber in", values, "totalnumber");
            return (Criteria) this;
        }

        public Criteria andTotalnumberNotIn(List<Long> values) {
            addCriterion("totalnumber not in", values, "totalnumber");
            return (Criteria) this;
        }

        public Criteria andTotalnumberBetween(Long value1, Long value2) {
            addCriterion("totalnumber between", value1, value2, "totalnumber");
            return (Criteria) this;
        }

        public Criteria andTotalnumberNotBetween(Long value1, Long value2) {
            addCriterion("totalnumber not between", value1, value2, "totalnumber");
            return (Criteria) this;
        }

        public Criteria andRemarksIsNull() {
            addCriterion("remarks is null");
            return (Criteria) this;
        }

        public Criteria andRemarksIsNotNull() {
            addCriterion("remarks is not null");
            return (Criteria) this;
        }

        public Criteria andRemarksEqualTo(String value) {
            addCriterion("remarks =", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksNotEqualTo(String value) {
            addCriterion("remarks <>", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksGreaterThan(String value) {
            addCriterion("remarks >", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksGreaterThanOrEqualTo(String value) {
            addCriterion("remarks >=", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksLessThan(String value) {
            addCriterion("remarks <", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksLessThanOrEqualTo(String value) {
            addCriterion("remarks <=", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksLike(String value) {
            addCriterion("remarks like", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksNotLike(String value) {
            addCriterion("remarks not like", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksIn(List<String> values) {
            addCriterion("remarks in", values, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksNotIn(List<String> values) {
            addCriterion("remarks not in", values, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksBetween(String value1, String value2) {
            addCriterion("remarks between", value1, value2, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksNotBetween(String value1, String value2) {
            addCriterion("remarks not between", value1, value2, "remarks");
            return (Criteria) this;
        }

        public Criteria andExpectedarrivaldatelIsNull() {
            addCriterion("expectedarrivaldatel is null");
            return (Criteria) this;
        }

        public Criteria andExpectedarrivaldatelIsNotNull() {
            addCriterion("expectedarrivaldatel is not null");
            return (Criteria) this;
        }

        public Criteria andExpectedarrivaldatelEqualTo(Date value) {
            addCriterionForJDBCDate("expectedarrivaldatel =", value, "expectedarrivaldatel");
            return (Criteria) this;
        }

        public Criteria andExpectedarrivaldatelNotEqualTo(Date value) {
            addCriterionForJDBCDate("expectedarrivaldatel <>", value, "expectedarrivaldatel");
            return (Criteria) this;
        }

        public Criteria andExpectedarrivaldatelGreaterThan(Date value) {
            addCriterionForJDBCDate("expectedarrivaldatel >", value, "expectedarrivaldatel");
            return (Criteria) this;
        }

        public Criteria andExpectedarrivaldatelGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("expectedarrivaldatel >=", value, "expectedarrivaldatel");
            return (Criteria) this;
        }

        public Criteria andExpectedarrivaldatelLessThan(Date value) {
            addCriterionForJDBCDate("expectedarrivaldatel <", value, "expectedarrivaldatel");
            return (Criteria) this;
        }

        public Criteria andExpectedarrivaldatelLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("expectedarrivaldatel <=", value, "expectedarrivaldatel");
            return (Criteria) this;
        }

        public Criteria andExpectedarrivaldatelIn(List<Date> values) {
            addCriterionForJDBCDate("expectedarrivaldatel in", values, "expectedarrivaldatel");
            return (Criteria) this;
        }

        public Criteria andExpectedarrivaldatelNotIn(List<Date> values) {
            addCriterionForJDBCDate("expectedarrivaldatel not in", values, "expectedarrivaldatel");
            return (Criteria) this;
        }

        public Criteria andExpectedarrivaldatelBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("expectedarrivaldatel between", value1, value2, "expectedarrivaldatel");
            return (Criteria) this;
        }

        public Criteria andExpectedarrivaldatelNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("expectedarrivaldatel not between", value1, value2, "expectedarrivaldatel");
            return (Criteria) this;
        }

        public Criteria andDeliverynoteattentionIsNull() {
            addCriterion("deliverynoteattention is null");
            return (Criteria) this;
        }

        public Criteria andDeliverynoteattentionIsNotNull() {
            addCriterion("deliverynoteattention is not null");
            return (Criteria) this;
        }

        public Criteria andDeliverynoteattentionEqualTo(String value) {
            addCriterion("deliverynoteattention =", value, "deliverynoteattention");
            return (Criteria) this;
        }

        public Criteria andDeliverynoteattentionNotEqualTo(String value) {
            addCriterion("deliverynoteattention <>", value, "deliverynoteattention");
            return (Criteria) this;
        }

        public Criteria andDeliverynoteattentionGreaterThan(String value) {
            addCriterion("deliverynoteattention >", value, "deliverynoteattention");
            return (Criteria) this;
        }

        public Criteria andDeliverynoteattentionGreaterThanOrEqualTo(String value) {
            addCriterion("deliverynoteattention >=", value, "deliverynoteattention");
            return (Criteria) this;
        }

        public Criteria andDeliverynoteattentionLessThan(String value) {
            addCriterion("deliverynoteattention <", value, "deliverynoteattention");
            return (Criteria) this;
        }

        public Criteria andDeliverynoteattentionLessThanOrEqualTo(String value) {
            addCriterion("deliverynoteattention <=", value, "deliverynoteattention");
            return (Criteria) this;
        }

        public Criteria andDeliverynoteattentionLike(String value) {
            addCriterion("deliverynoteattention like", value, "deliverynoteattention");
            return (Criteria) this;
        }

        public Criteria andDeliverynoteattentionNotLike(String value) {
            addCriterion("deliverynoteattention not like", value, "deliverynoteattention");
            return (Criteria) this;
        }

        public Criteria andDeliverynoteattentionIn(List<String> values) {
            addCriterion("deliverynoteattention in", values, "deliverynoteattention");
            return (Criteria) this;
        }

        public Criteria andDeliverynoteattentionNotIn(List<String> values) {
            addCriterion("deliverynoteattention not in", values, "deliverynoteattention");
            return (Criteria) this;
        }

        public Criteria andDeliverynoteattentionBetween(String value1, String value2) {
            addCriterion("deliverynoteattention between", value1, value2, "deliverynoteattention");
            return (Criteria) this;
        }

        public Criteria andDeliverynoteattentionNotBetween(String value1, String value2) {
            addCriterion("deliverynoteattention not between", value1, value2, "deliverynoteattention");
            return (Criteria) this;
        }

        public Criteria andLastorderdateIsNull() {
            addCriterion("lastorderdate is null");
            return (Criteria) this;
        }

        public Criteria andLastorderdateIsNotNull() {
            addCriterion("lastorderdate is not null");
            return (Criteria) this;
        }

        public Criteria andLastorderdateEqualTo(Date value) {
            addCriterionForJDBCDate("lastorderdate =", value, "lastorderdate");
            return (Criteria) this;
        }

        public Criteria andLastorderdateNotEqualTo(Date value) {
            addCriterionForJDBCDate("lastorderdate <>", value, "lastorderdate");
            return (Criteria) this;
        }

        public Criteria andLastorderdateGreaterThan(Date value) {
            addCriterionForJDBCDate("lastorderdate >", value, "lastorderdate");
            return (Criteria) this;
        }

        public Criteria andLastorderdateGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("lastorderdate >=", value, "lastorderdate");
            return (Criteria) this;
        }

        public Criteria andLastorderdateLessThan(Date value) {
            addCriterionForJDBCDate("lastorderdate <", value, "lastorderdate");
            return (Criteria) this;
        }

        public Criteria andLastorderdateLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("lastorderdate <=", value, "lastorderdate");
            return (Criteria) this;
        }

        public Criteria andLastorderdateIn(List<Date> values) {
            addCriterionForJDBCDate("lastorderdate in", values, "lastorderdate");
            return (Criteria) this;
        }

        public Criteria andLastorderdateNotIn(List<Date> values) {
            addCriterionForJDBCDate("lastorderdate not in", values, "lastorderdate");
            return (Criteria) this;
        }

        public Criteria andLastorderdateBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("lastorderdate between", value1, value2, "lastorderdate");
            return (Criteria) this;
        }

        public Criteria andLastorderdateNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("lastorderdate not between", value1, value2, "lastorderdate");
            return (Criteria) this;
        }

        public Criteria andLastordernumberIsNull() {
            addCriterion("lastordernumber is null");
            return (Criteria) this;
        }

        public Criteria andLastordernumberIsNotNull() {
            addCriterion("lastordernumber is not null");
            return (Criteria) this;
        }

        public Criteria andLastordernumberEqualTo(Long value) {
            addCriterion("lastordernumber =", value, "lastordernumber");
            return (Criteria) this;
        }

        public Criteria andLastordernumberNotEqualTo(Long value) {
            addCriterion("lastordernumber <>", value, "lastordernumber");
            return (Criteria) this;
        }

        public Criteria andLastordernumberGreaterThan(Long value) {
            addCriterion("lastordernumber >", value, "lastordernumber");
            return (Criteria) this;
        }

        public Criteria andLastordernumberGreaterThanOrEqualTo(Long value) {
            addCriterion("lastordernumber >=", value, "lastordernumber");
            return (Criteria) this;
        }

        public Criteria andLastordernumberLessThan(Long value) {
            addCriterion("lastordernumber <", value, "lastordernumber");
            return (Criteria) this;
        }

        public Criteria andLastordernumberLessThanOrEqualTo(Long value) {
            addCriterion("lastordernumber <=", value, "lastordernumber");
            return (Criteria) this;
        }

        public Criteria andLastordernumberIn(List<Long> values) {
            addCriterion("lastordernumber in", values, "lastordernumber");
            return (Criteria) this;
        }

        public Criteria andLastordernumberNotIn(List<Long> values) {
            addCriterion("lastordernumber not in", values, "lastordernumber");
            return (Criteria) this;
        }

        public Criteria andLastordernumberBetween(Long value1, Long value2) {
            addCriterion("lastordernumber between", value1, value2, "lastordernumber");
            return (Criteria) this;
        }

        public Criteria andLastordernumberNotBetween(Long value1, Long value2) {
            addCriterion("lastordernumber not between", value1, value2, "lastordernumber");
            return (Criteria) this;
        }

        public Criteria andShipdateIsNull() {
            addCriterion("shipdate is null");
            return (Criteria) this;
        }

        public Criteria andShipdateIsNotNull() {
            addCriterion("shipdate is not null");
            return (Criteria) this;
        }

        public Criteria andShipdateEqualTo(Date value) {
            addCriterionForJDBCDate("shipdate =", value, "shipdate");
            return (Criteria) this;
        }

        public Criteria andShipdateNotEqualTo(Date value) {
            addCriterionForJDBCDate("shipdate <>", value, "shipdate");
            return (Criteria) this;
        }

        public Criteria andShipdateGreaterThan(Date value) {
            addCriterionForJDBCDate("shipdate >", value, "shipdate");
            return (Criteria) this;
        }

        public Criteria andShipdateGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("shipdate >=", value, "shipdate");
            return (Criteria) this;
        }

        public Criteria andShipdateLessThan(Date value) {
            addCriterionForJDBCDate("shipdate <", value, "shipdate");
            return (Criteria) this;
        }

        public Criteria andShipdateLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("shipdate <=", value, "shipdate");
            return (Criteria) this;
        }

        public Criteria andShipdateIn(List<Date> values) {
            addCriterionForJDBCDate("shipdate in", values, "shipdate");
            return (Criteria) this;
        }

        public Criteria andShipdateNotIn(List<Date> values) {
            addCriterionForJDBCDate("shipdate not in", values, "shipdate");
            return (Criteria) this;
        }

        public Criteria andShipdateBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("shipdate between", value1, value2, "shipdate");
            return (Criteria) this;
        }

        public Criteria andShipdateNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("shipdate not between", value1, value2, "shipdate");
            return (Criteria) this;
        }

        public Criteria andArrivaldateIsNull() {
            addCriterion("arrivaldate is null");
            return (Criteria) this;
        }

        public Criteria andArrivaldateIsNotNull() {
            addCriterion("arrivaldate is not null");
            return (Criteria) this;
        }

        public Criteria andArrivaldateEqualTo(Date value) {
            addCriterionForJDBCDate("arrivaldate =", value, "arrivaldate");
            return (Criteria) this;
        }

        public Criteria andArrivaldateNotEqualTo(Date value) {
            addCriterionForJDBCDate("arrivaldate <>", value, "arrivaldate");
            return (Criteria) this;
        }

        public Criteria andArrivaldateGreaterThan(Date value) {
            addCriterionForJDBCDate("arrivaldate >", value, "arrivaldate");
            return (Criteria) this;
        }

        public Criteria andArrivaldateGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("arrivaldate >=", value, "arrivaldate");
            return (Criteria) this;
        }

        public Criteria andArrivaldateLessThan(Date value) {
            addCriterionForJDBCDate("arrivaldate <", value, "arrivaldate");
            return (Criteria) this;
        }

        public Criteria andArrivaldateLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("arrivaldate <=", value, "arrivaldate");
            return (Criteria) this;
        }

        public Criteria andArrivaldateIn(List<Date> values) {
            addCriterionForJDBCDate("arrivaldate in", values, "arrivaldate");
            return (Criteria) this;
        }

        public Criteria andArrivaldateNotIn(List<Date> values) {
            addCriterionForJDBCDate("arrivaldate not in", values, "arrivaldate");
            return (Criteria) this;
        }

        public Criteria andArrivaldateBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("arrivaldate between", value1, value2, "arrivaldate");
            return (Criteria) this;
        }

        public Criteria andArrivaldateNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("arrivaldate not between", value1, value2, "arrivaldate");
            return (Criteria) this;
        }

        public Criteria andProductdeliverytimeIsNull() {
            addCriterion("productdeliverytime is null");
            return (Criteria) this;
        }

        public Criteria andProductdeliverytimeIsNotNull() {
            addCriterion("productdeliverytime is not null");
            return (Criteria) this;
        }

        public Criteria andProductdeliverytimeEqualTo(Date value) {
            addCriterionForJDBCDate("productdeliverytime =", value, "productdeliverytime");
            return (Criteria) this;
        }

        public Criteria andProductdeliverytimeNotEqualTo(Date value) {
            addCriterionForJDBCDate("productdeliverytime <>", value, "productdeliverytime");
            return (Criteria) this;
        }

        public Criteria andProductdeliverytimeGreaterThan(Date value) {
            addCriterionForJDBCDate("productdeliverytime >", value, "productdeliverytime");
            return (Criteria) this;
        }

        public Criteria andProductdeliverytimeGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("productdeliverytime >=", value, "productdeliverytime");
            return (Criteria) this;
        }

        public Criteria andProductdeliverytimeLessThan(Date value) {
            addCriterionForJDBCDate("productdeliverytime <", value, "productdeliverytime");
            return (Criteria) this;
        }

        public Criteria andProductdeliverytimeLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("productdeliverytime <=", value, "productdeliverytime");
            return (Criteria) this;
        }

        public Criteria andProductdeliverytimeIn(List<Date> values) {
            addCriterionForJDBCDate("productdeliverytime in", values, "productdeliverytime");
            return (Criteria) this;
        }

        public Criteria andProductdeliverytimeNotIn(List<Date> values) {
            addCriterionForJDBCDate("productdeliverytime not in", values, "productdeliverytime");
            return (Criteria) this;
        }

        public Criteria andProductdeliverytimeBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("productdeliverytime between", value1, value2, "productdeliverytime");
            return (Criteria) this;
        }

        public Criteria andProductdeliverytimeNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("productdeliverytime not between", value1, value2, "productdeliverytime");
            return (Criteria) this;
        }

        public Criteria andCustnumberIsNull() {
            addCriterion("custnumber is null");
            return (Criteria) this;
        }

        public Criteria andCustnumberIsNotNull() {
            addCriterion("custnumber is not null");
            return (Criteria) this;
        }

        public Criteria andCustnumberEqualTo(Long value) {
            addCriterion("custnumber =", value, "custnumber");
            return (Criteria) this;
        }

        public Criteria andCustnumberNotEqualTo(Long value) {
            addCriterion("custnumber <>", value, "custnumber");
            return (Criteria) this;
        }

        public Criteria andCustnumberGreaterThan(Long value) {
            addCriterion("custnumber >", value, "custnumber");
            return (Criteria) this;
        }

        public Criteria andCustnumberGreaterThanOrEqualTo(Long value) {
            addCriterion("custnumber >=", value, "custnumber");
            return (Criteria) this;
        }

        public Criteria andCustnumberLessThan(Long value) {
            addCriterion("custnumber <", value, "custnumber");
            return (Criteria) this;
        }

        public Criteria andCustnumberLessThanOrEqualTo(Long value) {
            addCriterion("custnumber <=", value, "custnumber");
            return (Criteria) this;
        }

        public Criteria andCustnumberIn(List<Long> values) {
            addCriterion("custnumber in", values, "custnumber");
            return (Criteria) this;
        }

        public Criteria andCustnumberNotIn(List<Long> values) {
            addCriterion("custnumber not in", values, "custnumber");
            return (Criteria) this;
        }

        public Criteria andCustnumberBetween(Long value1, Long value2) {
            addCriterion("custnumber between", value1, value2, "custnumber");
            return (Criteria) this;
        }

        public Criteria andCustnumberNotBetween(Long value1, Long value2) {
            addCriterion("custnumber not between", value1, value2, "custnumber");
            return (Criteria) this;
        }

        public Criteria andTotalfeeIsNull() {
            addCriterion("totalfee is null");
            return (Criteria) this;
        }

        public Criteria andTotalfeeIsNotNull() {
            addCriterion("totalfee is not null");
            return (Criteria) this;
        }

        public Criteria andTotalfeeEqualTo(Double value) {
            addCriterion("totalfee =", value, "totalfee");
            return (Criteria) this;
        }

        public Criteria andTotalfeeNotEqualTo(Double value) {
            addCriterion("totalfee <>", value, "totalfee");
            return (Criteria) this;
        }

        public Criteria andTotalfeeGreaterThan(Double value) {
            addCriterion("totalfee >", value, "totalfee");
            return (Criteria) this;
        }

        public Criteria andTotalfeeGreaterThanOrEqualTo(Double value) {
            addCriterion("totalfee >=", value, "totalfee");
            return (Criteria) this;
        }

        public Criteria andTotalfeeLessThan(Double value) {
            addCriterion("totalfee <", value, "totalfee");
            return (Criteria) this;
        }

        public Criteria andTotalfeeLessThanOrEqualTo(Double value) {
            addCriterion("totalfee <=", value, "totalfee");
            return (Criteria) this;
        }

        public Criteria andTotalfeeIn(List<Double> values) {
            addCriterion("totalfee in", values, "totalfee");
            return (Criteria) this;
        }

        public Criteria andTotalfeeNotIn(List<Double> values) {
            addCriterion("totalfee not in", values, "totalfee");
            return (Criteria) this;
        }

        public Criteria andTotalfeeBetween(Double value1, Double value2) {
            addCriterion("totalfee between", value1, value2, "totalfee");
            return (Criteria) this;
        }

        public Criteria andTotalfeeNotBetween(Double value1, Double value2) {
            addCriterion("totalfee not between", value1, value2, "totalfee");
            return (Criteria) this;
        }

        public Criteria andUnitpriceIsNull() {
            addCriterion("unitprice is null");
            return (Criteria) this;
        }

        public Criteria andUnitpriceIsNotNull() {
            addCriterion("unitprice is not null");
            return (Criteria) this;
        }

        public Criteria andUnitpriceEqualTo(Double value) {
            addCriterion("unitprice =", value, "unitprice");
            return (Criteria) this;
        }

        public Criteria andUnitpriceNotEqualTo(Double value) {
            addCriterion("unitprice <>", value, "unitprice");
            return (Criteria) this;
        }

        public Criteria andUnitpriceGreaterThan(Double value) {
            addCriterion("unitprice >", value, "unitprice");
            return (Criteria) this;
        }

        public Criteria andUnitpriceGreaterThanOrEqualTo(Double value) {
            addCriterion("unitprice >=", value, "unitprice");
            return (Criteria) this;
        }

        public Criteria andUnitpriceLessThan(Double value) {
            addCriterion("unitprice <", value, "unitprice");
            return (Criteria) this;
        }

        public Criteria andUnitpriceLessThanOrEqualTo(Double value) {
            addCriterion("unitprice <=", value, "unitprice");
            return (Criteria) this;
        }

        public Criteria andUnitpriceIn(List<Double> values) {
            addCriterion("unitprice in", values, "unitprice");
            return (Criteria) this;
        }

        public Criteria andUnitpriceNotIn(List<Double> values) {
            addCriterion("unitprice not in", values, "unitprice");
            return (Criteria) this;
        }

        public Criteria andUnitpriceBetween(Double value1, Double value2) {
            addCriterion("unitprice between", value1, value2, "unitprice");
            return (Criteria) this;
        }

        public Criteria andUnitpriceNotBetween(Double value1, Double value2) {
            addCriterion("unitprice not between", value1, value2, "unitprice");
            return (Criteria) this;
        }

        public Criteria andAmountofmoneyIsNull() {
            addCriterion("amountofmoney is null");
            return (Criteria) this;
        }

        public Criteria andAmountofmoneyIsNotNull() {
            addCriterion("amountofmoney is not null");
            return (Criteria) this;
        }

        public Criteria andAmountofmoneyEqualTo(Double value) {
            addCriterion("amountofmoney =", value, "amountofmoney");
            return (Criteria) this;
        }

        public Criteria andAmountofmoneyNotEqualTo(Double value) {
            addCriterion("amountofmoney <>", value, "amountofmoney");
            return (Criteria) this;
        }

        public Criteria andAmountofmoneyGreaterThan(Double value) {
            addCriterion("amountofmoney >", value, "amountofmoney");
            return (Criteria) this;
        }

        public Criteria andAmountofmoneyGreaterThanOrEqualTo(Double value) {
            addCriterion("amountofmoney >=", value, "amountofmoney");
            return (Criteria) this;
        }

        public Criteria andAmountofmoneyLessThan(Double value) {
            addCriterion("amountofmoney <", value, "amountofmoney");
            return (Criteria) this;
        }

        public Criteria andAmountofmoneyLessThanOrEqualTo(Double value) {
            addCriterion("amountofmoney <=", value, "amountofmoney");
            return (Criteria) this;
        }

        public Criteria andAmountofmoneyIn(List<Double> values) {
            addCriterion("amountofmoney in", values, "amountofmoney");
            return (Criteria) this;
        }

        public Criteria andAmountofmoneyNotIn(List<Double> values) {
            addCriterion("amountofmoney not in", values, "amountofmoney");
            return (Criteria) this;
        }

        public Criteria andAmountofmoneyBetween(Double value1, Double value2) {
            addCriterion("amountofmoney between", value1, value2, "amountofmoney");
            return (Criteria) this;
        }

        public Criteria andAmountofmoneyNotBetween(Double value1, Double value2) {
            addCriterion("amountofmoney not between", value1, value2, "amountofmoney");
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