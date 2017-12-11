<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>注册页面</title>
    <link rel="stylesheet" href="css/mdui.css"/>
    <link rel="stylesheet" href="css/ionicons.css"/>
    <link
            href="css/bootstrap.min.css"
            rel="stylesheet" type="text/css"/>
    <style type="text/css">
        <!--
        a:link {
            text-decoration: none;
        }

        a:visited {
            text-decoration: none;
        }

        a:hover {
            text-decoration: none;
        }

        a:active {
            text-decoration: none;
        }

        -->
    </style>
</head>
<body class="mdui-theme-primary-blue mdui-theme-accent-blue  mdui-color-grey-200"
      style="height:1000px">
<div class="mdui-appbar  mdui-appbar-fixed">
    <div class="mdui-toolbar mdui-color-theme">
        <a id="toggle" href="javascript:;" class="mdui-btn mdui-btn-icon">
            <i class="icon ion-ios-keypad-outline mdui-icon material-icons"></i>
        </a>
        <h3>注册账号 - ConnextSystem</h3>
        <div class="mdui-toolbar-spacer"></div>
        <div
                class="mdui-textfield mdui-textfield-expandable mdui-float-right">
            <button class="mdui-textfield-icon mdui-btn mdui-btn-icon">
                <i class="icon ion-ios-search mdui-icon material-icons"></i>
            </button>
            <input class="mdui-textfield-input" type="text" placeholder="Search"/>
            <button class="mdui-textfield-close mdui-btn mdui-btn-icon">
                <i class="icon ion-ios-search mdui-icon material-icons"></i>
            </button>
        </div>

        <a href="<%=basePath%>toLogin.do">已有账号去登录</a>
    </div>

</div>
<!-- <h1 style="color:red">ssadasdasfasfasas</h1> -->

<div class="col-md-2" style="margin-top: 100px"></div>
<div class="mdui-container mdui-color-grey-100 col-md-8" style="margin-top: 100px;height:800px;">
    <form action="<%=basePath%>userRegist.do" method="post">

        <div class="col-md-2" style="margin-top: 100px"></div>
        <div class="col-md-8" style="margin-top: 100px">
            <div class="mdui-textfield mdui-textfield-floating-label" id="userphone">
                <i class="icon ion-ios-telephone mdui-icon material-icons"></i>
                <label class="mdui-textfield-label">请输入手机号码</label>
                <input type="hidden" id="loginMessage1" value="${loginMessage1}"/>
                <input id="up" name="userphone" class="mdui-textfield-input"/>
            </div>
            <div class="mdui-textfield mdui-textfield-floating-label" id="username">
                <i class="icon ion-ios-person mdui-icon material-icons"></i>
                <label class="mdui-textfield-label">请输入用户名</label>
                <input id="un" name="username" class="mdui-textfield-input"/>
            </div>
            <div class="mdui-textfield mdui-textfield-floating-label">
                <i class="icon ion-ios-locked mdui-icon material-icons"></i> <label
                    class="mdui-textfield-label">请输入密码（大于四位）</label> <input
                    id="upw" class="mdui-textfield-input" type="password" name="userpassword"
            />
            </div>
            <div style="display:none " id="code">
                <div class="mdui-textfield mdui-textfield-floating-label">
                    <i class="mdui-icon material-icons">&#xe3b4;</i>
                    <label class="mdui-textfield-label">请输入图形验证码</label>
                    <input type="hidden" id="loginMessage3" value="${loginMessage3}"/>
                    <input id="ic" class="mdui-textfield-input" name="code" type="text"/>
                    <div class="mdui-textfield-error" id="error3"></div>
                </div>
                <div><img alt="验证码" id="scode" src="<%=basePath%>/getCode.do"><a href="#"
                                                                                 onclick="javascript:flushCode();">看不清?换一张图片</a><br>
                </div>
                <!-- <div class="mdui-divider-inset"></div> -->
            </div>

            <div>
                <div class="mdui-textfield mdui-textfield-floating-label col-md-5">
                    <i class="mdui-icon material-icons">textsms</i> <label
                        class="mdui-textfield-label">请输入验证码</label> <input
                        id="pc" class="mdui-textfield-input" name="phonecode"
                />
                </div>
                <br>
                <div class="col-md-7">
                    <input id="phonecode" type="button" value="&nbsp;获取验证码"
                           class="mdui-ripple mdui-btn mdui-btn-block mdui-color-blue mdui-ripple"/>
                </div>
            </div>

            <button id="regist" class="mdui-btn mdui-btn-block mdui-color-blue mdui-ripple" disabled>
                <i class="icon ion-ios-paperplane-outline mdui-icon material-icons"></i>&nbsp;确认注册
            </button>

            <label class="mdui-checkbox"> <input type="checkbox" id="agree"/>
                <i class="mdui-checkbox-icon"></i> 我已阅读并同意<a href="#">《用户注册许可及服务协议》</a>
            </label>
        </div>
    </form>

