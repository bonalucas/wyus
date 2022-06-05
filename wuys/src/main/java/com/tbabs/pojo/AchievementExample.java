package com.tbabs.pojo;

import java.util.ArrayList;
import java.util.List;

public class AchievementExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public AchievementExample() {
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

        public Criteria andStuidIsNull() {
            addCriterion("stuId is null");
            return (Criteria) this;
        }

        public Criteria andStuidIsNotNull() {
            addCriterion("stuId is not null");
            return (Criteria) this;
        }

        public Criteria andStuidEqualTo(Integer value) {
            addCriterion("stuId =", value, "stuid");
            return (Criteria) this;
        }

        public Criteria andStuidNotEqualTo(Integer value) {
            addCriterion("stuId <>", value, "stuid");
            return (Criteria) this;
        }

        public Criteria andStuidGreaterThan(Integer value) {
            addCriterion("stuId >", value, "stuid");
            return (Criteria) this;
        }

        public Criteria andStuidGreaterThanOrEqualTo(Integer value) {
            addCriterion("stuId >=", value, "stuid");
            return (Criteria) this;
        }

        public Criteria andStuidLessThan(Integer value) {
            addCriterion("stuId <", value, "stuid");
            return (Criteria) this;
        }

        public Criteria andStuidLessThanOrEqualTo(Integer value) {
            addCriterion("stuId <=", value, "stuid");
            return (Criteria) this;
        }

        public Criteria andStuidIn(List<Integer> values) {
            addCriterion("stuId in", values, "stuid");
            return (Criteria) this;
        }

        public Criteria andStuidNotIn(List<Integer> values) {
            addCriterion("stuId not in", values, "stuid");
            return (Criteria) this;
        }

        public Criteria andStuidBetween(Integer value1, Integer value2) {
            addCriterion("stuId between", value1, value2, "stuid");
            return (Criteria) this;
        }

        public Criteria andStuidNotBetween(Integer value1, Integer value2) {
            addCriterion("stuId not between", value1, value2, "stuid");
            return (Criteria) this;
        }

        public Criteria andCouridIsNull() {
            addCriterion("courId is null");
            return (Criteria) this;
        }

        public Criteria andCouridIsNotNull() {
            addCriterion("courId is not null");
            return (Criteria) this;
        }

        public Criteria andCouridEqualTo(Integer value) {
            addCriterion("courId =", value, "courid");
            return (Criteria) this;
        }

        public Criteria andCouridNotEqualTo(Integer value) {
            addCriterion("courId <>", value, "courid");
            return (Criteria) this;
        }

        public Criteria andCouridGreaterThan(Integer value) {
            addCriterion("courId >", value, "courid");
            return (Criteria) this;
        }

        public Criteria andCouridGreaterThanOrEqualTo(Integer value) {
            addCriterion("courId >=", value, "courid");
            return (Criteria) this;
        }

        public Criteria andCouridLessThan(Integer value) {
            addCriterion("courId <", value, "courid");
            return (Criteria) this;
        }

        public Criteria andCouridLessThanOrEqualTo(Integer value) {
            addCriterion("courId <=", value, "courid");
            return (Criteria) this;
        }

        public Criteria andCouridIn(List<Integer> values) {
            addCriterion("courId in", values, "courid");
            return (Criteria) this;
        }

        public Criteria andCouridNotIn(List<Integer> values) {
            addCriterion("courId not in", values, "courid");
            return (Criteria) this;
        }

        public Criteria andCouridBetween(Integer value1, Integer value2) {
            addCriterion("courId between", value1, value2, "courid");
            return (Criteria) this;
        }

        public Criteria andCouridNotBetween(Integer value1, Integer value2) {
            addCriterion("courId not between", value1, value2, "courid");
            return (Criteria) this;
        }

        public Criteria andAchIsNull() {
            addCriterion("ach is null");
            return (Criteria) this;
        }

        public Criteria andAchIsNotNull() {
            addCriterion("ach is not null");
            return (Criteria) this;
        }

        public Criteria andAchEqualTo(Integer value) {
            addCriterion("ach =", value, "ach");
            return (Criteria) this;
        }

        public Criteria andAchNotEqualTo(Integer value) {
            addCriterion("ach <>", value, "ach");
            return (Criteria) this;
        }

        public Criteria andAchGreaterThan(Integer value) {
            addCriterion("ach >", value, "ach");
            return (Criteria) this;
        }

        public Criteria andAchGreaterThanOrEqualTo(Integer value) {
            addCriterion("ach >=", value, "ach");
            return (Criteria) this;
        }

        public Criteria andAchLessThan(Integer value) {
            addCriterion("ach <", value, "ach");
            return (Criteria) this;
        }

        public Criteria andAchLessThanOrEqualTo(Integer value) {
            addCriterion("ach <=", value, "ach");
            return (Criteria) this;
        }

        public Criteria andAchIn(List<Integer> values) {
            addCriterion("ach in", values, "ach");
            return (Criteria) this;
        }

        public Criteria andAchNotIn(List<Integer> values) {
            addCriterion("ach not in", values, "ach");
            return (Criteria) this;
        }

        public Criteria andAchBetween(Integer value1, Integer value2) {
            addCriterion("ach between", value1, value2, "ach");
            return (Criteria) this;
        }

        public Criteria andAchNotBetween(Integer value1, Integer value2) {
            addCriterion("ach not between", value1, value2, "ach");
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