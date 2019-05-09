package com.live.controller;

import com.live.config.GetHttpSessionConfigurator;
import org.springframework.stereotype.Controller;

import com.live.pojo.*;
import com.live.service.*;
import com.live.beans.*;
import com.live.utils.*;
import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/10/26 16:32
 * @description:
 */
@Controller
@ServerEndpoint(value = "/websocket/{roomName}",
                configurator = GetHttpSessionConfigurator.class)
public class WebSocketController {

    private static ConcurrentHashMap<String, Set<Session>> rooms = new ConcurrentHashMap<>();

    @OnOpen
    public void onOpen(@PathParam(value = "roomName") String roomName,
        Session session)
        throws Exception {
        if (!rooms.containsKey(roomName)) {
            Set<Session> room = new HashSet<>();
            room.add(session);
            rooms.put(roomName, room);
        } else {
            rooms.get(roomName).add(session);
        }
        System.out.println(roomName + "房间在线人数:" + rooms.get(roomName).size());

    }

    @OnClose
    public void disConnect(@PathParam("roomName") String roomName, Session session) {
        rooms.get(roomName).remove(session);
        System.out.println(roomName + "房间在线人数:" + rooms.get(roomName).size());
    }

    @OnMessage
    public void receiveMsg(@PathParam("roomName") String roomName, String msg)
        throws Exception {
        broadcast(roomName, msg);
    }

//    @OnError
//    public void printError(@PathParam("roomName") String roomName, Session session,Exception e){
//        System.out.println(e);
//    }


    // 按照房间名进行广播
    public static void broadcast(String roomName, String msg) throws Exception {
        //System.out.println("信息广播:"+msg);
        Integer count = rooms.get(roomName).size();
        LiveMessage liveMessage = JacksonConvertUtil.getObjectFromJson(msg,LiveMessage.class);
        if(liveMessage != null){
            liveMessage.setCount(count);
        }
        String message = JacksonConvertUtil.getJsonFromObject(liveMessage);
        for (Session session : rooms.get(roomName)) {
            session.getBasicRemote().sendText(message);
        }
    }

}
