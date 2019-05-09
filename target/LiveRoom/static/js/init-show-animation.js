var colors = [
    "254,67,101", "252,157,154", "249,205,173", "217,166,43",
    "200,200,169", "131,175,155", "0,49,79", "133,150,159",
    "137,190,178", "101,147,74", "255,150,128", "0,34,40",
    "78,29,76", "245,228,200", "119,52,96", "85,170,173"
];
var InitShowAnimation = function (room, roomColor, $after) {
    var _this = this;
    // console.log("动画初始化");
    _this.init(room, roomColor);
    _this.$after = $after;
    _this.$after.fadeOut(0);
};
InitShowAnimation.prototype.init = function (room, roomColor) {
    var _this = this;
    this.strTmp = "",
        this.roomName = room.roomName,
        this.roomBy = room.user.username,
        this.roomColor = roomColor,
        this.browserHeight = document.documentElement.clientHeight,
        this.browserWidth = document.documentElement.clientWidth;
    this.initNowLoading = {
        parent: _this,
        This: $("#init-show-box"),
        initShowBgGrid: $("#init-show-bg-grid"),
        initShowBgGridBox: $("#init-show-bg-grid-box"),
        initShowHLine: $("#init-show-h-line"),
        initShowVLine: $("#init-show-v-line"),
        initShowMask: $("#init-show-mask"),
        initShowMaskSquare: $("#init-show-mask-shape"),
        initShowSquareSmall: $("#init-show-square-small"),
        initShowSquareSmallChild: $("#init-show-square-small-child"),
        initShowSquareSmallChildPath: $(".init-show-square-small-child-path"),
        initShowFontHolder: $("#init-show-font-holder"),
        initShowFontHeadFather: $("#init-show-font-head-father"),
        initShowFontFootFather: $("#init-show-font-foot-father"),
        initShowFontHead: $("#init-show-font-head"),
        initShowFontFoot: $("#init-show-font-foot"),
        resize: function (e) {
            var a = 75;
            var browserHeight = this.parent.browserHeight;
            var browserWidth = this.parent.browserWidth;
            var t = .6666666666666667 * browserHeight;
            this.initShowSquareSmall.css({
                transition: "",
                height: t,
                width: t,
                clipPath: strTmp = e ? "polygon(-" + browserWidth + "px 0,0 0,-"
                    + (browserWidth - .4375 * browserWidth) + "px "
                    + browserHeight + "px,-" + browserWidth + "px "
                    + browserHeight + "px)" : "polygon(0 0," + browserWidth + "px 0,"
                    + .4375 * browserWidth + "px " + browserHeight + "px,0 "
                    + browserHeight + "px)",
                WebkitClipPath: strTmp
            });
            t *= .675;
            this.initShowSquareSmallChild.css({
                height: t,
                width: t,
                fontSize: t + "px",
                lineHeight: t + "px"
            });
            t = 1 < (t = browserWidth / 1920) ? 1 : t < .5 ? .5 : t,
                this.initShowFontHead.css("maxWidth", (browserWidth - 98 - 100 - 48) / t),
                this.initShowFontFoot.css("maxWidth", (browserWidth - 98 - 100 - 48) / t),
                this.initShowFontHolder.css({
                    bottom: .3944444444444444 * browserHeight - 85,
                    width: Math.max(this.initShowFontHead.outerWidth(),
                        this.initShowFontFoot.outerWidth()) + 48,
                    transform: "scale(" + t + ")"
                }),
                this.initShowFontHeadFather.css("width", this.initShowFontHead.outerWidth()),
                this.initShowFontFootFather.css("width", this.initShowFontFoot.outerWidth()),
                this.initShowHLine.css("bottom", .3944444444444444 * browserHeight),
                this.initShowBgGrid.css("backgroundPosition", "-" + ("26") + "px "
                    + (browserHeight - .3944444444444444 * browserHeight - 1) % a + "px"),
                this.initShowBgGridBox.css({
                    top: -1 * (t = a - (browserHeight - .3944444444444444
                        * browserHeight - 1) % a),
                    height: (t += browserHeight) + (t % a == 0 ? 0 : a - t % a),
                    width: (t = 26 + browserWidth) + (t % a == 0 ? 0 : a - t % a)
                }),
                this.initShowMaskSquare.attr("points", "0 0," + browserWidth + " 0,"
                    + .4375 * browserWidth + " " + browserHeight + ",0 " + browserHeight),
                this.initShowMaskSquare.css({
                    fill: "#fff"
                })

        },
        nowLoadingStop: function () {
            var _this = this;
            // console.log("动画停止1");
            var browserHeight = _this.parent.browserHeight;
            var browserWidth = _this.parent.browserWidth;
            var a = 75;
            setTimeout(function () {
                console.log("动画停止2");
                _this.initShowSquareSmall.css({
                    transition: "clip-path 1s,-webkit-clip-path 1s",
                    clipPath: strTmp = "polygon(-" + browserWidth + "px 0,0 0,-" + (browserWidth
                        - .4375 * browserWidth) + "px " + browserHeight + "px,-" + browserWidth
                        + "px " + browserHeight + "px)",
                    WebkitClipPath: strTmp
                }).stop().fadeOut(1e3),
                    _this.initShowMask.css({
                        transition: "left 1s",
                        left: "-100%"
                    }),
                    _this.initShowFontFootFather.css({
                        transition: "height 1s",
                        height: 0
                    }),
                    _this.initShowFontHeadFather.css({
                        transition: "height 1s",
                        height: 0
                    }),
                    _this.initShowVLine.css({
                        transition: "height 1s",
                        height: 0
                    }),
                    _this.initShowHLine.css({
                        left: "auto",
                        right: 0,
                        transition: "width 1s",
                        width: 0
                    }),
                    _this.initShowBgGrid.parent().css({
                        opacity: "0",
                        pointerEvent: "none"
                    })
            }, 1)
        },
        removeThis: function () {
            console.log("动画元素删除1");
            var a = 75;
            var _this = this;
            var browserHeight = _this.parent.browserHeight;
            var browserWidth = _this.parent.browserWidth;
            _this.initShowBgGrid.parent().stop().delay(500).fadeOut(500,
                function () {
                    console.log("动画元素删除2");
                    _this.This.remove();
                    _this.parent.$after.stop().fadeIn();
                }
            );
        }
    };
    onload = function () {
        // _this.loadIsDone();
        // _this.nowLoading();
    };
    onresize = function () {
        _this.browserHeight = document.documentElement.clientHeight,
            _this.browserWidth = document.documentElement.clientWidth,
        _this.initNowLoading && _this.initNowLoading.resize()
    };
    // console.log("动画初始化完成")
};
InitShowAnimation.prototype.nowLoading = function () {
    var a = 75;
    // console.log("动画开始");
    var strTmp = this.strTmp;
    var roomColor = this.roomColor;
    var roomName = this.roomName;
    var roomBy = this.roomBy;
    var browserHeight = this.browserHeight;
    var browserWidth = this.browserWidth;
    var _this = this;

    var e = "rgb(" + roomColor + ")";
    // console.log(_this.initNowLoading.initShowFontHead)
    _this.initNowLoading.initShowFontHead.css("color", e),
        _this.initNowLoading.initShowBgGrid.parent().css("opacity", "1"),
        _this.initNowLoading.initShowFontFoot.css("color", e),
        _this.initNowLoading.initShowHLine.css("background", e),
        _this.initNowLoading.initShowVLine.css("background", e),
        _this.initNowLoading.initShowSquareSmall.css("background", "rgba(" + roomColor
            + ",0.163)"),
        _this.initNowLoading.initShowSquareSmallChildPath.css({
            fill: "rgba(" + roomColor + ",0.2)"
        });
    var t = roomName || "";
    strTmp = roomName;
    _this.initNowLoading.initShowFontHead.html(t),
        _this.initNowLoading.initShowFontFoot.html(roomBy),
        _this.initNowLoading.initShowBgGridBox.css("left", "-26px"),
        _this.initNowLoading.resize(1),
        _this.initNowLoading.initShowHLine.css("width", "100%"),
        _this.initNowLoading.initShowVLine.css("height", "100%"),
        _this.initNowLoading.initShowFontHeadFather.css("height", 85),
        _this.initNowLoading.initShowFontFootFather.css("height", 37),
        _this.initNowLoading.initShowMask.css("left", 0),
        _this.initNowLoading.initShowSquareSmall.stop().fadeIn(1e3).css({
            transition: "clip-path 1s,-webkit-clip-path 1s",
            clipPath: strTmp = "polygon(0 0," + browserWidth + "px 0," + .4375 * browserWidth
                + "px " + browserHeight + "px,0 " + browserHeight + "px)",
            WebkitClipPath: strTmp
        });
    for (var o = "", r = 5, i = "init-show-bg-grid-blink-square",
             s = 0, l = 2 * r; s < l; ++s) {
        for (var n = 0, d = 2 * r; n < d; ++n) {
            Math.random() < .2 && (o += '<div class=">' + i +
                    '" style="background-color:rgb(' + roomColor + ');'
                    + (n < r ? 'top:' + n * a : 'bottom:' + (d - n - 1) * a) + 'px;'
                    + (s < r ? 'left:' + s * a : 'right:' + (l - s - 1) * a) + 'px;'
                    + '"></div>'
            );
        }
    }
    _this.initNowLoading.initShowBgGridBox.html(o).children("div").each(function (e, t) {
        setTimeout(function () {
            t.setAttribute("class", i
                + " init-show-bg-grid-blink-square-animation")
        }, 1e3 * Math.random())
    });
};
InitShowAnimation.prototype.loadIsDone = function () {
    var _this = this;
    _this.initNowLoading ? _this.initNowLoading.nowLoadingStop()
        : _this.nowLoadingStopNotRun = 1,
        onresize = function () {
            _this.browserHeight = document.documentElement.clientHeight,
                _this.browserWidth = document.documentElement.clientWidth,
            _this.initNowLoading && _this.initNowLoading.resize()
        }
};
InitShowAnimation.prototype.panelNoAnimate = function (e, r, a, s, l, o, t, i) {
    switch (e) {
        case 2:
            r ? setTimeout(function () {
                    s.css({
                        opacity: 1,
                        transform: ""
                    })
                },
                0) : s.css({
                opacity: 0,
                transform: "scale(0.8)"
            }),
                setTimeout(a, 500);
            break;
    }
};

function randomColor() {
    var index = Math.floor(Math.random() * colors.length);
    var max = 255;//1.1
    var minStep = Math.floor(max / (Math.random() * 6 + 1.588888888)) + 20;
    var maxStep = 255 - Math.floor(max / (Math.random() * 6 + 1.588888888)) - 20;
    var r = Math.floor(Math.random() * maxStep + minStep);
    var g = Math.floor(Math.random() * maxStep + minStep);
    var b = Math.floor(Math.random() * maxStep + minStep);
    return colors[index];
}