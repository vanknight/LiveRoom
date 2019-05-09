package com.live.service;



import com.live.pojo.*;
import com.live.service.*;
import java.util.List;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/10/30 9:56
 * @description:
 */

public interface LiveService {

    LiveGift getLiveGiftInfoByLgid(Long lgid);
    LiveRoomExtend getLiveRoomInfoByRoomid(String roomid);
    List<LiveBarrageExtend> getLiveBarrageExtendInfoByLrid(String lrid);
    String addLiveGiftGiver(LiveGiftGiverExtend liveGiftGiver);
    LiveGiftGiverExtend getLiveGiftGiverInfoByLggid(String lggid);
    String addLiveBarrage(LiveBarrageExtend liveBarrage);
    LiveBarrageExtend getLiveBarrageInfoByLbid(String lbid);
    List<LiveGift> getLiveGifts();
    LiveRoomExtend getLiveRoomInfoByUid(String uid);
    boolean changeLiveRoomStreamName(LiveRoomExtend liveRoom);
    boolean addLiveRoom(LiveRoomExtend liveRoom);
    boolean changeLiveRoomState(LiveRoomExtend liveRoom);
    boolean changeLiveRoomName(LiveRoomExtend liveRoom);

    List<LiveRoom> getLiveRooms();
    boolean insertLiveRoom(LiveRoomExtend liveRoom);
    boolean updateLiveGfit(LiveGift liveGift);
    boolean delLiveGiftByLgid(String id);
    boolean updateLiveRoom(LiveRoom liveRoom);

    boolean delLiveRoomByLrid(String id);

    boolean addLiveGift(LiveGift liveGift);
    boolean addLiveRoom(LiveRoom liveRoom);

    boolean changeLiveRoom(LiveRoomExtend liveRoom);
}
