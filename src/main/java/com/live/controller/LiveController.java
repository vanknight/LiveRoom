package com.live.controller;

import com.live.pojo.*;
import com.live.service.*;
import com.live.beans.*;
import com.live.utils.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/10/26 16:13
 * @description:
 */
@Controller
public class LiveController {

    @Autowired
    private LiveService liveService;
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/live/manager", method = RequestMethod.GET)
    public ModelAndView getLiveRoomManagerByUid(HttpSession session) {
        UserExtend user = (UserExtend) session.getAttribute("user");
        if (user != null) {
        String uid = user.getUid();
        LiveRoomExtend liveRoom = liveService.getLiveRoomInfoByUid(uid);
        return new ModelAndView("live/live-manager");
        }
        return new ModelAndView("redirect:/live/error/404.do");
    }

    @RequestMapping(value = "/live/manager", method = RequestMethod.POST)
    @ResponseBody
    public Object getLiveRoomManagerByUid2(HttpSession session) {
        UserExtend user = (UserExtend) session.getAttribute("user");
        if (user != null) {
        String uid = user.getUid();
        LiveRoomExtend liveRoom = liveService.getLiveRoomInfoByUid(uid);
        //开播情况下可以获取房间信息
        if (liveRoom != null) {
            return new MessageBean(true, "", liveRoom);
        } else {
            return new MessageBean(false, "获取失败");
        }
        }
        return new MessageBean(false, "未登录");
    }

    @RequestMapping(value = "/live/uid/{uid}", method = RequestMethod.GET)
    public String getLiveRoomByUid(@PathVariable("uid") String uid) {
        LiveRoomExtend liveRoom = liveService.getLiveRoomInfoByUid(uid);
        if (liveRoom != null && liveRoom.getLrid() != null) {
            return "live/live";
        } else {
            return "redirect:/live/error/404.do";
        }
    }

    @RequestMapping(value = "/live/uid/{uid}", method = RequestMethod.POST)
    @ResponseBody
    public Object getLiveRoomMessageByUid(@PathVariable("uid") String uid) {
        LiveRoomExtend liveRoom = liveService.getLiveRoomInfoByUid(uid);
        //开播情况下可以获取房间信息
        if (liveRoom != null) {
            return new MessageBean(true, "", liveRoom);
        } else {
            return new MessageBean(false, "房间号错误");
        }
    }

    @RequestMapping(value = "/live/room/{roomid}", method = RequestMethod.GET)
    public String getLiveRoom(@PathVariable("roomid") String roomid) {
        LiveRoomExtend liveRoom = liveService.getLiveRoomInfoByRoomid(roomid);
        if (liveRoom != null && liveRoom.getLrid() != null) {
            return "live/live";
        } else {
            return "redirect:/live/error/404.do";
        }
    }

    @RequestMapping(value = "/live/room/{roomid}", method = RequestMethod.POST)
    @ResponseBody
    public Object getLiveRoomMessage(@PathVariable("roomid") String roomid) {
        LiveRoomExtend liveRoom = liveService.getLiveRoomInfoByRoomid(roomid);
        //开播情况下可以获取房间信息
        if (liveRoom != null) {

            return new MessageBean(true, "", liveRoom);
        } else {
            return new MessageBean(false, "房间号错误");
        }
    }

    @RequestMapping(value = "/live/error/{code}")
    public String liveError(@PathVariable("code") String code, HttpServletRequest request) {
        switch (code) {
            case "404":
                request.setAttribute("msg", Constant.LiveErrorCode.CODE_404);
                break;
            case "500":
                request.setAttribute("msg", Constant.LiveErrorCode.CODE_500);
                break;
            case "403":
                request.setAttribute("msg", Constant.LiveErrorCode.CODE_403);
                break;
            default:
                request.setAttribute("msg", Constant.LiveErrorCode.CODE_DEF);
                break;
        }
        return "live/live-error";
    }

    @RequestMapping(value = "/live/gifts", method = RequestMethod.GET)
    @ResponseBody
    public Object getLiveGifts() {
        List<LiveGift> gifts = liveService.getLiveGifts();
        MessageBean messageBean = null;
        if (gifts != null && gifts.size() > 0) {
            messageBean = new MessageBean(true, "", gifts);
        } else {
            messageBean = new MessageBean(false, "");
        }
        return messageBean;
    }

