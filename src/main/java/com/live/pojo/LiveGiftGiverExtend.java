package com.live.pojo;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/10/30 9:13
 * @description:
 */

public class LiveGiftGiverExtend extends LiveGiftGiver{

    private LiveGift gift;
    private UserExtend user;

    public LiveGiftGiverExtend() {
    }

    public LiveGiftGiverExtend(String lggid, Long count, Double subtotal, String datetime, String uid, Long lgid, String lrid, LiveGift gift, UserExtend user) {
        super(lggid, count, subtotal, datetime, uid, lgid, lrid);
        this.gift = gift;
        this.user = user;
    }

    public UserExtend getUser() {
        return user;
    }

    public void setUser(UserExtend user) {
        this.user = user;
    }

    public LiveGift getGift() {
        return gift;
    }

    public void setGift(LiveGift gift) {
        this.gift = gift;
    }
}
