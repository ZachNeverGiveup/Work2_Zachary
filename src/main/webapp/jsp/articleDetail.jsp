<%@ page import="com.connext.pojo.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.connext.pojo.Article" %>
<%@ page import="com.connext.pojo.Admin" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page isELIgnored="false" %>
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
    <title>${article.articletitle}</title>
    <link rel="stylesheet" href="/css/mdui.css"><link rel="stylesheet" href="css/ionicons.css"/>
    <link
            href="/css/bootstrap.min.css"
            rel="stylesheet" type="text/css" />
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
      style="height:auto">
<div class="mdui-appbar  mdui-appbar-fixed">
    <div class="mdui-toolbar mdui-color-theme">
        <a id="toggle" href="javascript:;" class="mdui-btn mdui-btn-icon"><i
                class="icon ion-ios-glasses-outline mdui-icon material-icons"></i></a>
        <h3>联蔚论坛--${article.articletitle}</h3>
        <div class="mdui-toolbar-spacer"></div>

        <h4>欢迎回来，<% User user=(User)session.getAttribute("user"); %>
        <%=user.getUsername() %></h4>
    </div>

</div>
<div class="col-md-1" style="margin-top: 100px"></div>
<div class="mdui-container mdui-color-grey-50 col-md-10" style="margin-top: 100px;height:auto">
        <a href="<%=basePath%>toAdd.do">
            <button id="ma"
                    class="mdui-fab mdui-fab-fixed  mdui-ripple" >
                <i class="icon ion-ios-plus-empty mdui-icon material-icons"></i>
            </button>
        </a>
    <div class="col-md-2" style="margin-top: 100px"></div>
    <div class="col-md-8" style="margin-top: 100px">
        <div class="mdui-chip">
            <span class="mdui-chip-icon mdui-color-blue"><i class="icon ion-ios-person mdui-icon  material-icons"></i></span>
            <span class="mdui-chip-title">作者：${article.user.username}</span>
        </div>
        <div class="mdui-chip">
            <span class="mdui-chip-icon mdui-color-blue"><i class="icon ion-ios-clock-outline mdui-icon  material-icons"></i></span>
            <span class="mdui-chip-title">发表时间：<fmt:formatDate value="${article.articleaddtime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
        </div>
        <div style="font-size:24px;font-weight:300">
           &nbsp;&nbsp; ${article.articlecontent}
        </div>
    </div>

    <div class="mdui-divider-inset"></div>
    <div class="mdui-panel mdui-panel-popout col-md-8" mdui-panel>

        <div class="mdui-panel-item  mdui-panel-item-open  mdui-color-blue-grey-50">
            <div class="mdui-panel-item-header"><i class="icon ion-ios-chatbubble-outline mdui-icon  material-icons"></i><p style="font-size:18px;font-weight:100">文章评论</p></div>
            <div class="mdui-panel-item-body">
                <div class="mdui-textfield">
                    <i class="icon ion-ios-chatboxes-outline mdui-icon  material-icons"></i>
                    <label class="mdui-textfield-label">发表你的评论</label>
                    <textarea class="mdui-textfield-input" type="text" maxlength="40"></textarea>
                </div>
                <button class="mdui-btn mdui-color-theme-accent  mdui-ripple"><i class="icon ion-ios-paperplane-outline mdui-icon  material-icons"></i>提交</button>
                <c:forEach items="${comments}" var="comment">
                    <div class="mdui-panel-item  mdui-panel-item-open  mdui-color-blue-grey-100">
                        <div class="mdui-panel-item-header">
                            <div class="mdui-chip">
                                <span class="mdui-chip-icon mdui-color-blue"><i class="icon ion-ios-chatboxes-outline mdui-icon  material-icons"></i></span>
                                <span class="mdui-chip-title">联蔚科技用户：${comment.user.username}于<fmt:formatDate value="${comment.commenttime}" pattern="yyyy-MM-dd HH:mm:ss"/>发表</span>
                            </div>
                        </div>
                        <div class="mdui-panel-item-body">
                            <p>${comment.commentcontent}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<div class="col-md-2" style="margin-top: 100px"></div>

<div class="col-md-1" style="margin-top: 100px"></div>


</body>
<script src="<%=basePath%>js/bootstrap.min.js"
        type="text/javascript"></script>
<script src="<%=basePath%>js/mdui.js"></script>
<script src="<%=basePath%>js/jquery.min.js"></script>
<script type="text/javascript">
    //欢迎提示
    mdui.snackbar({
        message: '文章详情页！',
        position: 'top'
    });
    //删除消息
    function delAd(id,_this) {
        var _this=$(_this);
        new mdui.Dialog('#dialog').open();
        $('#dc').click(function () {
            $.post("<%=basePath%>msgDel.do",
                    {
                        msgid:id,
                    },
                    function(data,status){
                        mdui.snackbar({
                            message: '删除成功！',
                            position: 'top'
                        });
                        console.log($(this).parents(".mdui-table-row-selected"));
                        _this.parents(".mdui-table-row-selected").remove();
                    });
        });
    }
    //查看消息
    function formatDate(now)
    {
        var year=now.getYear()+1900;
        var month=now.getMonth()+1;
        var date=now.getDate();
        var hour=now.getHours();
        var minute=now.getMinutes();
        var second=now.getSeconds();
        return year+"年"+month+"月"+date+"日  "+hour+":"+minute+":"+second;
    }

    function moreMsg(id,_this) {
        var _this=$(_this);

        $.post("<%=basePath%>msgMore.do",
                {
                    msgid:id,
                },
                function(data,status){
                    new mdui.Dialog('#dialog2').open();
                    $("#messageTitle").text(data.msgtitle);
                    $("#messageContent").text(data.msgcontent);
                    var d=new Date(data.msgdate);
                    $("#messageDate").text(formatDate(d));
                });
    }
</script>
</html>