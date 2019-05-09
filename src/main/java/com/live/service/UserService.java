package com.live.service;

import com.live.pojo.*;
import com.live.service.*;
import com.live.beans.*;
import com.live.utils.*;

import java.util.List;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/10/30 10:02
 * @description:
 */
public interface UserService {

    User getUserInfoByUid(String uid);
    UserExtend getUserExtendInfoByUid(String uid);

    List<User> getUserInfoList();
    boolean insertUser(User user);
    boolean updateUserByUid(User user);

    boolean delUserByUid(String uid);
}
