package com.live.pojo;


/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/10/29 16:53
 * @description:
 */
public class LiveBarrage {
    private String lbid;
    private String uid;
    private String content;
    private String datetime;
    private String lrid;

    public LiveBarrage() {
    }

    public LiveBarrage(String lbid, String uid, String content, String datetime, String lrid) {
        this.lbid = lbid;
        this.uid = uid;
        this.content = content;
        this.datetime = datetime;
        this.lrid = lrid;
    }

    public String getLbid() {
        return lbid;
    }

    public void setLbid(String lbid) {
        this.lbid = lbid;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public String getLrid() {
        return lrid;
    }

    public void setLrid(String lrid) {
        this.lrid = lrid;
    }
}