    @RequestMapping(value = "/live/barrages", method = RequestMethod.GET)
    @ResponseBody
    public Object getLiveBarrages(String lrid) {
        List<LiveBarrageExtend> barrages = liveService.getLiveBarrageExtendInfoByLrid(lrid);
        MessageBean messageBean = null;
        if (barrages != null && barrages.size() > 0) {
            messageBean = new MessageBean(true, "", barrages);
        } else {
            messageBean = new MessageBean(false, "加载弹幕失败");
        }
        return messageBean;
    }


    @RequestMapping(value = "/live/barrage/{roomid}", method = RequestMethod.POST)
    @ResponseBody
    public Object saveBarrage(@PathVariable("roomid") String roomid, String json,
                              HttpSession session) {

        UserExtend user = (UserExtend) session.getAttribute("user");
        LiveMessage liveMessage = JacksonConvertUtil.getObjectFromJson(json, LiveMessage.class);
        LiveRoomExtend liveRoom = liveService.getLiveRoomInfoByRoomid(roomid);
        if (liveMessage != null) {
            if (liveMessage.getBarrage().getUid() != null &&
                !liveMessage.getBarrage().getUid().equals("-1")) {
                liveMessage.getBarrage().setDatetime(
                    StringConvertDateUtil.convertDate(new Date())
                );
                liveMessage.getBarrage().setLbid(RandomUtil.get32UUID());
                liveMessage.getBarrage().setLrid(liveRoom.getLrid());
                //存入
                String lbid = liveService.addLiveBarrage(liveMessage.getBarrage());
                if (lbid != null) {
                    liveMessage.setBarrage(liveService.getLiveBarrageInfoByLbid(lbid));
                    return new MessageBean(true, "", liveMessage);
                } else {
                    liveMessage = new LiveMessage();
                    liveMessage.setType(Constant.LiveMessage.TYPE_BARRAGE);
                    liveMessage.setMessage("发送弹幕失败，请稍后再试");
                }
            }
        } else {
            liveMessage = new LiveMessage();
            liveMessage.setType(Constant.LiveMessage.TYPE_SYSTEM);
            liveMessage.setMessage("信息有误");
            String message = JacksonConvertUtil.getJsonFromObject(liveMessage);
        }
        return new MessageBean(false, "", liveMessage);
    }


    @RequestMapping(value = "/live/gift/{roomid}", method = RequestMethod.POST)
    @ResponseBody
    public Object saveGiver(@PathVariable("roomid") String roomid, String json,
                            HttpSession session) {
        UserExtend user = (UserExtend) session.getAttribute("user");
        LiveMessage liveMessage = JacksonConvertUtil.getObjectFromJson(json, LiveMessage.class);
        LiveRoomExtend liveRoom = liveService.getLiveRoomInfoByRoomid(roomid);
        if (liveMessage != null) {
            if (liveMessage.getType().equals(Constant.LiveMessage.TYPE_GIFT)
                && liveMessage.getGiver().getUid() != null && !liveMessage.getGiver().getUid()
                .equals("-1")) {
                Long lgid = liveMessage.getGiver().getLgid();
                LiveGift liveGift = liveMessage.getGiver().getGift();
                if (liveGift == null || liveGift.getPrice() == null) {
                    liveGift = liveService.getLiveGiftInfoByLgid(lgid);
                }
                double subtotal = liveGift.getPrice() * liveMessage.getGiver().getCount();
                if (subtotal > 500.0) {
                    liveMessage.setType(Constant.LiveMessage.TYPE_MANAGER);
                }
                liveMessage.getGiver().setSubtotal(subtotal);
                liveMessage.getGiver().setLggid(RandomUtil.get32UUID());
                liveMessage.getGiver().setLrid(liveRoom.getLrid());
                liveMessage.getGiver().setDatetime(StringConvertDateUtil.convertDate(new Date()));
                String lggid = liveService.addLiveGiftGiver(liveMessage.getGiver());
                if (lggid != null) {
                    liveMessage.setGiver(liveService.getLiveGiftGiverInfoByLggid(lggid));
                    return new MessageBean(true, "", liveMessage);
                } else {
                    liveMessage = new LiveMessage();
                    liveMessage.setType(Constant.LiveMessage.TYPE_BARRAGE);
                    liveMessage.setMessage("赠送礼物失败，请稍后再试");
                }
            }
        } else {
            liveMessage = new LiveMessage();
            liveMessage.setType(Constant.LiveMessage.TYPE_SYSTEM);
            liveMessage.setMessage("信息有误");
            String message = JacksonConvertUtil.getJsonFromObject(liveMessage);
        }
        return new MessageBean(false, "", liveMessage);
    }

