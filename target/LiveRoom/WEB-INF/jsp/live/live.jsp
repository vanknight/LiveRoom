<%--
  Created by IntelliJ IDEA.
  author: Jsonor
  date: 2018/10/24 10:03
  description: Description
--%>
<%@ page contentType="text/html;charset=UTF-8"
         isELIgnored="false" %>
<html manifest="${pageContext.request.contextPath}/v100.appcache">
<head>
    <title>直播间</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/css/live-cntr.css?v=2.45.4.">
    <script src="${pageContext.request.contextPath}/static/js/flv.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/vue.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/API.Store.js?v=1.78+45+45+"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
    <!-- Live2D Library -->
    <script src="${pageContext.request.contextPath}/live2d/lib/live2d.min.js"></script>
    <!-- Live2D Framework -->
    <script src="${pageContext.request.contextPath}/live2d/framework/Live2DFramework.js"></script>
    <!-- User's Script -->
    <script src="${pageContext.request.contextPath}/live2d/src/utils/MatrixStack.js"></script>
    <script src="${pageContext.request.contextPath}/live2d/src/utils/ModelSettingJson.js"></script>
    <script src="${pageContext.request.contextPath}/live2d/src/PlatformManager.js"></script>
    <script src="${pageContext.request.contextPath}/live2d/src/LAppDefine.js?t=12323123123123"></script>
    <script src="${pageContext.request.contextPath}/live2d/src/LAppModel.js?t=12426436"></script>
    <script src="${pageContext.request.contextPath}/live2d/src/LAppLive2DManager.js?v=1.152543"></script>
    <script src="${pageContext.request.contextPath}/live2d/src/SampleApp1.js?v=1.129841621"></script>
</head>

<style>
    .live2d-manager-box {
        position: fixed;
        bottom: 0;
        left: 0;
        background: transparent;
        max-width: 204px;
        max-height: 288px;
        min-width: 30px;
        min-height: 30px;
        margin: 0;
        padding: 0;
        z-index: 9;
        transform: translate(0px, 0px);
    }

    .btn-close {
        position: absolute;
        top: 0;
        right: 0px;
        width: 30px;
        height: 30px;
        background: #ffffff;
        z-index: 99;
    }

    .btn-close:before {
        content: '';
        position: absolute;
        top: 50%;
        left: 50%;
        width: 30px;
        height: 2px;
        background: rgb(211, 92, 117);

        -webkit-transform: translate3d(-50%, -50%, 0) rotate(45deg);
        -moz-transform: translate3d(-50%, -50%, 0) rotate(45deg);
        -ms-transform: translate3d(-50%, -50%, 0) rotate(45deg);
        -o-transform: translate3d(-50%, -50%, 0) rotate(45deg);
        transform: translate3d(-50%, -50%, 0) rotate(45deg);
    }

    .btn-close:after {
        content: '';
        position: absolute;
        top: 50%;
        left: 50%;
        width: 30px;
        height: 2px;
        background: rgb(211, 92, 117);

        -webkit-transform: translate3d(-50%, -50%, 0) rotate(-45deg);
        -moz-transform: translate3d(-50%, -50%, 0) rotate(-45deg);
        -ms-transform: translate3d(-50%, -50%, 0) rotate(-45deg);
        -o-transform: translate3d(-50%, -50%, 0) rotate(-45deg);
        transform: translate3d(-50%, -50%, 0) rotate(-45deg);
    }

    .btn-direct {
        position: absolute;
        top: 0;
        left: 0;
        width: 30px;
        height: 30px;
        background: #ffffff;
        z-index: 99;
    }

    .btn-direct:before {
        content: '';
        position: absolute;
        top: 50%;
        left: 50%;
        width: 30px;
        height: 2px;
        background: rgb(211, 92, 117);

        -webkit-transform: translate3d(-50%, -50%, 0) rotate(45deg);
        -moz-transform: translate3d(-50%, -50%, 0) rotate(45deg);
        -ms-transform: translate3d(-50%, -50%, 0) rotate(45deg);
        -o-transform: translate3d(-50%, -50%, 0) rotate(45deg);
        transform: translate3d(-50%, -50%, 0) rotate(45deg);
    }

    #glcanvas {
        position: relative;
        bottom: 0;
        right: 0;
        background: transparent;
        margin: 0;
        padding: 0;
    }
</style>

<body onload="sampleApp1()" style="margin: 0;">

