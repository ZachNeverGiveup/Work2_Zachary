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
    <title>会员管理--管理员个人中心</title>
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
        <h3>会员管理 - 管理员个人中心 - ConnextSystem</h3>
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
<div class="mdui-container mdui-color-grey-50 col-md-10" style="margin-top: 100px;height:800px;">
       <%-- <a href="<%=basePath%>toAdd.do">
            <button id="ma"
                    class="mdui-fab mdui-fab-fixed  mdui-ripple" >
                <i class="icon ion-ios-plus-empty mdui-icon material-icons"></i>
            </button>
        </a>--%>
    <div class="col-md-8 mdui-typo" style="margin-top: 100px">
        <table class="mdui-table ">
            <thead>
            <tr>
                <th style=" white-space: nowrap; text-align:center">会员Id</th>
                <th style=" white-space: nowrap; text-align:center" class="mdui-table-col-numeric">会员名</th>
                <th style=" white-space: nowrap; text-align:center" class="mdui-table-col-numeric">会员电话</th>
                <th style=" white-space: nowrap; text-align:center" class="mdui-table-col-numeric">会员等级</th>
                <th style=" white-space: nowrap; text-align:center" class="mdui-table-col-numeric">编辑</th>
                <%--<th style=" white-space: nowrap; text-align:center" class="mdui-table-col-numeric">删除</th>--%>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${users}" var="user">
                <tr class="mdui-table-row-selected">
                    <td style="width:100px; white-space: nowrap; text-align:center"  mdui-tooltip="{content: '这是会员在数据库中的编号'}">${user.userid}</td>
                    <td style="width:100px; white-space: nowrap; text-align:center" mdui-tooltip="{content: '点击进入这个用户的个人主页进行管理'}"><a href="#">${user.username}</a></td>
                    <td style="width:100px; text-align:center"  mdui-tooltip="{content: '这个用户的手机号，请不要泄露用户隐私信息'}">${user.userphone}</td>
                    <td style="width:100px; white-space: nowrap; text-align:center" mdui-tooltip="{content: '用户等级'}">
                        <c:if test="${user.usergrade==0}">普通用户</c:if>
                        <c:if test="${user.usergrade==1}">会员用户</c:if>
                        <c:if test="${user.usergrade==2}">尊贵会员</c:if>
                        <c:if test="${user.usergrade==3}">超级会员</c:if>
                        <c:if test="${user.usergrade>3}">超级管理员</c:if>
                    </td>
                    <td style="white-space: nowrap" mdui-tooltip="{content: '点击按钮对该用户进行编辑'}">
                                <button id="me"
                                        class="mdui-btn mdui-color-green mdui-ripple"
                                        onclick="toEditUser(${user.userid},'${user.username}',${user.userphone},${user.usergrade})">
                                    编辑
                                </button>
                        </td>
                        <%--<td style="white-space: nowrap;  "  mdui-tooltip="{content: '点击按钮删除该消息'}">
                            <button id="md"
                                    class="mdui-btn mdui-color-red mdui-ripple"
                                    onclick="delAd(${article.articleid},this)">
                                删除
                            </button>
                        </td>--%>
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

<!--   以下是模态框以下是模态框以下是模态框以下是模态框以下是模态框以下是模态框以下是模态框以下是模态框    -->
<div class="mdui-dialog" id="dialog">
    <div class="mdui-dialog-title">你确定要删除吗?</div>
    <div class="mdui-dialog-content">你将会失去这条消息的所有信息！</div>
    <div class="mdui-dialog-actions">
        <button class="mdui-btn mdui-ripple" mdui-dialog-cancel>算了</button>
        <button id="dc" class="mdui-btn mdui-ripple mdui-color-blue" mdui-dialog-confirm>确定</button>
    </div>
</div>

