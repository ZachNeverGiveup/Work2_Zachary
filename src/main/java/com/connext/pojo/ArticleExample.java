package com.connext.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ArticleExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ArticleExample() {
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

        public Criteria andArticleidIsNull() {
            addCriterion("articleid is null");
            return (Criteria) this;
        }

        public Criteria andArticleidIsNotNull() {
            addCriterion("articleid is not null");
            return (Criteria) this;
        }

        public Criteria andArticleidEqualTo(Integer value) {
            addCriterion("articleid =", value, "articleid");
            return (Criteria) this;
        }

        public Criteria andArticleidNotEqualTo(Integer value) {
            addCriterion("articleid <>", value, "articleid");
            return (Criteria) this;
        }

        public Criteria andArticleidGreaterThan(Integer value) {
            addCriterion("articleid >", value, "articleid");
            return (Criteria) this;
        }

        public Criteria andArticleidGreaterThanOrEqualTo(Integer value) {
            addCriterion("articleid >=", value, "articleid");
            return (Criteria) this;
        }

        public Criteria andArticleidLessThan(Integer value) {
            addCriterion("articleid <", value, "articleid");
            return (Criteria) this;
        }

        public Criteria andArticleidLessThanOrEqualTo(Integer value) {
            addCriterion("articleid <=", value, "articleid");
            return (Criteria) this;
        }

        public Criteria andArticleidIn(List<Integer> values) {
            addCriterion("articleid in", values, "articleid");
            return (Criteria) this;
        }

        public Criteria andArticleidNotIn(List<Integer> values) {
            addCriterion("articleid not in", values, "articleid");
            return (Criteria) this;
        }

        public Criteria andArticleidBetween(Integer value1, Integer value2) {
            addCriterion("articleid between", value1, value2, "articleid");
            return (Criteria) this;
        }

        public Criteria andArticleidNotBetween(Integer value1, Integer value2) {
            addCriterion("articleid not between", value1, value2, "articleid");
            return (Criteria) this;
        }

        public Criteria andArticletitleIsNull() {
            addCriterion("articletitle is null");
            return (Criteria) this;
        }

        public Criteria andArticletitleIsNotNull() {
            addCriterion("articletitle is not null");
            return (Criteria) this;
        }

        public Criteria andArticletitleEqualTo(String value) {
            addCriterion("articletitle =", value, "articletitle");
            return (Criteria) this;
        }

        public Criteria andArticletitleNotEqualTo(String value) {
            addCriterion("articletitle <>", value, "articletitle");
            return (Criteria) this;
        }

        public Criteria andArticletitleGreaterThan(String value) {
            addCriterion("articletitle >", value, "articletitle");
            return (Criteria) this;
        }

        public Criteria andArticletitleGreaterThanOrEqualTo(String value) {
            addCriterion("articletitle >=", value, "articletitle");
            return (Criteria) this;
        }

        public Criteria andArticletitleLessThan(String value) {
            addCriterion("articletitle <", value, "articletitle");
            return (Criteria) this;
        }

        public Criteria andArticletitleLessThanOrEqualTo(String value) {
            addCriterion("articletitle <=", value, "articletitle");
            return (Criteria) this;
        }

        public Criteria andArticletitleLike(String value) {
            addCriterion("articletitle like", value, "articletitle");
            return (Criteria) this;
        }

        public Criteria andArticletitleNotLike(String value) {
            addCriterion("articletitle not like", value, "articletitle");
            return (Criteria) this;
        }

        public Criteria andArticletitleIn(List<String> values) {
            addCriterion("articletitle in", values, "articletitle");
            return (Criteria) this;
        }

        public Criteria andArticletitleNotIn(List<String> values) {
            addCriterion("articletitle not in", values, "articletitle");
            return (Criteria) this;
        }

        public Criteria andArticletitleBetween(String value1, String value2) {
            addCriterion("articletitle between", value1, value2, "articletitle");
            return (Criteria) this;
        }

        public Criteria andArticletitleNotBetween(String value1, String value2) {
            addCriterion("articletitle not between", value1, value2, "articletitle");
            return (Criteria) this;
        }

        public Criteria andArticlecontentIsNull() {
            addCriterion("articlecontent is null");
            return (Criteria) this;
        }

        public Criteria andArticlecontentIsNotNull() {
            addCriterion("articlecontent is not null");
            return (Criteria) this;
        }

        public Criteria andArticlecontentEqualTo(String value) {
            addCriterion("articlecontent =", value, "articlecontent");
            return (Criteria) this;
        }

        public Criteria andArticlecontentNotEqualTo(String value) {
            addCriterion("articlecontent <>", value, "articlecontent");
            return (Criteria) this;
        }

        public Criteria andArticlecontentGreaterThan(String value) {
            addCriterion("articlecontent >", value, "articlecontent");
            return (Criteria) this;
        }

        public Criteria andArticlecontentGreaterThanOrEqualTo(String value) {
            addCriterion("articlecontent >=", value, "articlecontent");
            return (Criteria) this;
        }

        public Criteria andArticlecontentLessThan(String value) {
            addCriterion("articlecontent <", value, "articlecontent");
            return (Criteria) this;
        }

        public Criteria andArticlecontentLessThanOrEqualTo(String value) {
            addCriterion("articlecontent <=", value, "articlecontent");
            return (Criteria) this;
        }

        public Criteria andArticlecontentLike(String value) {
            addCriterion("articlecontent like", value, "articlecontent");
            return (Criteria) this;
        }

        public Criteria andArticlecontentNotLike(String value) {
            addCriterion("articlecontent not like", value, "articlecontent");
            return (Criteria) this;
        }

        public Criteria andArticlecontentIn(List<String> values) {
            addCriterion("articlecontent in", values, "articlecontent");
            return (Criteria) this;
        }

        public Criteria andArticlecontentNotIn(List<String> values) {
            addCriterion("articlecontent not in", values, "articlecontent");
            return (Criteria) this;
        }

        public Criteria andArticlecontentBetween(String value1, String value2) {
            addCriterion("articlecontent between", value1, value2, "articlecontent");
            return (Criteria) this;
        }

        public Criteria andArticlecontentNotBetween(String value1, String value2) {
            addCriterion("articlecontent not between", value1, value2, "articlecontent");
            return (Criteria) this;
        }

        public Criteria andArticleaddtimeIsNull() {
            addCriterion("articleaddtime is null");
            return (Criteria) this;
        }

        public Criteria andArticleaddtimeIsNotNull() {
            addCriterion("articleaddtime is not null");
            return (Criteria) this;
        }

        public Criteria andArticleaddtimeEqualTo(Date value) {
            addCriterion("articleaddtime =", value, "articleaddtime");
            return (Criteria) this;
        }

        public Criteria andArticleaddtimeNotEqualTo(Date value) {
            addCriterion("articleaddtime <>", value, "articleaddtime");
            return (Criteria) this;
        }

        public Criteria andArticleaddtimeGreaterThan(Date value) {
            addCriterion("articleaddtime >", value, "articleaddtime");
            return (Criteria) this;
        }

        public Criteria andArticleaddtimeGreaterThanOrEqualTo(Date value) {
            addCriterion("articleaddtime >=", value, "articleaddtime");
            return (Criteria) this;
        }

        public Criteria andArticleaddtimeLessThan(Date value) {
            addCriterion("articleaddtime <", value, "articleaddtime");
            return (Criteria) this;
        }

        public Criteria andArticleaddtimeLessThanOrEqualTo(Date value) {
            addCriterion("articleaddtime <=", value, "articleaddtime");
            return (Criteria) this;
        }

        public Criteria andArticleaddtimeIn(List<Date> values) {
            addCriterion("articleaddtime in", values, "articleaddtime");
            return (Criteria) this;
        }

        public Criteria andArticleaddtimeNotIn(List<Date> values) {
            addCriterion("articleaddtime not in", values, "articleaddtime");
            return (Criteria) this;
        }

        public Criteria andArticleaddtimeBetween(Date value1, Date value2) {
            addCriterion("articleaddtime between", value1, value2, "articleaddtime");
            return (Criteria) this;
        }

        public Criteria andArticleaddtimeNotBetween(Date value1, Date value2) {
            addCriterion("articleaddtime not between", value1, value2, "articleaddtime");
            return (Criteria) this;
        }

        public Criteria andArticleuseridIsNull() {
            addCriterion("articleuserid is null");
            return (Criteria) this;
        }

        public Criteria andArticleuseridIsNotNull() {
            addCriterion("articleuserid is not null");
            return (Criteria) this;
        }

        public Criteria andArticleuseridEqualTo(Integer value) {
            addCriterion("articleuserid =", value, "articleuserid");
            return (Criteria) this;
        }

        public Criteria andArticleuseridNotEqualTo(Integer value) {
            addCriterion("articleuserid <>", value, "articleuserid");
            return (Criteria) this;
        }

        public Criteria andArticleuseridGreaterThan(Integer value) {
            addCriterion("articleuserid >", value, "articleuserid");
            return (Criteria) this;
        }

        public Criteria andArticleuseridGreaterThanOrEqualTo(Integer value) {
            addCriterion("articleuserid >=", value, "articleuserid");
            return (Criteria) this;
        }

        public Criteria andArticleuseridLessThan(Integer value) {
            addCriterion("articleuserid <", value, "articleuserid");
            return (Criteria) this;
        }

        public Criteria andArticleuseridLessThanOrEqualTo(Integer value) {
            addCriterion("articleuserid <=", value, "articleuserid");
            return (Criteria) this;
        }

        public Criteria andArticleuseridIn(List<Integer> values) {
            addCriterion("articleuserid in", values, "articleuserid");
            return (Criteria) this;
        }

        public Criteria andArticleuseridNotIn(List<Integer> values) {
            addCriterion("articleuserid not in", values, "articleuserid");
            return (Criteria) this;
        }

        public Criteria andArticleuseridBetween(Integer value1, Integer value2) {
            addCriterion("articleuserid between", value1, value2, "articleuserid");
            return (Criteria) this;
        }

        public Criteria andArticleuseridNotBetween(Integer value1, Integer value2) {
            addCriterion("articleuserid not between", value1, value2, "articleuserid");
            return (Criteria) this;
        }

        public Criteria andArticlecommentnumIsNull() {
            addCriterion("articlecommentnum is null");
            return (Criteria) this;
        }

        public Criteria andArticlecommentnumIsNotNull() {
            addCriterion("articlecommentnum is not null");
            return (Criteria) this;
        }

        public Criteria andArticlecommentnumEqualTo(Integer value) {
            addCriterion("articlecommentnum =", value, "articlecommentnum");
            return (Criteria) this;
        }

        public Criteria andArticlecommentnumNotEqualTo(Integer value) {
            addCriterion("articlecommentnum <>", value, "articlecommentnum");
            return (Criteria) this;
        }

        public Criteria andArticlecommentnumGreaterThan(Integer value) {
            addCriterion("articlecommentnum >", value, "articlecommentnum");
            return (Criteria) this;
        }

        public Criteria andArticlecommentnumGreaterThanOrEqualTo(Integer value) {
            addCriterion("articlecommentnum >=", value, "articlecommentnum");
            return (Criteria) this;
        }

        public Criteria andArticlecommentnumLessThan(Integer value) {
            addCriterion("articlecommentnum <", value, "articlecommentnum");
            return (Criteria) this;
        }

        public Criteria andArticlecommentnumLessThanOrEqualTo(Integer value) {
            addCriterion("articlecommentnum <=", value, "articlecommentnum");
            return (Criteria) this;
        }

        public Criteria andArticlecommentnumIn(List<Integer> values) {
            addCriterion("articlecommentnum in", values, "articlecommentnum");
            return (Criteria) this;
        }

        public Criteria andArticlecommentnumNotIn(List<Integer> values) {
            addCriterion("articlecommentnum not in", values, "articlecommentnum");
            return (Criteria) this;
        }

        public Criteria andArticlecommentnumBetween(Integer value1, Integer value2) {
            addCriterion("articlecommentnum between", value1, value2, "articlecommentnum");
            return (Criteria) this;
        }

        public Criteria andArticlecommentnumNotBetween(Integer value1, Integer value2) {
            addCriterion("articlecommentnum not between", value1, value2, "articlecommentnum");
            return (Criteria) this;
        }

        public Criteria andArticlelastcommenttimeIsNull() {
            addCriterion("articlelastcommenttime is null");
            return (Criteria) this;
        }

        public Criteria andArticlelastcommenttimeIsNotNull() {
            addCriterion("articlelastcommenttime is not null");
            return (Criteria) this;
        }

        public Criteria andArticlelastcommenttimeEqualTo(Date value) {
            addCriterion("articlelastcommenttime =", value, "articlelastcommenttime");
            return (Criteria) this;
        }

        public Criteria andArticlelastcommenttimeNotEqualTo(Date value) {
            addCriterion("articlelastcommenttime <>", value, "articlelastcommenttime");
            return (Criteria) this;
        }

        public Criteria andArticlelastcommenttimeGreaterThan(Date value) {
            addCriterion("articlelastcommenttime >", value, "articlelastcommenttime");
            return (Criteria) this;
        }

        public Criteria andArticlelastcommenttimeGreaterThanOrEqualTo(Date value) {
            addCriterion("articlelastcommenttime >=", value, "articlelastcommenttime");
            return (Criteria) this;
        }

        public Criteria andArticlelastcommenttimeLessThan(Date value) {
            addCriterion("articlelastcommenttime <", value, "articlelastcommenttime");
            return (Criteria) this;
        }

        public Criteria andArticlelastcommenttimeLessThanOrEqualTo(Date value) {
            addCriterion("articlelastcommenttime <=", value, "articlelastcommenttime");
            return (Criteria) this;
        }

        public Criteria andArticlelastcommenttimeIn(List<Date> values) {
            addCriterion("articlelastcommenttime in", values, "articlelastcommenttime");
            return (Criteria) this;
        }

        public Criteria andArticlelastcommenttimeNotIn(List<Date> values) {
            addCriterion("articlelastcommenttime not in", values, "articlelastcommenttime");
            return (Criteria) this;
        }

        public Criteria andArticlelastcommenttimeBetween(Date value1, Date value2) {
            addCriterion("articlelastcommenttime between", value1, value2, "articlelastcommenttime");
            return (Criteria) this;
        }

        public Criteria andArticlelastcommenttimeNotBetween(Date value1, Date value2) {
            addCriterion("articlelastcommenttime not between", value1, value2, "articlelastcommenttime");
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