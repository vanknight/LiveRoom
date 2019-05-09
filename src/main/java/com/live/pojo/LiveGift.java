package com.live.pojo;

public class LiveGift {
    private Long lgid;
    private String name;
    private String img;
    private Double price;
    private String describe;

    @Override
    public String toString() {
        return "LiveGift{" +
            "lgid=" + lgid +
            ", name='" + name + '\'' +
            ", img='" + img + '\'' +
            ", price=" + price +
            ", describe='" + describe + '\'' +
            '}';
    }

    public LiveGift() {
    }

    public LiveGift(Long lgid, String name, String img, Double price, String describe) {
        this.lgid = lgid;
        this.name = name;
        this.img = img;
        this.price = price;
        this.describe = describe;
    }

    public Long getLgid() {
        return lgid;
    }

    public void setLgid(Long lgid) {
        this.lgid = lgid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }
}
