package com.live.utils;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/10/31 10:38
 * @description:
 */
public class Constant {
    public static class LiveMessage {
        public static final String TYPE_BARRAGE = "DANMU";
        public static final String TYPE_GIFT = "GIFT";
        public static final String TYPE_MANAGER = "MANAGER";
        public static final String TYPE_WELCOME = "WELCOME";
        public static final String TYPE_SYSTEM = "SYSTEM";
        public static final String TYPE_ROOM = "ROOM";
    }

    public static class LiveErrorCode {
        public static final String CODE_404 = "没有找到该页面";
        public static final String CODE_500 = "哎呀，服务出错了";
        public static final String CODE_403 = "真是不合理的请求";
        public static final String CODE_DEF = "服务崩溃了";
    }

}
