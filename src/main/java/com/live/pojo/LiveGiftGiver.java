package com.live.pojo;

public class LiveGiftGiver {

    private String lggid;
    private Long count;
    private Double subtotal;
    private String datetime;
    private String uid;
    private Long lgid;
    private String lrid;

    public LiveGiftGiver() {
    }

    public LiveGiftGiver(String lggid, Long count, Double subtotal, String datetime,
        String uid, Long lgid, String lrid) {
        this.lggid = lggid;
        this.count = count;
        this.subtotal = subtotal;
        this.datetime = datetime;
        this.uid = uid;
        this.lgid = lgid;
        this.lrid = lrid;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public String getLggid() {
        return lggid;
    }

    public void setLggid(String lggid) {
        this.lggid = lggid;
    }

    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }

    public Double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public Long getLgid() {
        return lgid;
    }

    public void setLgid(Long lgid) {
        this.lgid = lgid;
    }

    public String getLrid() {
        return lrid;
    }

    public void setLrid(String lrid) {
        this.lrid = lrid;
    }
}