<jsp:include page="init-show-animation.jsp"/>
<div id="live-app" style="display: none;" data-v-4d5h6f1b class="app-body p-relative m-auto">
    <div class="player-and-aside-area p-relative z-player-and-aside-area">
        <div class="player-cntr left-container p-relative z-player-ctnr">
            <div id="head-info-vm" class="head-info-section p-relative z-head-info">

                <div data-v-2d12b310
                     class="header-info-ctnr flex flex-row flex-between flex-align-center">
                    <a data-v-2d12b310 href="javascript:void (0)"
                       target="_blank" class="room-cover dp-i-block p-relative bg-cover">
                        <div data-v-2d12b310="" role="img"
                             class="anchor-avatar h-100 p-relative bg-cover"
                             style="background-image: url('https://i2.hdslb.com/bfs/face/13863d32076c057deaeec64f35d3889990693cac.jpg@100w_100h.webp');"></div>
                    </a>
                    <div data-v-2d12b310="" class="room-info-ctnr dp-i-block">
                        <div data-v-2f5f6db4="" data-v-2d12b310=""
                             class="room-info-upper-row p-relative">
                            <div data-v-2f5f6db4="" class="normal-mode">
                                <div data-v-2f5f6db4="" class="info-section dp-i-block v-middle">
                                    <h1 data-v-2f5f6db4=""
                                        class="room-title v-middle t-no-wrap flex flex-row flex-align-center ">
                                        <span data-v-196bbf15="" data-v-2f5f6db4=""
                                              class="live-status-label v-middle live">直播</span>
                                        <span data-v-2f5f6db4="" v-html="room?room.roomName:''"
                                              class="title-length-limit v-middle dp-i-block">房间标题</span>
                                        <a target="_blank" v-if="room?room.user.uid==user.uid:false"
                                           style="margin-left: 8px;color: #fff;background: #23ade5;"
                                           href="${pageContext.request.contextPath}/live/manager.do"
                                           data-v-196bbf15 data-v-2f5f6db4
                                           class="live-status-label v-middle live">管理</a>
                                    </h1>
                                </div>
                            </div>
                            <div data-v-2f5f6db4="" class="upper-right-ctnr p-absolute none-select">
                                <div data-v-2f5f6db4=""
                                     class="right-action-ctnr pointer dp-i-block btn">
                                    <i data-v-2f5f6db4
                                       class="icon-size-16 icon-report v-middle"></i>
                                    <span data-v-2f5f6db4
                                          class="action-text v-middle dp-i-block">举报</span>
                                </div>
                                <div data-v-2f5f6db4
                                     class="right-action-ctnr pointer dp-i-block btn">
                                    <i data-v-2f5f6db4 class="icon-size-16 icon-share v-middle"></i>
                                    <span data-v-2f5f6db4
                                          class="action-text v-middle dp-i-block">分享</span>
                                </div>
                                <div data-v-2f5f6db4 title="人气值"
                                     class="right-action-ctnr dp-i-block">
                                    <i data-v-2f5f6db4
                                       class="icon-size-16 icon-popular v-middle"></i>
                                    <span data-v-2f5f6db4 v-html="peopleCount"
                                          class="action-text v-middle dp-i-block"></span>
                                </div>
                            </div>
                        </div>
                        <div data-v-b19cec62="" data-v-2d12b310="" class="room-info-down-row">
                            <div data-v-463c590a data-v-b19cec62
                                 class="dp-i-block v-middle p-relative">
                                <span data-v-463c590a class="up-level-icon pointer lv-31">UP</span>
                            </div>
                            <a data-v-b19cec62="" href="//space.bilibili.com/57798291/"
                               target="_blank" v-html="room?room.user.username:''"
                               class="room-owner-username dp-i-block v-middle">用户名</a>
                            <div data-v-60341634="" data-v-b19cec62=""
                                 class="attention-btn-ctnr v-middle p-absolute flex flex-row flex-center flex-align-center"
                                 style="z-index: 1;">
                                <div data-v-60341634="" role="button"
                                     class="left-part dp-i-block pointer p-relative">
                                    <i data-v-60341634=""
                                       class="icon-font icon-attention v-middle icon-attention"></i>
                                    <span data-v-60341634=""
                                          class="follow-text v-middle d-inline-block">关注</span>
                                </div>
                                <div data-v-60341634 v-html="followCount"
                                     class="right-part dp-i-block"></div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="player-section p-relative none-select z-player-section">
                <div id="live-player-ctnr" class="live-player-ctnr w-100 h-100 p-absolute normal">
                    <div class="h-100 p-relative">
                        <div id="live-player" class="live-player-mounter h-100">
                            <div id="js-player-decrator"
                                 style="width: 100%;height: 100%;position: relative;z-index: 1;">
                                <%--Ido HTML5 Live Player--%>
                                <div class="ido-live-player relative"
                                     @mouseenter="showController" @mouseleave="hiddenController"
                                     v-bind:data-controller-state="showControl?'show':'hidden'"
                                     v-bind:data-live-state="isLive?'':'preparing'">
                                    <%--直播视频和弹幕--%>
                                    <div class="ido-live-player-video-area">
                                        <div ref="danmuku" class="ido-live-player-video-danmaku">
                                            <%--<div class="ido-danmaku">我是弹幕</div>--%>
                                        </div>
                                        <div class="ido-live-player-video">
                                            <video id="video-element" tabindex="-1"
                                                   ref="videoElement"
                                                   style="z-index:1;"
                                                   class="ido-live-player-video-stream">
                                            </video>
                                        </div>
                                    </div>
                                    <%--视频控制--%>
                                    <div class="ido-live-player-video-controller">
                                        <div class="ido-live-player-video-controller-container">
                                            <div
                                                class="ido-live-player-video-controller-content clearfix">
                                                <div
                                                    class="ido-live-player-video-controller-left clearfix">
                                                    <div
                                                        class="ido-live-player-video-controller-btn-item ido-live-player-video-controller-start-btn">

                                                        <button @click="flvStart"
                                                                class="blpui-btn icon-btn">
                                                            <i v-if="!isPlaying"
                                                               class="live-icon-play"></i>
                                                            <i v-if="isPlaying"
                                                               class="live-icon-pause"></i>
                                                        </button>

                                                    </div>
                                                </div>
                                                <div
                                                    class="ido-live-player-video-controller-right clearfix">
                                                    <div
                                                        class="ido-live-player-video-controller-btn-item ido-live-player-video-controller-web-fullscreen-btn"
                                                        style="order:1;">
                                                        <button @click="fullWeb" data-title="网页全屏"
                                                                class="blpui-btn icon-btn icon-bg-white">
                                                            <i v-if="!isFullWeb"
                                                               class="live-icon-web-fullscreen"></i>
                                                            <i v-if="isFullWeb"
                                                               class="live-icon-exit-web-fullscreen"></i>
                                                            <%--网页全屏--%>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%--提示--%>
                                    <div class="ido-live-player-ending-panel"
                                         style="display: block;">
                                        <div class="ido-live-player-ending-panel-container">
                                            <div v-html="room?room.state == '1'?'获取直播失败了，请刷新重试':'主播正在挂机...':'正在加载房间信息'"
                                                 class="ido-live-player-ending-panel-tips"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="gift-control-vm"
                 class="gift-control-section p-relative z-gift-control-section">
                <div data-v-54f09af5="" class="gift-control-panel f-clear b-box p-relative">
                    <div data-v-54f09af5="" style="width: 100%;"
                         class="vertical-middle section right-part p-relative">
                        <div class="v-middle">
                            <div data-v-54f09af5="" style="width: 100%;"
                                 class="gift-presets p-relative t-right">
                                <div data-v-54f09af5="" class="gift-section gift-list">
                                    <div data-v-54f09af5=""
                                         class="gift-panel base-panel flex flex-row">

                                        <div v-for="(item,index) in gifts"
                                             @click="showGiftChoise(index)"
                                             data-v-17c645f0="" data-v-54f09af5="" role="button"
                                             class="gift-item dp-i-block p-relative v-top pointer bg-cover normal buy">
                                            <img data-v-17c645f0=""
                                                 :src="item?(defaultRoot + item.img):defaultURL"
                                                 class="img">
                                            <div data-v-17c645f0="" class="info">
                                                <p data-v-17c645f0="" v-html="item.name"
                                                   class="label"></p>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div data-v-54f09af5="" class="supporting-info">
                                <div data-v-53c9fbb8="" data-v-54f09af5="" class="seeds-wrap">
                                    <div data-v-53c9fbb8="" class="item seeds">
                                        <i data-v-53c9fbb8=""
                                           class="icon-size-17 user-wealth v-middle bg-cover"></i>
                                        <span data-v-53c9fbb8="" v-html="user?user.wealth:0"
                                              class="v-middle"></span>
                                    </div>
                                    <div data-v-53c9fbb8="" class="item seeds">
                                        <i data-v-53c9fbb8=""
                                           class="icon-size-17 user-integral v-middle bg-cover"></i>
                                        <span data-v-53c9fbb8="" v-html="user?user.integral:0"
                                              class="v-middle"></span>
                                    </div>
                                    <div data-v-53c9fbb8="" class="item btn">信仰充值</div>
                                    <div data-v-53c9fbb8="" class="item z-gift-package">
                                        <div data-v-e3581772 data-v-53c9fbb8
                                             class="gift-package flex flex-row flex-center flex-align-center">
                                            <span data-v-e3581772="">包裹</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <transition name="show-gift">
                <div v-if="isShowGift" class="gift-popup-frame p-absolute" ref="giftPopupFrame">
                    <div data-v-c535a2d6 data-v-54f09af5 style="width: 100%;height: 100%;left: 0;top: 0;"
                         class="p-absolute ts-dot-2 z-gift-sender-panel">
                        <div data-v-c535a2d6="" class="gift-sender-panel arrow-bottom ts-dot-2 an-scale-in-ease"
                             style="">
                            <div data-v-dc3bc9cc data-v-c535a2d6 name="gift-sender-form">
                                <div data-v-dc3bc9cc class="content">
                                    <div data-v-dc3bc9cc class="gift-frame gift-img dp-i-block v-middle"
                                         :style="showGiftImage"></div>
                                    <div data-v-dc3bc9cc class="gift-info dp-i-block v-middle">
                                        <div data-v-dc3bc9cc="" class="dp-i-block v-middle">
                                        <span data-v-dc3bc9cc v-html="showGift?showGift.name:'礼物名'"
                                              class="gift-info-title dp-i-block v-middle"></span>
                                        </div>
                                        <div data-v-dc3bc9cc="" class="gift-price">
                                        <span data-v-dc3bc9cc class="coin-type dp-i-block v-middle none-select">
                                            <i data-v-dc3bc9cc=""
                                               class="icon-size-16 user-wealth v-middle bg-cover"></i>
                                            <span data-v-dc3bc9cc="" v-html="showGift?showGift.price:'价格'"
                                                  class="text v-middle"></span>
                                        </span>
                                        </div>
                                        <div data-v-dc3bc9cc="" class="gift-info-desc">
                                        <span v-html="showGift?showGift.describe:'礼物描述'"
                                              style="display:inline-block;"></span>
                                        </div>
                                    </div>
                                </div>
                                <div data-v-dc3bc9cc="" class="count-choice none-select">
                                    <button data-v-dc3bc9cc @click="isShowGift=false"
                                            class="cancel-button v-middle b-box ts-dot-2">
                                        <span data-v-dc3bc9cc="" class="p-relative">取消</span>
                                    </button>
                                    <div data-v-dc3bc9cc="" class="count-inputs">
                                        <div data-v-dc3bc9cc="" class="count-input-box p-relative dp-i-block v-middle">
                                            <input v-model="showGift.count" maxlength="4"
                                                   data-v-d24aeb24 data-v-dc3bc9cc type="number" placeholder="数量"
                                                   class="link-input count-input placeholder-color b-box">
                                        </div>
                                        <button data-v-dc3bc9cc="" @click="sendGift"
                                                class="send-button v-middle b-box ts-dot-2">
                                            <span data-v-dc3bc9cc="" class="p-relative">发送</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </transition>
        </div>
        <div class="aside-area p-absolute z-aside-area border-box">
            <div class="chat-history-panel">
                <div id="chat-history-list" ref="messageList"
                     class="chat-history-list h-100 p-relative border-box z-chat-history-list">
                    <%--弹幕List--%>
                </div>
            </div>
            <div id="chat-control-panel-vm" class="chat-control-panel">
                <div class="control-panel-ctnr border-box p-relative" data-v-355bd02d>
                    <div data-v-355bd02d class="control-panel-icon-row p-relative">
                        <div data-v-355bd02d class="icon-left-part">
                            <%--菜单项--%>
                            <span @click="sendGift('6',2)" data-v-355bd02d
                                  class="icon-item icon-font">1</span>
                        </div>
                        <div data-v-355bd02d class="icon-right-part">
                            <%--菜单项--%>
                            <span @click="sendGift('2',3)" data-v-355bd02d
                                  class="icon-item icon-font gift-block">1</span>
                        </div>
                    </div>
                    <div data-v-355bd02d class="chat-input-ctnr p-relative">
                        <div data-v-355bd02d>
                            <%--输入框--%>
                            <textarea v-model="danmuInput" v-bind:maxLength="maxFontCount"
                                      data-v-355bd02d class="chat-input border-box"></textarea>
                            <%--字数--%>
                            <span data-v-355bd02d class="input-limit-hint p-absolute"
                                  v-html="(fontCount + '/' + maxFontCount)"></span>
                        </div>
                    </div>
                    <div data-v-355bd02d class="bottom-actions p-relative">
                        <div data-v-355bd02d class="left-action">
                            <%----%>
                            <span data-v-355bd02d class="action-item nice-boat">箭</span>
                        </div>
                        <div data-v-355bd02d class="right-action p-absolute">
                            <%--发送按钮--%>
                            <button @click="sendDanmu" data-v-355bd02d data-v-8a4e6ac4
                                    v-bind:disabled="fontCount <= 0"
                                    class="bl-button bl-button--primary bl-button--small">
                                <span data-v-8a4e6ac4 class="text">发送</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div ref="live2DManagerBox" class="live2d-manager-box">
        <span @click="orLive2D" class="btn-close"></span>
        <canvas :style="{'display':hiddenLive2D?'none':'inline-block'}" id="glcanvas" width="204" height="288"></canvas>
    </div>
