package com.live.service.impl;

import com.live.pojo.*;
import com.live.service.*;
import com.live.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/10/30 9:57
 * @description:
 */
@Service
public class LiveServiceImpl implements LiveService {

    @Autowired
    private LiveBarrageMapper liveBarrageMapper;
    @Autowired
    private LiveRoomMapper liveRoomMapper;
    @Autowired
    private LiveGiftMapper liveGiftMapper;
    @Autowired
    private LiveGiftGiverMapper liveGiftGiverMapper;

    @Override
    public LiveGift getLiveGiftInfoByLgid(Long lgid) {
        return liveGiftMapper.getLiveGiftInfoByLgid(lgid);
    }

    @Override
    public LiveRoomExtend getLiveRoomInfoByRoomid(String roomid) {
        return liveRoomMapper.getLiveRoomInfoByRoomid(roomid);
    }

    @Override
    public List<LiveBarrageExtend> getLiveBarrageExtendInfoByLrid(String lrid) {
        return liveBarrageMapper.getLiveBarrageInfoByLrid(lrid);
    }

    @Override
    public String addLiveGiftGiver(LiveGiftGiverExtend liveGiftGiver) {
        boolean mark = liveGiftGiverMapper.addLiveGiftGiver(liveGiftGiver) > 0;
        if (mark) {
            return liveGiftGiver.getLggid();
        }
        return null;
    }

    @Override
    public LiveGiftGiverExtend getLiveGiftGiverInfoByLggid(String lggid) {
        return liveGiftGiverMapper.getLiveGiftGiverInfoByLggid(lggid);
    }

    @Override
    public String addLiveBarrage(LiveBarrageExtend liveBarrage) {
        boolean mark = liveBarrageMapper.addLiveBarrage(liveBarrage) > 0;
        if (mark) {
            return liveBarrage.getLbid();
        }
        return null;
    }

    @Override
    public LiveBarrageExtend getLiveBarrageInfoByLbid(String lbid) {
        return liveBarrageMapper.getLiveBarrageInfoByLbid(lbid);
    }

    @Override
    public List<LiveGift> getLiveGifts() {
        return liveGiftMapper.getLiveGifts();
    }

    @Override
    public LiveRoomExtend getLiveRoomInfoByUid(String uid) {
        return liveRoomMapper.getLiveRoomInfoByUid(uid);
    }

    @Override
    public boolean changeLiveRoomStreamName(LiveRoomExtend liveRoom) {
        return liveRoomMapper.setStreamNameByUid(liveRoom) > 0;
    }

    @Override
    public boolean addLiveRoom(LiveRoomExtend liveRoom) {
        if (liveRoom.getStreamName() == null || liveRoom.getStreamName().length() > 32 ||
            liveRoom.getUid() == null) {
            return false;
        }
        return liveRoomMapper.addLiveRoom(liveRoom) > 0;
    }

    @Override
    public boolean changeLiveRoomState(LiveRoomExtend liveRoom) {
        return liveRoomMapper.setStateByUid(liveRoom) > 0;
    }

    @Override
    public boolean changeLiveRoomName(LiveRoomExtend liveRoom) {
        if(liveRoom == null || liveRoom.getRoomName().equals("")){
            return false;
        }else {
            return liveRoomMapper.setRoomNameByUid(liveRoom) > 0;
        }
    }

    @Override
    public List<LiveRoom> getLiveRooms() {
        return liveRoomMapper.getLiveRooms();
    }

    @Override
    public boolean insertLiveRoom(LiveRoomExtend liveRoom) {
        return liveRoomMapper.addLiveRoom(liveRoom) > 0;
    }

    @Override
    public boolean updateLiveGfit(LiveGift liveGift) {
        return liveGiftMapper.updateLiveGiftByLgid(liveGift) > 0;
    }

    @Override
    public boolean delLiveGiftByLgid(String id) {
        return liveGiftMapper.deleteGiftByLgid(id) > 0;
    }

    @Override
    public boolean updateLiveRoom(LiveRoom liveRoom) {
        return liveRoomMapper.updateLiveRoomByLrid(liveRoom) > 0;
    }

    @Override
    public boolean delLiveRoomByLrid(String id) {

        return liveRoomMapper.delLiveRoomByLrid(id) > 0;
    }

    @Override
    public boolean addLiveGift(LiveGift liveGift) {
        return liveGiftMapper.insertGift(liveGift) > 0;
    }

    @Override
    public boolean addLiveRoom(LiveRoom liveRoom) {
        return liveRoomMapper.addLiveRoom(liveRoom) > 0;
    }

    @Override
    public boolean changeLiveRoom(LiveRoomExtend liveRoom) {
        return liveRoomMapper.updateLiveRoomByLrid(liveRoom) > 0;
    }


}
