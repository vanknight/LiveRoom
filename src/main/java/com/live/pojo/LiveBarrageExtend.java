package com.live.pojo;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/10/30 15:21
 * @description:
 */
public class LiveBarrageExtend extends LiveBarrage{


    private UserExtend user;

    public LiveBarrageExtend() {
    }

    public LiveBarrageExtend(String lbid, String uid, String content, String datetime, String lrid, UserExtend user) {
        super(lbid, uid, content, datetime, lrid);
        this.user = user;
    }

    public UserExtend getUser() {
        return user;
    }

    public void setUser(UserExtend user) {
        this.user = user;
    }
}
