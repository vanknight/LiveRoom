package com.live.config;



import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;
import javax.websocket.server.ServerEndpointConfig.Configurator;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/10/30 16:11
 * @description:
 */
public class GetHttpSessionConfigurator extends Configurator{

    @Override
    public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request,
        HandshakeResponse response) {
        //super.modifyHandshake(sec, request, response);
        request.getHttpSession();
        HttpSession httpSession = (HttpSession) request.getHttpSession();
        if(httpSession != null) {
            sec.getUserProperties().put(HttpSession.class.getName(), httpSession);
        }
    }

}
