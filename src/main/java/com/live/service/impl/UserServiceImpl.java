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
 * @date-Time: 2018/10/30 10:02
 * @description:
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;


    @Override
    public User getUserInfoByUid(String uid) {
        return userMapper.getUserInfoByUid(uid);
    }

    @Override
    public UserExtend getUserExtendInfoByUid(String uid) {
        return userMapper.getUserExtendInfoByUid(uid);
    }

    @Override
    public List<User> getUserInfoList() {
        return userMapper.getUserList();
    }

    @Override
    public boolean insertUser(User user) {
        return userMapper.insertUser(user) > 0;
    }

    @Override
    public boolean updateUserByUid(User user) {
        return userMapper.updateUserByUid(user) > 0;
    }

    @Override
    public boolean delUserByUid(String uid) {
        return userMapper.deleteByUid(uid) > 0;
    }
}
