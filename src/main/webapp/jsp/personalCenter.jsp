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
    <title>个人中心</title>
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
      style="height:1000px">
<div class="mdui-appbar  mdui-appbar-fixed">
    <div class="mdui-toolbar mdui-color-theme">
        <a id="toggle" href="javascript:;" class="mdui-btn mdui-btn-icon"><i
                class="icon ion-ios-glasses-outline mdui-icon material-icons"></i></a>
        <h3>个人中心  - ConnextSystem</h3>
        <div class="mdui-toolbar-spacer"></div>
        <%--<div
                class="mdui-textfield mdui-textfield-expandable mdui-float-right">
            <button class="mdui-textfield-icon mdui-btn mdui-btn-icon">
                <i class="mdui-icon material-icons">search</i>
            </button>
            <input class="mdui-textfield-input" type="text" placeholder="Search" />
            <button class="mdui-textfield-close mdui-btn mdui-btn-icon">
                <i class="mdui-icon material-icons">close</i>
            </button>
        </div>--%>
        <h4>欢迎回来，
            <% User user=(User)session.getAttribute("user"); %>
            <c:if test="${user.usergrade==0}">普通用户</c:if>
            <c:if test="${user.usergrade==1}">会员用户</c:if>
            <c:if test="${user.usergrade==2}">尊贵会员</c:if>
            <c:if test="${user.usergrade==3}">超级会员</c:if>
            <c:if test="${user.usergrade>3}">超级管理员</c:if>
            <%=user.getUsername() %>
        </h4>
    </div>

</div>
<div class="col-md-1" style="margin-top: 100px"></div>
<img src="/img/logo.jpg" alt="">
<div class="mdui-container mdui-color-grey-50 col-md-10" style="margin-top: 100px;height:800px;">
       <%-- <a href="<%=basePath%>toAdd.do">
            <button id="ma"
                    class="mdui-fab mdui-fab-fixed  mdui-ripple" >
                <i class="icon ion-ios-plus-empty mdui-icon material-icons"></i>
            </button>
        </a>--%>
    <div class="col-md-8 mdui-typo" style="margin-top: 100px">
        <table class="mdui-table mdui-table-hoverable">
            <thead>
            <tr>
                <th style="white-space: nowrap; text-align:center">文章标题</th>
                <th style=" white-space: nowrap; text-align:center" class="mdui-table-col-numeric">发表时间</th>
                <th style=" text-align:center" class="mdui-table-col-numeric">评论数</th>
                <th style=" white-space: nowrap; text-align:center" class="mdui-table-col-numeric">最后评论时间</th>
                <th style=" white-space: nowrap; text-align:center" class="mdui-table-col-numeric">编辑</th>
                <th style="white-space: nowrap; text-align:center" class="mdui-table-col-numeric">删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${articles}" var="article">
                <tr class="mdui-table-row-selected">
                    <td style="width:100px; white-space: nowrap; text-align:center"  mdui-tooltip="{content: '点击查看详情'}"><a href="<%=basePath%>articleDetail.do?id=${article.articleid}">${article.articletitle}</a></td>
                    <td class="msgdate" style="width:100px; white-space: nowrap; text-align:center" mdui-tooltip="{content: '这篇文章的发表时间'}"><fmt:formatDate value="${article.articleaddtime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td style="width: 10px;  text-align:center"  mdui-tooltip="{content: '这篇文章的评论数'}">${article.articlecommentnum}</td>
                    <td class="msgdate" style="width:100px; white-space: nowrap; text-align:center" mdui-tooltip="{content: '最后评论时间'}"><fmt:formatDate value="${article.articlelastcommenttime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <%--<td style="white-space: nowrap"  mdui-tooltip="{content: '点击按钮查看该消息详情'}">
                        <button id="mm"
                                class="mdui-fab mdui-fab-fixed  mdui-ripple"
                                onclick="moreMsg(${msg.msgid},this)">
                            查看详情
                        </button>
                    </td>--%>
                        <td style="white-space: nowrap" mdui-tooltip="{content: '点击按钮对该消息进行编辑'}">
                                <button id="me"
                                        class="mdui-btn mdui-color-green mdui-ripple"
                                        onclick="toEditArticle(${article.articleid})">
                                    编辑
                                </button>
                        </td>
                        <td style="white-space: nowrap;  "  mdui-tooltip="{content: '点击按钮删除该消息'}">
                            <button id="md"
                                    class="mdui-btn mdui-color-red mdui-ripple"
                                    onclick="delAd(${article.articleid},this)">
                                删除
                            </button>
                        </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>


    </div>
           <div class="mdui-progress">
               <div class="mdui-progress-indeterminate"></div>
           </div>