</div>

</body>

<script>
    Vue.prototype.$flvjs = flvjs;

    var liveApp = new Vue({
        el: "#live-app",
        data: {
            user: null,
            room: null,
            gifts: [],
            showGift: null,
            isShowGift: false,
            hiddenLive2D: false,
            timer: null,
            player: null,
            ws: null,
            initAnimation: null,
            flvPlayer: null,
            danmuInput: null,
            danmuku: [],//屏幕显示弹幕
            messageList: [],//右侧显示所有消息
            maxFontCount: 40,
            minFontCount: 0,
            fontCount: 0,
            messageMaxSize: 40,
            danmuItemHeight: 27.78,
            peopleCount: "",//在线观看人数
            followCount: "",//直播间关注数
            defaultURL: Store.root + "/static/gift/default.png",
            defaultRoot: Store.root,
            showControl: false,
            isPlaying: false,
            isLive: false,
            isFullWeb: false,
            isFullWin: false,
            live2DManagerBox: null,
            live2DManagerBoxPosition: {x: 0, y: 0}
        },
        created: function () {
            this.init();
        },
        watch: {
            danmuInput: function (curValue, oldValue) {
                var _this = this;
                _this.danmuInput = _this.danmuInput.replace(" ", "");
                _this.danmuInput = _this.danmuInput.replace(/\s+g/, "");
                _this.danmuInput = _this.danmuInput.replace(/\t+g/, "");
                _this.danmuInput = _this.danmuInput.replace(/[\r\n]/g, "");
                _this.danmuInput = _this.danmuInput.replace(/[\n]/g, "");
                _this.fontCount = _this.danmuInput.length;
            }
        },
        computed: {
            showGiftImage: function () {
                var _this = this;
                var img_src = _this.showGift ? _this.showGift.img : "/static/gift/礼物2x200.png";
                return {
                    'background-image': "url(" + Store.root + img_src + ")"
                }
            }
        },
        mounted: function () {
            var _this = this;
            this.$refs.live2DManagerBox.onmousedown = function (ev) {
                _this.directLive2D(ev);
                _this.$refs.live2DManagerBox.onmouseover = function (ev) {
                    document.onmousemove = null;
                    document.onmouseup = null;
                }
            }
        },
        methods: {
            init: function () {
                var _this = this;
                Store.getUserBySession().then(function (data) {
                    if (data.success) {
                        _this.user = data.other;
                        _this.initRoom();
                        _this.initGift();

                    } else {
                        _this.user = {
                            uid: '-1',
                            username: "游客" + new Date().getTime().toString().substring(0, 9)
                        };
                        _this.initRoom();
                        _this.initGift();
                    }
                });
            },
            initRoom: function () {
                var _this = this;
                Store.getLiveRoomByURL().then(function (data) {
                    if (data.success) {
                        _this.room = data.other;
                        _this.initShowAnimation();
                        _this.initDanmu();
                        _this.createFlvPlayer();
                    } else {
                        alert(data.msg)
                    }
                });
            },
            initGift: function () {
                var _this = this;
                Store.getAjaxData("/live/gifts", {}, "get").then(function (data) {
                    if (data.success) {
                        _this.gifts = data.other;
                    } else {

                    }
                })
            },
            initDanmu: function () {
                var _this = this;
                Store.getAjaxData("/live/barrages", {lrid: _this.room.lrid}, "get").then(
                    function (data) {
                        if (data.success) {
                            for (var i = 0; i < data.other.length; i++) {
                                var danmu = data.other[i];
                                var message = {};
                                message.danmu = danmu;
                                message.type = Store.liveMessageType.danmu;
                                _this.createListDanmuItemDom(message.type, message.danmu);
                            }
                        } else {
                            console.log(data.msg);
                        }
                        _this.createWebSocket();
                    })
            },
            initShowAnimation: function () {
//                console.log("开始欢迎动画")
                var _this = this;
                var $after = $("#live-app");
                _this.initAnimation = new InitShowAnimation(_this.room, randomColor(), $after);
                _this.initAnimation.nowLoading();
            },
            createWebSocket: function () {
                if ("WebSocket" in window) {
                    var _this = this;
                    var host = window.location.host;
                    this.ws = new WebSocket('ws://' + host + Store.root+'/websocket/'
                        + _this.room.roomid);
                    this.ws.onopen = function (event) {
                        console.log("open");
                        setTimeout(function () {
                            _this.initAnimation.loadIsDone();
                            _this.initAnimation.initNowLoading.removeThis();
                        }, 1e3);
                        _this.ws.send(JSON.stringify(_this.createWelcomeMessage()));
                    };
                    this.ws.onmessage = function (p1) {
//                        console.log("message");
                        _this.whenWebSocketMessage(JSON.parse(p1.data));
                    };
                    this.ws.onclose = function (p1) {
                        console.log("close")
                    };
                    this.ws.onerror = function (event) {
                        console.log("error")
                    };
                }
            },
            createFlvPlayer: function () {
                var _this = this;
                _this.player = _this.$refs.videoElement;
                if (_this.$flvjs.isSupported()) {
                    _this.flvPlayer = _this.$flvjs.createPlayer({
                        type: 'flv',
                        isLive: true,
                        url: "http://192.168.100.99:7001/live/" + _this.room.streamName + ".flv",
                    });
                    _this.flvPlayer.attachMediaElement(_this.player);
                    _this.flvPlayer.load(); //加载
                    _this.flvStart();
                    _this.addplayerEventListener();
                }
            },
            addplayerEventListener: function () {
                var _this = this;
                _this.player.onloadeddata = function () {
//                    console.log("加载媒介中")
                };
                _this.player.onprogress = function () {
//                    console.log("获取数据中")
                    _this.isLive = true;
                    window.clearInterval(_this.timer);
                    _this.timer = null;
                };
                _this.player.onstalled = function () {
//                    console.log("获取数据错误");
                    _this.isLive = false;
                };
                _this.player.oncanplay = function () {
//                    console.log("缓存中")
                };
                _this.player.onloadstart = function () {
//                    console.log("加载媒介数据中")
                }
            },
            flvStart: function () {
                var _this = this;
                if (_this.player && !_this.isPlaying) {
                    var playPromise = _this.player.play();
                    if (playPromise !== undefined) {
                        playPromise.then(function (_) {
                            _this.isPlaying = true;
                        }).catch(function (error) {

                        });
                    }
                } else {
                    _this.flvPause();
                }
            },
            flvPause: function () {
                var _this = this;
                if (_this.player) {
                    _this.player.pause();
                }
                _this.isPlaying = false;
            },
            flvDestroy: function () {
                var _this = this;
                _this.player.pause();
                _this.player.unload();
                _this.player.detachMediaElement();
                _this.player.destroy();
//                _this.player = null;
                _this.isPlaying = false;
            },
            fullWeb: function () {
                var body = document.getElementsByTagName("body")[0];

                if (!this.isFullWeb) {
                    this.isFullWeb = true;
                    body.className = "player-full-win over-hidden";
                } else {
                    this.isFullWeb = false;
                    body.className = "";
                }
            },
            createWelcomeMessage: function () {
                var message = {};
                message.type = Store.liveMessageType.welcome;
                message.user = this.user;
                return message;
            },
            createDanmuMessage: function (content) {
                var message = {};
                var danmu = {};
                danmu.uid = this.user.uid;
                danmu.content = content;
                danmu.user = this.user;
                message.type = Store.liveMessageType.danmu;
                message.barrage = danmu;
                return message;

            },
            createGiftMessage: function (lgid, count) {
                var message = {};
                var giver = {};
                giver.count = count;
                giver.uid = this.user.uid;
                giver.lgid = lgid;
                giver.gift = {};
                giver.user = this.user;
                message.type = Store.liveMessageType.gift;
                message.giver = giver;
                return message;
            },
            sendDanmu: function () {
                var message = this.createDanmuMessage(this.danmuInput);
                this.danmuInput = "";
                var _this = this;
                if (_this.checkUser()) {
                    Store.getAjaxData("/live/barrage/" + _this.room.roomid,
                        {json: JSON.stringify(message)}, "post").then(function (data) {
                        if (data.success) {
                            _this.ws.send(JSON.stringify(data.other));
                        } else {
                            alert(data.other.message);
                        }
                    });
                } else {
                    _this.ws.send(JSON.stringify(message));
                }
            },
            sendGift: function () {
                var _this = this;
                if (_this.isShowGift) {
                    var count = _this.showGift.count;
                    var lgid = _this.showGift.lgid;
                    var message = this.createGiftMessage(lgid, count);
                    if (_this.checkUser()) {
                        Store.getAjaxData("/live/gift/" + _this.room.roomid,
                            {json: JSON.stringify(message)}, "post").then(function (data) {
                            if (data.success) {
                                _this.isShowGift = false;
                                _this.ws.send(JSON.stringify(data.other));
                            } else {
                                _this.isShowGift = false;
                                alert(data.other.message);
                            }
                        });
                    } else {
                        alert("你未登陆");
                    }
                }
            },
            addDanmuShowInVideo: function (danmu, other) {
                var _this = this;
                var danmukuItem = {
                    pos: {line: 0, count: 0},
                    danmu: danmu,
                    isFullShow: false,
                    danmuDom: null
                };
                //视频最多行数,默认全屏
                var lineCount = parseInt(this.$refs.danmuku.clientHeight / _this.danmuItemHeight);
                _this.checkPos(lineCount, danmukuItem);
                _this.createDanmuKuItemDom(danmukuItem, other);
                _this.addEventListenerWhenTransitionEnd(_this.danmuku, danmukuItem.pos.line,
                    danmukuItem.pos.count);
                _this.scrollToEnd(_this.$refs.messageList);

            },
            checkPos: function (lineCount, danmukuItem) {
                var _this = this;
                var findOld = false;
                for (var i = 0; i < _this.danmuku.length && i < lineCount && !findOld; i++) {
                    if (!_this.danmuku[i]) {
                        _this.danmuku[i] = [];
                    }
                    var notAllShow = false;
                    var first = -1;
                    for (var j = 0; j < _this.danmuku[i].length; j++) {
                        if (!_this.danmuku[i][j].isFullShow) {
                            notAllShow = true;
                        } else {
                            if ((!_this.danmuku[i][j] || !_this.danmuku[i][j].danmuDom) && first
                                === -1) {
                                first = j;
                            }
                        }
                    }
                    if (!notAllShow && !findOld) {//这一行全部显示完毕
                        findOld = true;
                        danmukuItem.pos.line = i;
                        danmukuItem.pos.count = j;
                    }
                }
                //现有的每行都有没有显示完的弹幕又没有找到
                if (!findOld) {
                    if (_this.danmuku.length >= lineCount) {
                        //随机一行显示
                        danmukuItem.pos.line = Math.floor(Math.random() * lineCount);
                        danmukuItem.pos.count = _this.danmuku[danmukuItem.pos.line].length;
                    } else {
                        //添加新的一行
                        danmukuItem.pos.line = _this.danmuku.length;
                        danmukuItem.pos.count = 0;
                    }
                }
            },
            checkUser: function () {
                if (this.user.uid === "-1") {
                    return false;
                } else {
                    return true;
                }
            },
            createDanmuKuItemDom: function (danmukuItem, other) {
                //other是其他属性设置
                var _this = this;
                var danmuDom = document.createElement("div");
                danmuDom.style.userSelect = "none";
                danmuDom.style.position = "absolute";
                danmuDom.style.whiteSpace = "pre";
                danmuDom.style.pointerEvents = "none";
                danmuDom.style.perspective = "500px";
                danmuDom.style.display = "inline-block";
                danmuDom.style.willChange = "transform";
                danmuDom.style.fontSize = "25px";
                danmuDom.style.color = "rgb(255,255,255)";
                danmuDom.style.fontFamily = "SimHei, \"Microsoft JhengHei\", Arial, Helvetica, sans-serif";
                danmuDom.style.fontWeight = "blod";
                danmuDom.style.lineHeight = 1.125;
                danmuDom.style.opacity = 1;
                danmuDom.style.textShadow = "rgb(0, 0, 0) 1px 0px 1px, rgb(0, 0, 0) 0px 1px 1px, rgb(0, 0, 0) 0px -1px 1px, rgb(0, 0, 0) -1px 0px 1px";
                if (typeof other !== 'undefine' && other) {
                    for (var i in other) {
                        if (danmuDom.style[i]) {
                            danmuDom.style[i] = other[i];
                        }
                    }
                }

                danmuDom.innerText = danmukuItem.danmu.content;
                danmuDom.style.left = this.$refs.danmuku.clientWidth;
                danmuDom.style.top = (danmukuItem.pos.line * _this.danmuItemHeight) + "px";
                //先添加才有宽度和高度
                this.$refs.danmuku.appendChild(danmuDom);
                danmukuItem.danmuDom = danmuDom;
                _this.addItemToArray(_this.danmuku, danmukuItem, danmukuItem.pos.line,
                    danmukuItem.pos.count);

                var maxWidth = parseFloat(this.$refs.danmuku.clientWidth + danmuDom.clientWidth);
                var time = 10;
                var speed = maxWidth / time;
                var timeFull = parseFloat(danmuDom.clientWidth / speed) * 1000;
                danmuDom.style.transition = "-webkit-transform " + time + "s linear 0s";
                danmuDom.style.transitionTimingFunction = "cubic-bezier(0, 0, 1, 1)!important";
                danmuDom.style.transform = "translateX(" + ( -maxWidth)
                    + "px) translateY(0px) translateZ(0px)";
                setTimeout(function () {
                    _this.whenFullShow(_this.danmuku, danmukuItem.pos.line, danmukuItem.pos.count);
                }, timeFull);

            },
            whenTransitionEnd: function (obj, line, count) {
                if (obj[line][count]) {
//                    obj[line][count].danmuDom.parentNode.removeChild(obj[line][count].danmuDom);
//                    obj[line][count].danmuDom = null;
//                    obj[line][count].danmu = null;
                }
            },
            whenFullShow: function (obj, line, count) {
                if (obj[line][count]) {
                    obj[line][count].isFullShow = true;
                }
            },
            addEventListenerWhenTransitionEnd: function (obj, line, count) {
                var _this = this;
                obj[line][count].danmuDom.addEventListener("transitionend", function () {
                    _this.whenTransitionEnd(obj, line, count)
                });
                obj[line][count].danmuDom.addEventListener("mozTransitionEnd", function () {
                    _this.whenTransitionEnd(obj, line, count)
                });
                obj[line][count].danmuDom.addEventListener("webkitTransitionEnd", function () {
                    _this.whenTransitionEnd(obj, line, count)
                });
                obj[line][count].danmuDom.addEventListener("oTransitionEnd", function () {
                    _this.whenTransitionEnd(obj, line, count)
                });
            },
            createListWelcomeItemDom: function (type, user) {
                if (user && user.uid && user.uid !== "-1") {
                    var item = {};
                    var messageListDom = this.$refs.messageList;
                    var rootDiv = document.createElement("div");
                    var level1Span1 = document.createElement("span");
                    var level1Span1_level2span1 = document.createElement("span");
                    var level1Span1_level2span2 = document.createElement("span");
                    var level1Span1_level2span3 = document.createElement("span");
                    rootDiv.className = "chat-item welcome-guard";
                    level1Span1_level2span1.className = "text v-middle";
                    level1Span1_level2span2.className = "username v-middle level-3";
                    level1Span1_level2span3.className = "text v-middle";
                    level1Span1_level2span1.innerText = "欢迎";
                    level1Span1_level2span2.innerText = " " + user.username + " ";
                    level1Span1_level2span3.innerText = "加入直播间";
                    level1Span1.appendChild(level1Span1_level2span1);
                    level1Span1.appendChild(level1Span1_level2span2);
                    level1Span1.appendChild(level1Span1_level2span3);
                    rootDiv.appendChild(level1Span1);
                    messageListDom.appendChild(rootDiv);
                    item.type = type;
                    item.user = user;
                    item.dom = rootDiv;
                    var len = this.messageList.push(item);
                    if (len >= this.messageMaxSize) {
                        messageListDom.removeChild(this.messageList[0].dom);
                        this.messageList.splice(0, 1);
                    }
                }

            },
            createListDanmuItemDom: function (type, danmu) {
                if (danmu && danmu.user && danmu.user.uid) {
                    var item = {};
                    var messageListDom = this.$refs.messageList;
                    var rootDiv = document.createElement("div");
                    var level1Span1 = document.createElement("span");
                    var level1Span2 = document.createElement("span");

                    rootDiv.className = "chat-item danmaku-item";
                    level1Span1.className = "user-name v-middle pointer open-menu";
                    level1Span2.className = "danmaku-content v-middle pointer ts-dot-2 open-menu";

                    level1Span1.innerText = danmu.user.username + " : ";
                    level1Span2.innerText = danmu.content;
                    rootDiv.appendChild(level1Span1);
                    rootDiv.appendChild(level1Span2);
                    messageListDom.appendChild(rootDiv);

                    item.type = type;
                    item.danmu = danmu;
                    item.dom = rootDiv;

                    var len = this.messageList.push(item);
                    if (len >= this.messageMaxSize) {
                        messageListDom.removeChild(this.messageList[0].dom);
                        this.messageList.splice(0, 1);
                    }
                }

            },
            createListManagerItemDom: function (type, giver) {
                if (giver && giver.user && giver.user.uid !== "-1") {

                    var item = {};
                    var messageListDom = this.$refs.messageList;

                    var rootDiv = document.createElement("div");
                    var level1i1 = document.createElement("i");
                    var level1Div2 = document.createElement("div");
                    var level1Div2_level2Span1 = document.createElement("span");
                    var level1Div2_level2Span1_level3Span1 = document.createElement("span");
                    var level1Div2_level2Span1_level3Span2 = document.createElement("span");

                    rootDiv.className = "chat-item system-msg border-box";
                    rootDiv.style.border = "1px solid rgb(255, 207, 164)";
                    rootDiv.style.background = "rgb(255, 233, 200)";
                    level1i1.className = "msg-icon bg-cover";
                    level1i1.role = "img";

                    var host = window.location.host + Store.root;
                    var img_src = giver.gift.img ? giver.gift.img : "/static/gift/礼物2x200.png";
                    level1i1.style.backgroundImage = "url(//" + host + img_src + ")";

                    level1Div2.className = "msg-content p-absolute";
                    level1Div2.style.color = "#EF903A";
                    level1Div2_level2Span1_level3Span1.className = "v-middle";
                    level1Div2_level2Span1_level3Span1.style.color = "#D54900";
                    level1Div2_level2Span1_level3Span2.className = "v-middle";
                    level1Div2_level2Span1_level3Span2.style.color = "#EF903A";

                    level1Div2_level2Span1_level3Span1.innerText = giver.user.username;
                    level1Div2_level2Span1_level3Span2.innerText = "在本房间购买了" + giver.gift.name + "x"
                        + giver.count;
                    level1Div2_level2Span1.appendChild(level1Div2_level2Span1_level3Span1);
                    level1Div2_level2Span1.appendChild(level1Div2_level2Span1_level3Span2);
                    level1Div2.appendChild(level1Div2_level2Span1);
                    rootDiv.appendChild(level1i1);
                    rootDiv.appendChild(level1Div2);
                    messageListDom.appendChild(rootDiv);
                    item.type = type;
                    item.giver = giver;
                    item.dom = rootDiv;

                    var len = this.messageList.push(item);
                    if (len >= this.messageMaxSize) {
                        messageListDom.removeChild(this.messageList[0].dom);
                        this.messageList.splice(0, 1);
                    }
                }
            },
            createListGiftItemDom: function (type, giver) {
                if (giver && giver.user && giver.user.uid && giver.user.uid !== "-1") {
                    var item = {};
                    var messageListDom = this.$refs.messageList;
                    var rootDiv = document.createElement("div");
                    var level1Span1 = document.createElement("span");
                    var level1Span2 = document.createElement("span");
                    var level1Div3 = document.createElement("div");
                    var level1Div3_level2Div1 = document.createElement("div");
                    var level1Span4 = document.createElement("span");
                    rootDiv.className = "chat-item gift-item";
                    level1Span1.className = "user-name v-bottom";
                    level1Span2.className = "action v-bottom";
                    level1Div3.className = "dp-i-block v-middle";
                    level1Span4.className = "gift-count v-bottom";
                    level1Div3_level2Div1.className = "gift-frame gift-xxxxx-01 bg-cover";


                    var host = window.location.host + Store.root;
                    var img_src = giver.gift.img ? giver.gift.img : "/static/gift/礼物x200.png";
                    level1Div3_level2Div1.style.backgroundImage = "url(//" + host + img_src + ")";

                    level1Div3_level2Div1.style.width = "40px";
                    level1Div3_level2Div1.style.height = "40px";
                    level1Span1.style.color = "#2196f3";
                    level1Span1.innerText = giver.user.username + " ";
                    level1Span2.innerText = "赠送" + giver.gift.name;
                    level1Span4.innerText = "x" + giver.count;
                    level1Div3.appendChild(level1Div3_level2Div1);
                    rootDiv.appendChild(level1Span1);
                    rootDiv.appendChild(level1Span2);
                    rootDiv.appendChild(level1Div3);
                    rootDiv.appendChild(level1Span4);
                    messageListDom.appendChild(rootDiv);
                    item.type = type;
                    item.giver = giver;
                    item.dom = rootDiv;

                    var len = this.messageList.push(item);
                    if (len >= this.messageMaxSize) {
                        messageListDom.removeChild(this.messageList[0].dom);
                        this.messageList.splice(0, 1);
                    }
                }
            },
            //收到消息，类型判断，生成DOM，加入list
            whenWebSocketMessage: function (message) {
                var _this = this;
                _this.peopleCount = message.count;
                _this.calcCount(message.count);
                if (message.type === Store.liveMessageType.welcome) {
                    this.createListWelcomeItemDom(message.type, message.user);
                    _this.scrollToEnd(_this.$refs.messageList);
                } else if (message.type === Store.liveMessageType.danmu) {
                    this.createListDanmuItemDom(message.type, message.barrage);
                    this.addDanmuShowInVideo(message.barrage, {color: 'white'});
                } else if (message.type === Store.liveMessageType.gift) {
                    this.createListGiftItemDom(message.type, message.giver);
                    _this.scrollToEnd(_this.$refs.messageList);
                } else if (message.type === Store.liveMessageType.manager) {
                    this.createListManagerItemDom(message.type, message.giver);
                    _this.scrollToEnd(_this.$refs.messageList);
                }
            },
            showGiftChoise: function (index) {
                var _this = this;
                if (_this.showGift && _this.showGift.lgid === _this.gifts.lgid) {
                } else {
                    _this.showGift = _this.gifts[index];
                    _this.showGift.count = 1;
                }
                _this.isShowGift = true;
            },
            calcCount: function (count) {
                this.$forceUpdate();
                if (count > 10000) {
                    if (count > 1000 * 10000) {
                        var dec = parseInt((count % 100000000) / 10000000);
                        var integer = parseInt(count / 100000000);
                        if (dec == 0) {
                            var string = integer + " 亿";
                            this.followCount = string;
                        } else {
                            var string = integer + "." + dec + " 亿";
                            this.followCount = string;
                        }
                    } else {
                        var dec = parseInt((count % 10000) / 1000);
                        var integer = parseInt(count / 10000);
                        var string = integer + "." + dec + " 万";
                        if (dec == 0) {
                            var string = integer + " 万";
                            this.followCount = string;
                        } else {
                            var string = integer + "." + dec + " 万";
                            this.followCount = string;
                        }
                    }
                } else {
                    this.followCount = count;
                }
            },
            scrollToEnd: function (dom) {
                this.$nextTick(function () {
                    dom.scrollTop = dom.scrollHeight;
                });
            },
            showController: function () {
                this.showControl = true;
            },
            hiddenController: function () {
                this.showControl = false;
            },
            addItemToArray: function (array, item, x, y) {
                if (!array[x]) {
                    array[x] = [];
                    array[x][y] = item;
                } else {
                    array[x][y] = item;
                }
            },
            orLive2D: function () {
                this.hiddenLive2D = !this.hiddenLive2D;
            },
            directLive2D: function (ev) {
                var _this = this;
                var dom = this.$refs.live2DManagerBox;
                var disX = ev.clientX - dom.offsetLeft - _this.live2DManagerBoxPosition.x;

                document.onmousemove = function (ev) {
                    var l = ev.clientX - disX;

                    l = l >= 0 ? l : 0;
                    l = l <= (parseInt(document.body.clientWidth) - parseInt(dom.offsetWidth)) ? l : (parseInt(document.body.clientWidth) - parseInt(dom.offsetWidth));
                    dom.style.transform = "translate(" + l + "px, 0px)";
                    _this.live2DManagerBoxPosition.x = l;
                };
                document.onmouseup = function () {
                    document.onmousemove = null;
                    document.onmouseup = null;
                };
            }
        }
    });
</script>

</html>
