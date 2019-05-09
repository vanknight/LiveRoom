package com.live.mapper;

import com.live.pojo.*;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/10/30 11:11
 * @description:
 */

public interface LiveRoomMapper {

    LiveRoomExtend getLiveRoomInfoByLrid(String lrid);
    LiveRoomExtend getLiveRoomInfoByRoomid(String roomid);
    LiveRoomExtend getLiveRoomInfoByUid(String uid);
    List<LiveRoom> getLiveRooms();
    List<LiveRoomExtend> getLiveRoomExtends();


    int addLiveRoom(LiveRoomExtend liveRoom);
    int addLiveRoom(LiveRoom liveRoom);
    int setStreamNameByUid(LiveRoomExtend liveRoom);
    int setStreamNameByUid(LiveRoom liveRoom);
    int setStateByUid(LiveRoomExtend liveRoom);
    int setStateByUid(LiveRoom liveRoom);
    int setRoomNameByUid(LiveRoomExtend liveRoom);
    int setRoomNameByUid(LiveRoom liveRoom);
    int updateLiveRoomByLrid(LiveRoom liveRoom);
    int updateLiveRoomByLrid(LiveRoomExtend liveRoom);

    int delLiveRoomByLrid(String lrid);
    int delLiveRoomByUid(String uid);

}
