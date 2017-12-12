<%@ page import="com.connext.pojo.User" %>
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

<div class="col-md-1" style="margin-top: 100px"></div>


</body>
<script src="js/bootstrap.min.js"
        type="text/javascript"></script>
<script src="js/mdui.js"></script>
<script src="js/jquery.min.js"></script>
<script type="text/javascript">
    // 欢迎提示
    mdui.snackbar({
        message: '进入编辑文章模式……！',
        position: 'top'
    });
    //将隐藏输入框里的文章内容添加到textarea中
    $("#mc").val($("#atc").val());
</script>
</html>