</div>
<div class="col-md-2" style="margin-top: 100px"></div>


<div class="mdui-dialog" id="dialog">
    <div class="mdui-dialog-title">你确定要删除吗?</div>
    <div class="mdui-dialog-content">你将会失去这条消息的所有信息！</div>
    <div class="mdui-dialog-actions">
        <button class="mdui-btn mdui-ripple" mdui-dialog-cancel>算了</button>
        <button id="dc" class="mdui-btn mdui-ripple mdui-color-blue" mdui-dialog-confirm>确定</button>
    </div>
</div>
<div class="mdui-dialog" id="dialog2">
    <div class="mdui-dialog-title">
        <h1 class="mdui-text-color-blue"  style="text-align: middle" id="messageTitle"></h1>
        <h4 class="mdui-text-color-grey"  style="text-align: middle" id="messageDate"></h4>
    </div>
    <div class="mdui-dialog-content"><h2 class="mdui-text-color-black"  id="messageContent"></h2></div>
    <div class="mdui-dialog-actions">
        <button class="mdui-btn mdui-ripple" mdui-dialog-cancel>关闭</button>
    </div>
</div>
<div class="mdui-fab-wrapper" id="fab"  mdui-fab="{trigger: 'hover'}">
    <button class="mdui-fab mdui-ripple mdui-color-theme">
        <!-- 默认显示的图标 ion-ios-plus-empty-->
        <i class="icon ion-ios-plus-empty mdui-icon material-icons"></i>

        <!-- 在拨号菜单开始打开时，平滑切换到该图标，若不需要切换图标，则可以省略该元素 -->
        <i class="icon ion-ios-color-filter-outline mdui-icon material-icons mdui-fab-opened "></i>
    </button>
    <div class="mdui-fab-dial">
        <c:if test="${user.usergrade>9}">
            <a href="<%=basePath%>toManageUser.do">
                <button id="userManage" class="mdui-fab mdui-fab-mini mdui-ripple mdui-color-light-green  " mdui-tooltip="{content: '会员管理', position: 'left'}"><i class="icon ion-person-stalker" aria-hidden="true"></i></button>
            </a>
        </c:if>
        <a href="<%=basePath%>toAddArticle.do">
            <button id="addArticle" class="mdui-fab mdui-fab-mini mdui-ripple mdui-color-pink " mdui-tooltip="{content: '写新文章', position: 'left'}"><i class="icon ion-ios-compose-outline" aria-hidden="true"></i></button>
        </a>
        <a href="<%=basePath%>toArticleByUserId.do">
            <button  class="mdui-fab mdui-fab-mini mdui-ripple mdui-color-red" mdui-tooltip="{content: '个人中心', position: 'left'}"><i class="icon ion-ios-person-outline mdui-icon material-icons"></i></button>
        </a>
        <a href="<%=basePath%>toArticleCenter.do?pageNow=1">
            <button class="mdui-fab mdui-fab-mini mdui-ripple mdui-color-blue" mdui-tooltip="{content: '回到首页', position: 'left'}"><i class="icon ion-ios-undo-outline mdui-icon mdui-fab-opened material-icons"></i></button>
        </a>
    </div>
</div>
</body>
<script src="<%=basePath%>js/bootstrap.min.js"
        type="text/javascript"></script>
<script src="<%=basePath%>js/mdui.js"></script>
<script src="<%=basePath%>js/jquery.min.js"></script>
<script type="text/javascript">
    //欢迎提示
    mdui.snackbar({
        message: '欢迎进入个人中心！',
        position: 'top'
    });
    //编辑文章按钮
   function toEditArticle(id){
       var idAfter=id*271343;
       window.location='toEditArticle.do?articleid='+idAfter;
    }
    //删除新闻
    function delAd(id,_this) {
        var _this=$(_this);
        new mdui.Dialog('#dialog').open();
        $('#dc').click(function () {
            $.post("<%=basePath%>articleDel.do",
                    {
                        articleid:id,
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