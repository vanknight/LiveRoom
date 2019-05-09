package com.live.beans;

import com.live.pojo.*;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/10/29 16:51
 * @description:
 */
public class LiveMessage {
    private String type;
    private User user;
    private LiveBarrageExtend barrage;
    private LiveGiftGiverExtend giver;
    private String message;
    private LiveRoom room;
    private Integer count;

    public LiveMessage(String type, User user, LiveBarrageExtend barrage,
        LiveGiftGiverExtend giver, String message, LiveRoom room, Integer count) {
        this.type = type;
        this.user = user;
        this.barrage = barrage;
        this.giver = giver;
        this.message = message;
        this.room = room;
        this.count = count;
    }

    public LiveMessage() {
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public LiveBarrageExtend getBarrage() {
        return barrage;
    }

    public void setBarrage(LiveBarrageExtend barrage) {
        this.barrage = barrage;
    }

    public LiveGiftGiverExtend getGiver() {
        return giver;
    }

    public void setGiver(LiveGiftGiverExtend giver) {
        this.giver = giver;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public LiveRoom getRoom() {
        return room;
    }

    public void setRoom(LiveRoom room) {
        this.room = room;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
}
