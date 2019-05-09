package com.live.pojo;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/11/5 12:21
 * @description:
 */

public class LiveRoomExtend extends LiveRoom{
    private UserExtend user;

    public LiveRoomExtend() { }

    public LiveRoomExtend(String lrid, String roomid, String roomName, String startTime, String streamName, String state, String uid, UserExtend user) {
        super(lrid, roomid, roomName, startTime, streamName, state, uid);
        this.user = user;
    }

    //lrid, roomid, roomName, stream_name, end_time, state, uid
    public LiveRoomExtend(String lrid, String roomid, String roomName, String streamName,String endTime, String state, String uid) {
        super(lrid, roomid, roomName, endTime, streamName, state, uid);
    }

    public UserExtend getUser() {
        return user;
    }

    public void setUser(UserExtend user) {
        this.user = user;
    }
}
