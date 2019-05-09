package com.live.pojo;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/11/5 12:49
 * @description:
 */
public class UserExtend {
    private String uid;
    private String username;
    private String phone;
    private String email;
    private String img;
    private String sex;
    private String state;
    private Double integral;
    private Double wealth;

    public UserExtend() {
    }

    public UserExtend(String uid, String username, String phone, String email, String img, String sex, String state, Double integral, Double wealth) {
        this.uid = uid;
        this.username = username;
        this.phone = phone;
        this.email = email;
        this.img = img;
        this.sex = sex;
        this.state = state;
        this.integral = integral;
        this.wealth = wealth;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Double getIntegral() {
        return integral;
    }

    public void setIntegral(Double integral) {
        this.integral = integral;
    }

    public Double getWealth() {
        return wealth;
    }

    public void setWealth(Double wealth) {
        this.wealth = wealth;
    }


}
