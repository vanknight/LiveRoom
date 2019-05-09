package com.live.pojo;

public class LiveRoom {

    private String lrid;
    private String roomid;
    private String roomName;
    private String endTime;
    private String streamName;
    private String state;
    private String uid;

    public LiveRoom() {
    }

    public LiveRoom(String lrid, String roomid, String roomName, String endTime, String streamName, String state, String uid) {
        this.lrid = lrid;
        this.roomid = roomid;
        this.roomName = roomName;
        this.endTime = endTime;
        this.streamName = streamName;
        this.state = state;
        this.uid = uid;
    }

    public String getLrid() {
        return lrid;
    }

    public void setLrid(String lrid) {
        this.lrid = lrid;
    }

    public String getRoomid() {
        return roomid;
    }

    public void setRoomid(String roomid) {
        this.roomid = roomid;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getStreamName() {
        return streamName;
    }

    public void setStreamName(String streamName) {
        this.streamName = streamName;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }
}