    @RequestMapping(value = "/live/create/{uid}", method = RequestMethod.GET)
    @ResponseBody
    public Object createLiveRoom(HttpSession session, @PathVariable("uid") String uid) {
        UserExtend user = (UserExtend) session.getAttribute("user");
        if (user != null && uid.equals(user.getUid())) {
//            String uid = user.getUid();
            LiveRoomExtend liveRoom = liveService.getLiveRoomInfoByUid(uid);
            if (liveRoom != null && liveRoom.getLrid() != null) {
                return new MessageBean(false, "已经有直播间了");
            } else {
                String lrid = RandomUtil.get32UUID();
                String roomid = RandomUtil.get32UUID().substring(0, 16);
                String roomName = user.getUsername() + "的直播间";
                String stream_name = RandomUtil.randomStreamName();
                String end_time = StringConvertDateUtil.convertDate(new Date());
                String state = "0";
                liveRoom = new LiveRoomExtend(lrid, roomid, roomName, stream_name, end_time, state, uid);
                boolean mark = liveService.addLiveRoom(liveRoom);
                if (mark) {
                    return new MessageBean(true, "创建成功");
                }
            }
            return new MessageBean(false, "创建失败");
        }
        return new MessageBean(false, "没有登陆");
    }

    @RequestMapping(value = "/live/state/{uid}/{state}", method = RequestMethod.POST)
    @ResponseBody
    public Object changeLiveRoomState(
        HttpSession session,
        @PathVariable("state") boolean state,
        @PathVariable("uid") String uid
    ) {
        UserExtend user = (UserExtend) session.getAttribute("user");
//        UserExtend user = userService.getUserExtendInfoByUid(uid);

        if (user != null && uid.equals(user.getUid())) {
            LiveRoomExtend liveRoom = liveService.getLiveRoomInfoByUid(uid);
            if (liveRoom == null || liveRoom.getLrid() == null) {
                return new MessageBean(false, "没有该直播间");
            }

            if (liveRoom.getState().equals("0") && state) {
                String streamName = RandomUtil.randomStreamName();
                liveRoom.setStreamName(streamName);
            }
            if (liveRoom.getState().equals("1") && !state) {
                liveRoom.setEndTime(StringConvertDateUtil.convertDate(new Date()));
            }
            if (!liveRoom.getState().equals(state ? "1" : "0")) {
                liveRoom.setState(state ? "1" : "0");
                boolean mark = liveService.changeLiveRoom(liveRoom);
                if (mark) {
                    return new MessageBean(true, "更改成功", liveRoom);
                }
                return new MessageBean(false, "更改失败");
            } else {
                return new MessageBean(false, "已经是该状态");
            }
        } else {
            return new MessageBean(false, "没有登陆");
        }
    }

    @RequestMapping(value = "/live/name/{uid}", method = RequestMethod.POST)
    @ResponseBody
    public Object changeLiveRoomName(HttpSession session, String name, @PathVariable("uid") String uid) {
        UserExtend user = (UserExtend) session.getAttribute("user");
//        UserExtend user = userService.getUserExtendInfoByUid(uid);
        if (user != null && uid.equals(user.getUid())) {
            LiveRoomExtend liveRoom = liveService.getLiveRoomInfoByUid(uid);
            if (liveRoom != null && liveRoom.getLrid() != null) {
                liveRoom.setRoomName(name);
                boolean mark = liveService.changeLiveRoomName(liveRoom);
                if (mark) {
                    return new MessageBean(true, "更改成功");
                }
                return new MessageBean(false, "更改失败");
            }
            return new MessageBean(false, "没有直播间");
        } else {
            return new MessageBean(false, "没有登陆");
        }
    }

}