<div class="mdui-dialog" id="editDialog" destroyOnClosed>
    <div class="mdui-textfield" id="usernameDia">
        <i class="icon ion-ios-person mdui-icon material-icons"></i>
        <label class="mdui-textfield-label">你可以在此修改用户名</label>
        <input id="usernameDialog" class="mdui-textfield-input"/>
    </div>
    <div class="mdui-container mdui-valign" style="height: auto">
        <h4>用户手机号：<mark id="userphoneDialog"> </mark></h4>
    </div>
    <div class="mdui-container mdui-valign" style="height: auto;width: auto">
        <h4>用户等级：</h4>
        <div>
        <div class="col-md-3">
            <label class="mdui-radio" mdui-tooltip="{content: '只具有增删改查自己的文章的权限以及查看他人文章的权限'}">
                <input type="radio" name="usergradeDialog" value="0"/>
                <i class="mdui-radio-icon"></i>
                普通用户
            </label>
        </div>
        <div class="col-md-3">
        <label class="mdui-radio" mdui-tooltip="{content: '具有增删改查自己的文章的权限以及查看、编辑他人文章的权限以及黄色昵称'}">
            <input type="radio" name="usergradeDialog" value="1"/>
            <i class="mdui-radio-icon"></i>
            会员用户
        </label>
        </div>
        <div class="col-md-3">
        <label class="mdui-radio" mdui-tooltip="{content: '具有增删改查自己的文章的权限以及查看、删除他人文章的权限以及红色昵称'}">
            <input type="radio" name="usergradeDialog" value="2"/>
            <i class="mdui-radio-icon"></i>
            尊贵会员
        </label>
        </div>
        <div class="col-md-3">
        <label class="mdui-radio" mdui-tooltip="{content: '具有增删改查自己的文章的权限以及查看、编辑、删除他人文章的权限以及金色昵称'}">
            <input type="radio" name="usergradeDialog" value="3"/>
            <i class="mdui-radio-icon"></i>
            超级会员
        </label>
        </div>
        </div>
        <%--<select id="usergradeDialog" class="mdui-select" mdui-select>
            <option value="0" mdui-tooltip="{content: '此等级用户啥权限也没有'}">普通用户</option>
            <option value="1" mdui-tooltip="{content: '会员用户将拥有编辑他人文章的权限'}">会员用户</option>
            <option value="2" mdui-tooltip="{content: '尊贵会员将拥有删除他人文章的权限'}">尊贵会员</option>
            <option value="3" mdui-tooltip="{content: '超级会员将同时拥有编辑和删除他人文章的权限'}">超级会员</option>
            <option value="10" mdui-tooltip="{content: '你不可将其设置为超级管理员'}" disabled>超级管理员</option>
        </select>--%>
    </div>
    <div class="mdui-dialog-actions">
        <button class="mdui-btn mdui-ripple" mdui-dialog-cancel>算了</button>
        <button id="ec" class="mdui-btn mdui-ripple mdui-color-blue" mdui-dialog-confirm>确定</button>
    </div>
</div>

<!-- 以上是模态框 以上是模态框以上是模态框以上是模态框以上是模态框以上是模态框-->

<!-- 以下是右下角的浮动按钮 -->
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
        layer.msg('欢迎来到个人中心', {anim: 4});
    });
    //编辑文章按钮
   function toEditUser(id,name,phone,grade){
       /*/!*var username=name;*!/
       var userphone=phone;
       var usergrade=grade;*/
       new mdui.Dialog('#editDialog').open();
       $("#usernameDialog").val(name);
       $("#userphoneDialog").text(phone);
       $("input[type='radio'][name='usergradeDialog']").eq(grade).attr("checked",true);
       $("#ec").click(function () {
           $.post("<%=basePath%>editUser.do",
                   {
                       userid:id,
                       username:$("#usernameDialog").val(),
                       usergrade:$("input:radio[name='usergradeDialog']:checked").val(),
                   },
                   function(data,status){
                       layer.msg('修改成功！', {anim: 4});
                       setTimeout(function(){window.location='toManageUser.do'},800);
                   });
       })
    };


</script>
</html>