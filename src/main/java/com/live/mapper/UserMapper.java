package com.live.mapper;

import com.live.pojo.*;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/10/30 8:36
 * @description:
 */

public interface UserMapper {

    User getUserInfoByUid(String uid);
    UserExtend getUserExtendInfoByUid(String uid);

    List<User> getUserList();
    int updateUserByUid(User user);
    int updateWealthByUid(User user);
    int updateIntegralByUid(User user);
    int insertUser(User user);
    int deleteByUid(String uid);
}
