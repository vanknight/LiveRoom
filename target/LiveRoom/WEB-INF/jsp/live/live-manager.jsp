<%--
  Created by IntelliJ IDEA.
  author: Jsonor
  date: 2018/11/13 16:16
  description: Description
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<html>
<head>
    <title>自己直播间管理</title>

    <script src="${pageContext.request.contextPath}/static/js/vue.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/API.Store.js?v=1.846513123"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
</head>
<style>
    .db-i-block {
        display: inline-block;
    }

    .flex-align-center {
        display: flex;
        align-items: center;
    }

    .margin-t-b-5 {
        margin-top: 5px;
        margin-bottom: 5px;
    }

    .p-absolute {
        position: absolute;
    }

    .p-relative {
        position: relative;
    }

    .main {
        position: absolute;
        z-index: 999999;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        overflow: hidden;
        background: #404040;

    }

    .sidebar-mini {
        position: fixed;
        top: 0;
        bottom: 0;
        left: 0;
        width: 50px;
        z-index: 1020 !important;
        background-color: #252a2f;
    }

    .sidebar-wrapper {
        overflow: hidden;
        position: absolute;
        z-index: 999;
        width: 50px;
        top: 0;
        bottom: 0;
        background-color: #252a2f;
        -webkit-transition: all .3s cubic-bezier(0, 0, .2, 1);
        transition: all .3s cubic-bezier(0, 0, .2, 1);
    }

    .sidebar-wrapper ul {
        height: calc(100%);
        width: calc(100%);
        overflow-y: auto;
        position: relative;
        margin: 0;
        padding: 0;
    }

    .sidebar-wrapper ul li {
        color: #fff;
        white-space: nowrap;
        overflow: hidden;
        position: absolute;
        -webkit-transition: all .2s ease-out 0s;
        transition: all .2s ease-out 0s;
        width: 100%;
        height: 40px;
        line-height: 40px;
        font-size: 0;
    }

    .container {
        position: absolute;
        z-index: 1;
        width: calc(100% - 50px);
        height: 100%;
        overflow-y: auto;
        overflow-x: auto;
        background: #404040;
        top: 0;
        left: 50px;

    }

    .form-box {
        display: flex;
        flex-direction: column;
        position: relative;
        top: 20px;
        left: 0px;
    }

    .field-name {
        display: inline-block;
        line-height: 20px;
        height: 20px;
        font-size: 15px;
        width: 100px;
        text-align: right;
        margin-right: 7px;
        color: #ffffff;
    }

    .field-value {
        display: inline-block;
        line-height: 20px;
        font-size: 15px;
        margin: 0;
        padding: 3px;
        text-align: left;
        outline: 0;
        border: 1px solid #333;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        border-radius: 3px;
        text-decoration: none;
        list-style-type: none;
        color: #101010;
    }

    .field-btn {
        display: inline-block;
        outline: 0;
        line-height: 20px;
        font-size: 15px;
        padding: 3px;
        text-align: center;
        border: 1px solid #333;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        border-radius: 3px;
        background: #ffffff;
        margin-left: 7px;
    }

    .field-btn:active {
        background: #d0d0d0;
    }

    .tips {
        display: inline-block;
        line-height: 12px;
        font-size: 12px;
        margin: 0;
        text-align: left;
        margin-left: 107px;
        color: #ffffff;
    }

    .sidebar-item-icon {
        width: 50px;
        height: 40px;
        line-height: 40px;
        text-align: center;
        display: inline-block;
        vertical-align: middle;
        position: relative;
    }

    .sidebar-item-icon-svg {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate3D(-50%, -50%, 0);

        display: inline-block;
        margin: 0;
        padding: 0;
        height: 20px;
        width: 20px;
        vertical-align: middle;
    }

    .sidebar-item-icon-path {
        fill: hsla(0, 0%, 100%, .65);
    }

    .sidebar-item-link {
        margin: 0;
        padding: 0;
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
    }

    .sidebar-item-link-name {
        display: inline-block;
        vertical-align: middle;
        width: calc(200px - 50px);
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
        color: #fff;
        font-size: 14px;
    }

    .sidebar-wrapper ul li:hover {
        background: #192129;
    }

    .sidebar-wrapper ul li:hover .sidebar-item-link-name {
        color: rgb(211, 92, 117);
    }

    .sidebar-wrapper ul li:hover .sidebar-item-icon-path {
        fill: #ffffff;
    }

    .sidebar-wrapper:hover {
        cursor: pointer;
        width: 230px;
        -webkit-transition-delay: .3s;
        transition-delay: .3s;
    }
