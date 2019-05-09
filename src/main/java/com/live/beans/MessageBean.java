package com.live.beans;

/**
 * @Author: xml
 * @Date: 2018/10/24 16:31
 * @Version 1.0
 */
public class MessageBean {
    //是否成功
    private boolean success;
    //返回消息
    private Object msg;
    //其他对象
    private Object other;
    public Object getOther() {
        return other;
    }

    public void setOther(Object other) {
        this.other = other;
    }

    public MessageBean(boolean success, Object msg, Object other)
    {
        this.success = success;
        this.msg = msg;
        this.other = other;
    }

    public MessageBean(boolean success, Object msg)
    {
        this.success = success;
        this.msg = msg;
    }
    public MessageBean(Object other)
    {
        this.other = other;
    }
    public boolean isSuccess() {
        return success;
    }
    public void setSuccess(boolean success) {
        this.success = success;
    }
    public Object getMsg() {
        return msg;
    }
    public void setMsg(Object msg) {
        this.msg = msg;
    }
}