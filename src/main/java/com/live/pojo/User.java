package com.live.pojo;

public class User {

    private String uid;
    private String username;
    private String password;
    private String phone;
    private String email;
    private String img;
    private String sex;
    private String state;
    private Double integral;
    private Double wealth;

    public User() {
    }

    public User(String uid, String username, String password, String phone, String email, String img, String sex, String state, Double integral, Double wealth) {
        this.uid = uid;
        this.username = username;
        this.password = password;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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
