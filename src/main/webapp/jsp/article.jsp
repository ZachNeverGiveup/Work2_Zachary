<%@ page import="com.connext.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.connext.model.Article" %>
<%@ page import="com.connext.model.Admin" %>
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
    <title>论坛首页</title>
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
        <a id="toggle" href="<%=basePath%>toLogin.do" class="mdui-btn mdui-btn-icon"  mdui-tooltip="{content: '重新登录'}"><i
                class="icon ion-ios-glasses-outline mdui-icon material-icons"></i></a>
        <h3>论坛首页  - ConnextSystem</h3>
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
<div class="mdui-container mdui-color-grey-50 col-md-11" style="margin-top: 70px;margin-bottom:100px;height:auto">
       <%-- <a href="<%=basePath%>toAdd.do">
            <button id="ma"
                    class="mdui-fab mdui-fab-fixed  mdui-ripple" >
                <i class="icon ion-ios-plus-empty mdui-icon material-icons"></i>
            </button>
        </a>--%>
    <div class="col-md-12 mdui-typo" style="margin-top: 100px">
        <table class="mdui-table mdui-table-hoverable">
            <thead>
            <tr>
                <th style="white-space: nowrap; text-align:center">文章标题</th>
                <th style="white-space: nowrap; text-align:center">作者</th>
                <th style=" white-space: nowrap; text-align:center" class="mdui-table-col-numeric">发表时间</th>
                <th style=" white-space: nowrap; text-align:center" class="mdui-table-col-numeric">评论数</th>
                <th style=" white-space: nowrap; text-align:center" class="mdui-table-col-numeric">最后评论时间</th>
                <c:if test="${user.usergrade==1||user.usergrade>=3}">
                    <th style=" white-space: nowrap; text-align:center" class="mdui-table-col-numeric">编辑</th>
                </c:if>
                <c:if test="${user.usergrade==2||user.usergrade>=3}">
                    <th style="white-space: nowrap; text-align:center" class="mdui-table-col-numeric">删除</th>
                </c:if>
            </tr>
            </thead>
            <tbody>
            <% List<Article> articles= (List<Article>) request.getAttribute("arts");
                Admin admin = (Admin) session.getAttribute("admin");
            %>
            <c:forEach items="<%=articles%>" var="article">
                <tr class="mdui-table-row-selected">
                    <td style="width:100px; white-space: nowrap; text-align:center"  mdui-tooltip="{content: '点击查看详情'}">
                        <c:if test="${article.articlecommentnum>5}">
                            <i class="icon ion-fireball mdui-text-color-red"></i>
                        </c:if>
                        <a href="<%=basePath%>articleDetail.do?id=${article.articleid}">${article.articletitle}</a>
                    </td>
                    <td style="width:100px; white-space: nowrap; text-align:center"  mdui-tooltip="{content: '这篇文章的作者'}">${article.user.username}</td>
                    <td class="msgdate" style="width:100px; white-space: nowrap; text-align:center" mdui-tooltip="{content: '这篇文章的发表时间'}"><fmt:formatDate value="${article.articleaddtime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td style="width:100px; white-space: nowrap; text-align:center"  mdui-tooltip="{content: '这篇文章的评论数'}">${article.articlecommentnum}</td>
                    <td class="msgdate" style="width:100px; white-space: nowrap; text-align:center" mdui-tooltip="{content: '最后评论时间'}"><fmt:formatDate value="${article.articlelastcommenttime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <%--<td style="white-space: nowrap"  mdui-tooltip="{content: '点击按钮查看该消息详情'}">
                        <button id="mm"
                                class="mdui-fab mdui-fab-fixed  mdui-ripple"
                                onclick="moreMsg(${msg.msgid},this)">
                            查看详情
                        </button>
                    </td>--%>
                    <c:if test="${user.usergrade==1||user.usergrade>=3}">
                        <td style="white-space: nowrap" mdui-tooltip="{content: '点击按钮对该消息进行编辑'}">
                            <button id="me"
                                    class="mdui-btn mdui-color-green mdui-ripple"
                                    onclick="toEditArticle(${article.articleid})">
                                编辑
                            </button>
                        </td>
                    </c:if>
                    <c:if test="${user.usergrade==2||user.usergrade>=3}">
                        <td style="white-space: nowrap;  "  mdui-tooltip="{content: '点击按钮删除该消息'}">
                            <button id="md"
                                    class="mdui-btn mdui-color-red mdui-ripple"
                                    onclick="delAd(${article.articleid},this)">
                                删除
                            </button>
                        </td>
                    </c:if>
                </tr>
            </c:forEach>
            </tbody>
        </table>


    </div>
           <div class="mdui-progress" >
               <div class="mdui-progress-indeterminate"></div>
           </div>
           <div class="mdui-btn-group mdui-typo" style="margin:0 auto">
               <p style="font-weight: 300">当前为第${pageNow}/${pageCount}页，共有${rowCount}条文章</p>
               <a href="<%=basePath%>toArticleAll.do"><button type="button" class="mdui-btn">显示全部</button></a>
               <c:if test="${pageNow>1}">
               <a href="<%=basePath%>toArticleCenter.do?pageNow=${pageNow-1}"><button type="button" class="mdui-btn mdui-btn-active" mdui-tooltip="{content: '上一页'}"><i class="icon ion-ios-arrow-left mdui-icon  material-icons"></i></button></a>
               </c:if>
               <c:if test="${pageNow!=pageCount}">
               <a href="<%=basePath%>toArticleCenter.do?pageNow=${pageNow+1}"><button type="button" class="mdui-btn" mdui-tooltip="{content: '下一页'}"><i class="icon ion-ios-arrow-right mdui-icon  material-icons"></i></button></a>
               </c:if>
               <button class="mdui-btn mdui-color-light-blue-100  mdui-ripple" id="example-prompt-1">跳到指定页</button>
           </div>
</div>


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
        <h1 class="mdui-text-color-blue"  style="text-align: center" id="messageTitle"></h1>
        <h4 class="mdui-text-color-grey"  style="text-align: center" id="messageDate"></h4>
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
<script src="<%=basePath%>layer/layer.js"></script>
<script type="text/javascript">
    //欢迎提示
    layer.ready(function(){
        layer.msg('欢迎来到联蔚论坛', {anim: 4});
    });
    /*mdui.snackbar({
        message: '欢迎来到联蔚论坛',
        position: 'top'
    });*/
    //编辑文章按钮
    function toEditArticle(id){
        var idAfter=id*271343;
        window.location='toEditArticle.do?articleid='+idAfter;
    }
    //跳到指定页
    $('#example-prompt-1').on('click', function () {
        mdui.prompt('请输入你想跳到的页码',
                function (value) {
                    setTimeout(function () {
                        window.location='toArticleCenter.do?pageNow='+value;
                    },500)
                }
        );
    });

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
                        layer.msg('删除成功', {anim: 4});
                        console.log($(this).parents(".mdui-table-row-selected"));
                        _this.parents(".mdui-table-row-selected").remove();
                    });
        });
    }
</script>
</html>