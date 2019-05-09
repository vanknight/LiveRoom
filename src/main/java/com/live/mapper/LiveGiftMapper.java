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

public interface LiveGiftMapper {

    LiveGift getLiveGiftInfoByLgid(Long lgid);

    List<LiveGift> getLiveGifts();
    int insertGift(LiveGift gift);
    int deleteGiftByLgid(String lgid);

    int updateLiveGiftByLgid(LiveGift liveGift);
}
