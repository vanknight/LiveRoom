package com.live.mapper;

import com.live.pojo.*;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/10/30 8:35
 * @description:
 */
public interface LiveBarrageMapper {

    LiveBarrageExtend getLiveBarrageInfoByLbid(String lbid);
    List<LiveBarrageExtend> getLiveBarrageInfoByLrid(String lrid);

    int addLiveBarrage(LiveBarrageExtend liveBarrage);
    int deleteByLbid(String lbid);
}
