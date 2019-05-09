package com.live.mapper;


import com.live.pojo.*;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/10/30 14:45
 * @description:
 */

public interface LiveGiftGiverMapper {

    LiveGiftGiverExtend getLiveGiftGiverInfoByLggid(String lggid);
    List<LiveGiftGiverExtend> getLiveGiftGiverInfoByLrid(String lrid);

    int addLiveGiftGiver(LiveGiftGiverExtend liveGiftGiver);


}
