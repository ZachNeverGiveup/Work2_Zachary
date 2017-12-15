<%@ page import="com.connext.model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
    <title>文章编辑</title>
    <link rel="stylesheet" href="css/mdui.css"><link rel="stylesheet" href="css/ionicons.css"/>
    <link
            href="css/bootstrap.min.css"
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
                class="mdui-icon material-icons">menu</i></a>
        <h3>文章编辑  - ConnextSystem</h3>
        <div class="mdui-toolbar-spacer"></div>
        <h4>欢迎回来，
            <% User user=(User)session.getAttribute("user"); %>
            <c:if test="${user.usergrade==0}">普通用户</c:if>
            <c:if test="${user.usergrade==1}">会员用户</c:if>
            <c:if test="${user.usergrade==2}">尊贵会员</c:if>
            <c:if test="${user.usergrade==3}">超级会员</c:if>
            <%=user.getUsername() %>
        </h4>
    </div>

</div>
<div class="col-md-1" style="margin-top: 100px"></div>
<div class="mdui-container mdui-color-grey-100 col-md-10" style="margin-top: 100px;height:800px;">
    <div class="col-md-2" style="margin-top: 100px"></div>
    <div class="col-md-8" style="margin-top: 100px">
        <form action="<%=basePath%>updateArticle.do" method="post" >
            <div class="mdui-textfield mdui-textfield-floating-label" id="articleTitle">
                <i class="icon ion-ios-pricetags-outline mdui-icon material-icons"></i>
                <label class="mdui-textfield-label">在此修改标题</label>
                <input id="mt" name="articletitle" class="mdui-textfield-input" value="${article.articletitle}"  maxlength="50" />
                <input type="hidden" name="articleid" class="mdui-textfield-input" value="${article.articleid}"  />
                <input type="hidden" name="articleuserid" class="mdui-textfield-input" value="${article.articleuserid}"  />
                <input id="atc" type="hidden" class="mdui-textfield-input" value="${article.articlecontent}"  />
            </div>
            <div class="mdui-textfield mdui-textfield-floating-label" id="articleContent">
                <i class="icon ion-ios-paper-outline mdui-icon material-icons"></i>
                <label class="mdui-textfield-label">在此修改内容</label>
                <textarea id="mc" name="articlecontent" class="mdui-textfield-input"   maxlength="500"></textarea>
            </div>
            <button id="mu" class="mdui-btn mdui-btn-block mdui-color-blue mdui-ripple" >
                <i class="icon ion-ios-cloud-upload-outline mdui-icon material-icons"></i>&nbsp;确认修改
            </button>
        </form>
    </div>
</div>
<div class="col-md-2" style="margin-top: 100px"></div>
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
        <a href="<%=basePath%>toArticleCenter.do?pageNow=1">
            <button class="mdui-fab mdui-fab-mini mdui-ripple mdui-color-blue" mdui-tooltip="{content: '回到首页', position: 'left'}"><i class="icon ion-ios-undo-outline mdui-icon mdui-fab-opened material-icons"></i></button>
        </a>
    </div>
</div>
<div class="col-md-1" style="margin-top: 100px"></div>


</body>
<script src="js/bootstrap.min.js"
        type="text/javascript"></script>
<script src="js/mdui.js"></script>
<script src="js/jquery.min.js"></script>
<script src="<%=basePath%>layer/layer.js"></script>
<script type="text/javascript">
    //欢迎提示
    layer.ready(function(){
        layer.msg('进入编辑文章模式……', {anim: 4});
    });
    //将隐藏输入框里的文章内容添加到textarea中
    $("#mc").val($("#atc").val());
</script>
</html>