package com.tbabs.pojo;

public class Course {
    private Integer courid;

    private String courname;

    private String semester;

    private Integer period;

    private Integer credit;

    public Integer getCourid() {
        return courid;
    }

    public void setCourid(Integer courid) {
        this.courid = courid;
    }

    public String getCourname() {
        return courname;
    }

    public void setCourname(String courname) {
        this.courname = courname == null ? null : courname.trim();
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester == null ? null : semester.trim();
    }

    public Integer getPeriod() {
        return period;
    }

    public void setPeriod(Integer period) {
        this.period = period;
    }

    public Integer getCredit() {
        return credit;
    }

    public void setCredit(Integer credit) {
        this.credit = credit;
    }
}