</style>
<body>
<div id="live-manager-app" class="main">
    <div class="sidebar-mini">
        <div class="sidebar-wrapper">
            <ul>
                <li style="transform: translate3d(0px, 0px, 0px);">
                    <span class="sidebar-item-icon">
                        <svg class="sidebar-item-icon-svg"
                             viewBox="0 0 1024 1024" width="40" height="40">
                            <path class="sidebar-item-icon-path"
                                  d="M992.08768 332.8L544.08768 51.2c-19.2-12.8-44.8-12.8-64 0l-448 281.6C-25.51232 364.8 0.08768 448 64.08768 448h896c64 0 89.6-83.2 32-115.2z"></path>
                            <path class="sidebar-item-icon-path"
                                  d="M128.08768 441.6v486.4c0 32 25.6 51.2 51.2 51.2H832.08768c32 0 51.2-25.6 51.2-51.2V441.6H128.08768z m499.2 492.8H390.48768V704c0-64 51.2-115.2 115.2-115.2s121.6 51.2 121.6 115.2v230.4z"></path>
                        </svg>
                    </span>
                    <a class="sidebar-item-link" href="#">
                        <span class="sidebar-item-link-name">房间信息</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="container">
        <div style="width: 100%;height: 80px;background: #303030;"></div>
        <div class="form-box">
            <div class="db-i-block flex-align-center margin-t-b-5 p-relative">
                <span class="field-name">房间ID :</span>
                <span style="color: #ffffff;"
                      class="field-value" v-html="room.roomid?room.roomid:''"></span>
            </div>
            <div class="db-i-block flex-align-center margin-t-b-5 p-relative">
                <span class="field-name">房间名 :</span>
                <input v-model="room.roomName" class="field-value"
                       type="text" name="roomName">
                <button @click="changeRoomName" class="field-btn">修改</button>
            </div>

            <div class="db-i-block flex-align-center margin-t-b-5 p-relative">
                <span class="field-name">拥有者 :</span>
                <input disabled class="field-value" type="text"
                       :value="room.user?room.user.username:''">
            </div>
            <div class="db-i-block flex-align-center margin-t-b-5 p-relative">
                <span class="field-name">直播地址 :</span>
                <a :href="room?'${pageContext.request.contextPath}/live/room/'+room.roomid+'.do':'#'"
                   class="field-value" style="color: #ffffff;border: 0;" target="_blank"
                   v-html="room?'${pageContext.request.contextPath}/live/room/'+room.roomid+'.do':'#'"></a>
            </div>
            <div class="db-i-block flex-align-center margin-t-b-5 p-relative">
                <span class="field-name">推流地址 :</span>
                <span class="field-value" style="color: #ffffff;border: 0;"
                      v-html="'rtmp://192.168.100.99/live'"></span>
            </div>
            <div class="db-i-block flex-align-center margin-t-b-5 p-relative">
                <span class="field-name">房间状态 :</span>
                <span disabled class="field-value" style="color: #ffffff;border: 0;"
                      v-html="room.state=='1'?'开播中':'已下播'"></span>
                <button @click="changeLiveRoomState" v-html="room.state=='1'?'下播':'开播'"
                        class="field-btn"></button>
            </div>
            <div class="db-i-block flex-align-center margin-t-b-5 p-relative">
                <p class="tips">Tips : 点击开播可以获取流名称</p>
            </div>
            <div v-if="room.state=='1'" class="db-i-block flex-align-center margin-t-b-5 p-relative">
                <span class="field-name">流名称 :</span>
                <span disabled class="field-value" style="color: #ffffff;border: 0;"
                      v-html="room.streamName"></span>
            </div>
        </div>
    </div>
</div>

</body>
<script>
    var liveManagerApp = new Vue({
        el: "#live-manager-app",
        data: {
            room: {},
            user: {}
        },
        created: function () {
            this.initRoom();
        },
        methods: {
            initRoom: function () {
                var _this = this;
                Store.getLiveRoomByURL().then(function (data) {
                    if (data.success) {
                        _this.room = data.other;
                        _this.user = data.other.user;
                    } else {
                        alert("登陆过期了")
                    }
                })
            },
            changeLiveRoomState: function () {
                var _this = this;
                //0-未开播
                var url = _this.room.state === "0" ?
                    "/live/state/" + _this.user.uid + "/true" :
                    "/live/state/" + _this.user.uid + "/false";

//                if (_this.room.state === "0") {
//                    _this.room.state = "1";
//                    _this.room.streamName = "asdf";
//                }else{
//                    _this.room.state = "0";
//                    _this.room.streamName = "";
//                }
                Store.getAjaxData(url, {}, "POST").then(function (data) {
                    if (data.success) {
                        _this.room = data.other;
                    } else {
                        alert(data.msg)
                    }
                })
            },
            changeRoomName: function () {
                var _this = this;
//                console.log("改变房间名")
                Store.getAjaxData("/live/name/" + _this.user.uid, {name: _this.room.roomName}, "POST").then(function (data) {

                    alert(data.msg)
                })
            }
        }
    })
</script>
</html>