</div>
<div class="col-md-2" style="margin-top: 100px"></div>
</body>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/mdui.js" type="text/javascript"></script>
<script src="js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
    //欢迎提示
    mdui.snackbar({
        message: '欢迎注册账号！',
        position: 'top'
    });
    $('#up').focus();
    //手机号码离焦事件，先判断是否符合正确的手机号码格式，再判断是否已经存在
    $('#up').blur(function () {
        var myreg1 = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
        var myreg2 = /(1[3-9]\d{9}$)/;
        if (!myreg2.test($('#up').val())) {
            mdui.snackbar({
                message: '手机号格式不正确！',
                position: 'top'
            });
            //$("#moileMsg").html("<font color='red'>手机号码格式不正确！请重新输入！</font>");
            $('#up').focus();
        } else {
            $.post("<%=basePath%>userphoneExist.do",
                    {
                        userphone: $('#up').val(),
                    },
                    function (data, status) {
                        if (data == 'true') {
                            alert("该会员已存在！");
                            mdui.snackbar({
                                message: '手机号已存在！',
                                position: 'top'
                            });
                            $('#up').focus();
                        } else if (data == 'false') {
                            mdui.snackbar({
                                message: '可以注册！',
                                position: 'top'
                            });
                            $error1.text("");
                            $textfield.removeClass('mdui-textfield-invalid');
                            $("#regist").removeAttr("disabled");
                        }
                    });
        }
    });
    //点击获取验证码事件 phonecode
    var countdown = 60;
    function settime(obj) {
        if (countdown == 0) {
            obj.removeAttr("disabled");
            obj.val("免费获取验证码");
            countdown = 60;
            return;
        } else {
            obj.attr("disabled", "true");
            obj.val("重新发送(" + countdown + ")");
            countdown--;
        }
        setTimeout(function () {
                    settime(obj)
                }
                , 1000)
    }
    var myreg3 = /(1[3-9]\d{9}$)/;

    $('#phonecode').click(function () {
        if (myreg3.test($('#up').val())) {
            $.post("<%=basePath%>phonecodeCreate.do",
                    {
                        userphone: $('#up').val(),
                    },
                    function (data, status) {
                        if (data == 'true') {
                            mdui.snackbar({
                                message: '验证码已发送至您你手机上，请注意查收！',
                                position: 'top'
                            });
                            var obj = $("#phonecode");
                            settime(obj);
                        } else if (data == 'false') {
                            mdui.snackbar({
                                message: '发送失败！',
                                position: 'top'
                            });
                        }
                    });
        } else {
            mdui.snackbar({
                message: '请检查你的手机号！',
                position: 'top'
            });
        }
    });
    //手机验证码离焦事件，判断是否正确
    $('#pc').blur(function () {
        if ($('#pc').val().length > 0) {
            $.post("<%=basePath%>phonecodeCheck.do",
                    {
                        phonecode: $('#pc').val(),
                    },
                    function (data, status) {
                        if (data == 'true') {
                            mdui.snackbar({
                                message: '手机验证码正确！',
                                position: 'top'
                            });

                        } else if (data == 'false') {
                            alert("验证码错误！！");
                            mdui.snackbar({
                                message: '手机验证码错误！请先输对图形验证码！',
                                position: 'top'
                            });
                            //此处将图形验证码显示出来，并且将获取验证码的按钮disabled
                            $("#code").show();
                            $("#phonecode").attr("disabled", "true");
                            $('#ic').focus();
                        }
                    });
        }
    });
    //图形验证码离焦事件，判断是否正确
    $('#ic').blur(function () {
        if ($('#ic').val().length > 0) {
            $.post("<%=basePath%>imagecodeCheck.do",
                    {
                        imagecode: $('#ic').val(),
                    },
                    function (data, status) {
                        if (data == 'true') {
                            mdui.snackbar({
                                message: '请重新获取手机验证码',
                                position: 'top'
                            });
                            $("#phonecode").removeAttr("disabled");
                        } else if (data == 'false') {
                            alert("图形验证码错误！！");
                            mdui.snackbar({
                                message: '图形验证码错误！！',
                                position: 'top'
                            });
                            $('#ic').focus();
                        }
                    });
        }
    });
    //密码离焦事件，判断是否大于四位数
    $('#upw').blur(function () {
        if ($('#upw').val().length < 5) {
            alert("密码不能小于四位！");
            $('#upw').focus();
        }
    });
    //每次刷新的时候获取当前时间，防止浏览器缓存刷新失败
    function flushCode() {
        var time = new Date();
        document.getElementById("scode").src = "<%=basePath%>getCode.do?time=" + time;
    }
    //点击我同意复选框事件，取消勾选则将按钮置为不可点击
    $('#agree').click(function () {
        if ($('#agree').prop('checked')) {
            $("#regist").removeAttr("disabled");
        } else {
            $("#regist").attr("disabled", "true");
        }
    });
</script>

</html>