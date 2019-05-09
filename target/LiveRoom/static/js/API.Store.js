var Store = function () {};
Store.root = "/client";
Store.urlSuffix = ".do";
Store.getUserBySession = function () {
    var _this = this;
    if (typeof jQuery !== 'undefined' && jQuery) {
        return $.ajax({
            url: _this.root + "/user/get/random" + _this.urlSuffix,
            type: "POST",
            async: false,
            data: {},
            dataType: "json",
            success: function (data) {
                return data;
            },
            error: function (e) {
                return e;
            }
        })
    } else {

    }
};
Store.getLiveRoomByURL = function () {
    var _this = this;
    if (typeof jQuery !== 'undefined' && jQuery) {
        return $.ajax({
            url: window.location.href,
            type: "POST",
            async: false,
            data: {},
            dataType: "json",
            success: function (data) {
                return data;
            },
            error: function (e) {
                return e;
            }
        })
    } else {

    }
};
Store.getAjaxData = function (url, data, type) {
    var _this = this;
    if (typeof jQuery !== 'undefined' && jQuery) {
        //存在且不符合动词  或  不存在
        if ((typeof type === 'undefined' || !type) ||
            ( (typeof type !== 'undefined' || type) &&
                type.toLowerCase() !== "post" &&
                type.toLowerCase() !== "get" &&
                type.toLowerCase() !== "put" &&
                type.toLowerCase() !== "head" &&
                type.toLowerCase() !== "delete")) {
            type = "post";
        }
        return $.ajax({
            url: _this.root + url + _this.urlSuffix,
            type: type,
            async: false,
            data: data,
            dataType: "json",
            success: function (data) {
                return data;
            },
            error: function (e) {
                return e;
            }
        })
    } else {

    }
};
Store.liveMessageType = {
    danmu: "DANMU",
    welcome: "WELCOME",
    gift: "GIFT",
    manager: "MANAGER",
    system: "SYSTEM"
};
Store.errorPage = Store.root + "/live/error.do";