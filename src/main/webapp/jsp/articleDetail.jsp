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

        <h4>欢迎回来，
            <% User user=(User)session.getAttribute("user"); %>
            <c:if test="${user.usergrade==0}">普通用户</c:if>
            <c:if test="${user.usergrade==1}">会员用户</c:if>
            <c:if test="${user.usergrade==2}">尊贵会员</c:if>
            <c:if test="${user.usergrade==3}">超级会员</c:if>
            <%=user.getUsername() %>
        </h4>
        <input type="hidden" id="userid" value="<%=user.getUserid()%>">
        <input type="hidden" id="articleid" value="${article.articleid}">
    </div>

</div>
<div class="col-md-1" style="margin-top: 100px"></div>
<div class="mdui-container mdui-color-grey-50 col-md-10 mdui-typo" style="margin-top: 100px;height:auto">
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

    <div class="mdui-progress">
        <div class="mdui-progress-indeterminate"></div>
    </div>
    <div class="col-md-2"></div>
    <div class="mdui-panel mdui-panel-popout col-md-8" mdui-panel>

        <div class="mdui-panel-item  mdui-panel-item-open  mdui-color-blue-grey-50">
            <div class="mdui-panel-item-header"><i class="icon ion-ios-chatbubble-outline mdui-icon  material-icons"></i><p style="font-size:18px;font-weight:100">文章评论</p></div>
            <div class="mdui-panel-item-body">
                <div class="mdui-textfield">
                    <i class="icon ion-ios-chatboxes-outline mdui-icon  material-icons"></i>
                    <label class="mdui-textfield-label">发表你的评论</label>
                    <textarea id="commentContent" class="mdui-textfield-input" type="text" maxlength="40"></textarea>
                </div>
                <button id="commentSubmit" class="mdui-btn mdui-color-theme-accent  mdui-ripple"><i class="icon ion-ios-paperplane-outline mdui-icon  material-icons"></i>提交</button>
                <c:forEach items="${comments}" var="comment" varStatus="status">
                    <div class="mdui-panel-item  mdui-panel-item-open  mdui-color-blue-grey-100">
                        <div class="mdui-panel-item-header">
                            <div class="mdui-chip">
                                <input class="hiddenusername" type="hidden" value="${comment.user.username}"/>
                                <span class="mdui-chip-icon mdui-color-blue"><i class="icon ion-ios-chatboxes-outline mdui-icon  material-icons"></i></span>
                                <span class="mdui-chip-title">联蔚科技用户：${comment.user.username}&nbsp;于<fmt:formatDate value="${comment.commenttime}" pattern="yyyy-MM-dd HH:mm:ss"/>发表</span>
                            </div>
                        </div>
                        <div class="mdui-panel-item-body mdui-typo">
                            <blockquote>
                                <p>${comment.commentcontent}</p>
                                <footer>${ status.index + 1}楼</footer>
                            </blockquote>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="mdui-progress">
        <div class="mdui-progress-indeterminate"></div>
    </div>
</div>

<div class="col-md-2" style="margin-top: 100px"></div>

<div class="col-md-1" style="margin-top: 100px"></div>
<div class="mdui-fab-wrapper" id="fab"  mdui-fab="{trigger: 'hover'}">
    <button class="mdui-fab mdui-ripple mdui-color-theme">
        <!-- 默认显示的图标 ion-ios-plus-empty-->
        <i class="icon ion-ios-plus-empty mdui-icon material-icons"></i>

        <!-- 在拨号菜单开始打开时，平滑切换到该图标，若不需要切换图标，则可以省略该元素 -->
        <i class="icon ion-ios-color-filter-outline mdui-icon material-icons mdui-fab-opened "></i>
    </button>
    <div class="mdui-fab-dial">
        <a href="<%=basePath%>toAddArticle.do">
            <button id="addArticle" class="mdui-fab mdui-fab-mini mdui-ripple mdui-color-pink " mdui-tooltip="{content: '写新文章', position: 'left'}"><i class="icon ion-ios-compose-outline" aria-hidden="true"></i></button>
        </a>
        <a href="<%=basePath%>toArticleByUserId.do">
            <button  class="mdui-fab mdui-fab-mini mdui-ripple mdui-color-red" mdui-tooltip="{content: '个人中心', position: 'left'}"><i class="icon ion-ios-person-outline mdui-icon material-icons"></i></button>
        </a>
        <a href="<%=basePath%>toArticleAll.do">
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
        message: '文章详情页！',
        position: 'top'
    });
    //将每位评论用户的用户名第一个字显示在图标上
    /*var username=$("#hiddenusername").val();
    alert(username.charAt(0));*/
    //提交评论
        $('#commentSubmit').click(function () {
            $.post("<%=basePath%>commentSubmit.do",
                    {
                        commentcontent:$("#commentContent").val(),
                        userid:$("#userid").val(),
                        articleid:$("#articleid").val(),
                    },
                    function(data,status){
                        mdui.snackbar({
                            message: '评论成功！',
                            position: 'top'
                        });
                        setTimeout(function(){window.location='/articleDetail.do?id='+$("#articleid").val()},1000);
                    });
        });

</script>
</html>