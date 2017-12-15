package com.connext.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UserlogExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public UserlogExample() {
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

        public Criteria andLogidIsNull() {
            addCriterion("logid is null");
            return (Criteria) this;
        }

        public Criteria andLogidIsNotNull() {
            addCriterion("logid is not null");
            return (Criteria) this;
        }

        public Criteria andLogidEqualTo(Integer value) {
            addCriterion("logid =", value, "logid");
            return (Criteria) this;
        }

        public Criteria andLogidNotEqualTo(Integer value) {
            addCriterion("logid <>", value, "logid");
            return (Criteria) this;
        }

        public Criteria andLogidGreaterThan(Integer value) {
            addCriterion("logid >", value, "logid");
            return (Criteria) this;
        }

        public Criteria andLogidGreaterThanOrEqualTo(Integer value) {
            addCriterion("logid >=", value, "logid");
            return (Criteria) this;
        }

        public Criteria andLogidLessThan(Integer value) {
            addCriterion("logid <", value, "logid");
            return (Criteria) this;
        }

        public Criteria andLogidLessThanOrEqualTo(Integer value) {
            addCriterion("logid <=", value, "logid");
            return (Criteria) this;
        }

        public Criteria andLogidIn(List<Integer> values) {
            addCriterion("logid in", values, "logid");
            return (Criteria) this;
        }

        public Criteria andLogidNotIn(List<Integer> values) {
            addCriterion("logid not in", values, "logid");
            return (Criteria) this;
        }

        public Criteria andLogidBetween(Integer value1, Integer value2) {
            addCriterion("logid between", value1, value2, "logid");
            return (Criteria) this;
        }

        public Criteria andLogidNotBetween(Integer value1, Integer value2) {
            addCriterion("logid not between", value1, value2, "logid");
            return (Criteria) this;
        }

        public Criteria andUserphoneIsNull() {
            addCriterion("userphone is null");
            return (Criteria) this;
        }

        public Criteria andUserphoneIsNotNull() {
            addCriterion("userphone is not null");
            return (Criteria) this;
        }

        public Criteria andUserphoneEqualTo(String value) {
            addCriterion("userphone =", value, "userphone");
            return (Criteria) this;
        }

        public Criteria andUserphoneNotEqualTo(String value) {
            addCriterion("userphone <>", value, "userphone");
            return (Criteria) this;
        }

        public Criteria andUserphoneGreaterThan(String value) {
            addCriterion("userphone >", value, "userphone");
            return (Criteria) this;
        }

        public Criteria andUserphoneGreaterThanOrEqualTo(String value) {
            addCriterion("userphone >=", value, "userphone");
            return (Criteria) this;
        }

        public Criteria andUserphoneLessThan(String value) {
            addCriterion("userphone <", value, "userphone");
            return (Criteria) this;
        }

        public Criteria andUserphoneLessThanOrEqualTo(String value) {
            addCriterion("userphone <=", value, "userphone");
            return (Criteria) this;
        }

        public Criteria andUserphoneLike(String value) {
            addCriterion("userphone like", value, "userphone");
            return (Criteria) this;
        }

        public Criteria andUserphoneNotLike(String value) {
            addCriterion("userphone not like", value, "userphone");
            return (Criteria) this;
        }

        public Criteria andUserphoneIn(List<String> values) {
            addCriterion("userphone in", values, "userphone");
            return (Criteria) this;
        }

        public Criteria andUserphoneNotIn(List<String> values) {
            addCriterion("userphone not in", values, "userphone");
            return (Criteria) this;
        }

        public Criteria andUserphoneBetween(String value1, String value2) {
            addCriterion("userphone between", value1, value2, "userphone");
            return (Criteria) this;
        }

        public Criteria andUserphoneNotBetween(String value1, String value2) {
            addCriterion("userphone not between", value1, value2, "userphone");
            return (Criteria) this;
        }

        public Criteria andFailtimesIsNull() {
            addCriterion("failtimes is null");
            return (Criteria) this;
        }

        public Criteria andFailtimesIsNotNull() {
            addCriterion("failtimes is not null");
            return (Criteria) this;
        }

        public Criteria andFailtimesEqualTo(Integer value) {
            addCriterion("failtimes =", value, "failtimes");
            return (Criteria) this;
        }

        public Criteria andFailtimesNotEqualTo(Integer value) {
            addCriterion("failtimes <>", value, "failtimes");
            return (Criteria) this;
        }

        public Criteria andFailtimesGreaterThan(Integer value) {
            addCriterion("failtimes >", value, "failtimes");
            return (Criteria) this;
        }

        public Criteria andFailtimesGreaterThanOrEqualTo(Integer value) {
            addCriterion("failtimes >=", value, "failtimes");
            return (Criteria) this;
        }

        public Criteria andFailtimesLessThan(Integer value) {
            addCriterion("failtimes <", value, "failtimes");
            return (Criteria) this;
        }

        public Criteria andFailtimesLessThanOrEqualTo(Integer value) {
            addCriterion("failtimes <=", value, "failtimes");
            return (Criteria) this;
        }

        public Criteria andFailtimesIn(List<Integer> values) {
            addCriterion("failtimes in", values, "failtimes");
            return (Criteria) this;
        }

        public Criteria andFailtimesNotIn(List<Integer> values) {
            addCriterion("failtimes not in", values, "failtimes");
            return (Criteria) this;
        }

        public Criteria andFailtimesBetween(Integer value1, Integer value2) {
            addCriterion("failtimes between", value1, value2, "failtimes");
            return (Criteria) this;
        }

        public Criteria andFailtimesNotBetween(Integer value1, Integer value2) {
            addCriterion("failtimes not between", value1, value2, "failtimes");
            return (Criteria) this;
        }

        public Criteria andLastfailtimeIsNull() {
            addCriterion("lastfailtime is null");
            return (Criteria) this;
        }

        public Criteria andLastfailtimeIsNotNull() {
            addCriterion("lastfailtime is not null");
            return (Criteria) this;
        }

        public Criteria andLastfailtimeEqualTo(Date value) {
            addCriterion("lastfailtime =", value, "lastfailtime");
            return (Criteria) this;
        }

        public Criteria andLastfailtimeNotEqualTo(Date value) {
            addCriterion("lastfailtime <>", value, "lastfailtime");
            return (Criteria) this;
        }

        public Criteria andLastfailtimeGreaterThan(Date value) {
            addCriterion("lastfailtime >", value, "lastfailtime");
            return (Criteria) this;
        }

        public Criteria andLastfailtimeGreaterThanOrEqualTo(Date value) {
            addCriterion("lastfailtime >=", value, "lastfailtime");
            return (Criteria) this;
        }

        public Criteria andLastfailtimeLessThan(Date value) {
            addCriterion("lastfailtime <", value, "lastfailtime");
            return (Criteria) this;
        }

        public Criteria andLastfailtimeLessThanOrEqualTo(Date value) {
            addCriterion("lastfailtime <=", value, "lastfailtime");
            return (Criteria) this;
        }

        public Criteria andLastfailtimeIn(List<Date> values) {
            addCriterion("lastfailtime in", values, "lastfailtime");
            return (Criteria) this;
        }

        public Criteria andLastfailtimeNotIn(List<Date> values) {
            addCriterion("lastfailtime not in", values, "lastfailtime");
            return (Criteria) this;
        }

        public Criteria andLastfailtimeBetween(Date value1, Date value2) {
            addCriterion("lastfailtime between", value1, value2, "lastfailtime");
            return (Criteria) this;
        }

        public Criteria andLastfailtimeNotBetween(Date value1, Date value2) {
            addCriterion("lastfailtime not between", value1, value2, "lastfailtime");
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