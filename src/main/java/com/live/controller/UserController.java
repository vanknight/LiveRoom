package com.live.controller;

import com.live.pojo.*;
import com.live.service.*;
import com.live.beans.*;
import com.live.utils.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @Author: xml
 * @Date: 2018/10/24 16:31
 * @Version 1.0
 */
@Controller
public class UserController extends BaseController {

    @Autowired
    private UserService userService;

    @RequestMapping("/index")
    public String index() {
        return "index";
    }

    @RequestMapping(value = "/user/get/random", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public MessageBean randomUser(HttpSession session) {

        UserExtend user = null;
//        UserExtend user = (UserExtend) session.getAttribute("user");
        MessageBean messageBean = null;

        if(user != null && user.getUid() != null) {
            messageBean = new MessageBean(true, "请求成功", user);
        }else{
            int uidInt = (int) Math.floor(Math.random() * 4 + 1);
            String uid = String.valueOf(uidInt);
            user = userService.getUserExtendInfoByUid(uid);
            if (user != null) {
                session.setAttribute("user",user);
                messageBean = new MessageBean(true, "请求成功", user);
            } else {
                messageBean = new MessageBean(false, "请求失败");
            }
        }
        return messageBean;
    }


}
