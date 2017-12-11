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
<title>登录页面</title>
<link rel="stylesheet" href="/css/mdui.css">
	<link rel="stylesheet" href="css/ionicons.css"/>
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
		<a id="toggle" href="javascript:;" class="mdui-btn mdui-btn-icon">
			<i class="icon ion-ios-keypad-outline mdui-icon material-icons"></i>
		</a>
		<h3>登录账号 - ConnextSystem</h3>
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
			
			<a href="<%=basePath%>toRegist.do" >没有账号去注册</a> 
		</div>

	</div>
	<!-- <h1 style="color:red">ssadasdasfasfasas</h1> -->
	<div class="col-md-2" style="margin-top: 100px"></div>
<div class="mdui-container mdui-color-grey-100 col-md-8" style="margin-top: 100px;height:800px;">
	<form action="<%=basePath%>userLogin.do" method="post" >

		<div class="col-md-2" style="margin-top: 100px"></div>
		<div class="col-md-8" style="margin-top: 100px">
			<div class="mdui-textfield mdui-textfield-floating-label" id="userphone">
				<i class="icon ion-ios-telephone mdui-icon material-icons"></i>
				<label class="mdui-textfield-label">请输入手机号码</label> 
				 <input type="hidden"  id="loginMessage1" value="${phonex}"/>
				<input id="up" name="userphone" class="mdui-textfield-input"  />
				<div class="mdui-textfield-error" id="error1"></div>
			</div>
			<div class="mdui-textfield mdui-textfield-floating-label" id="userpassword">
				<i class="icon ion-ios-locked mdui-icon material-icons"></i>
				<label class="mdui-textfield-label">请输入密码</label>
				 <input type="hidden"  id="loginMessage2" value="${passwordx}"/>
				 <input id="upw" class="mdui-textfield-input" type="password" name="userpassword"
					 />
					 <div class="mdui-textfield-error" id="error2"></div>
			</div>
			 <input type="hidden"  id="loginMessage3" value="${loginx}"/>
			<button id="regist" class="mdui-btn mdui-btn-block mdui-color-blue mdui-ripple" >
				<i class="icon ion-ios-paperplane-outline mdui-icon material-icons"></i>&nbsp;登录
			</button>

			</div>
	</form>

	</div>
<div class="col-md-2" style="margin-top: 100px"></div>
</body>
<script src="/js/bootstrap.min.js"
	type="text/javascript"></script>
<script src="/js/mdui.js"></script>
<script src="/js/jquery.min.js"></script>
<script type="text/javascript">
//手机号码离焦事件，先判断是否符合正确的手机号码格式，再判断是否已经存在
$('#up').blur(function () {
	var myreg1 = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
	var myreg2 = /(1[3-9]\d{9}$)/;
	 if (!myreg2.test($('#up').val())){ 
			alert("手机号码格式不正确！"); 
			//$("#moileMsg").html("<font color='red'>手机号码格式不正确！请重新输入！</font>"); 
			$('#up').focus();  
	}else{  
		   $.post("<%=basePath%>userphoneExist.do",
			  {
			    userphone:$('#up').val(),
			  },
			  function(data,status){
				  if(data=='true'){
					  mdui.snackbar({
				            message: '欢迎回来！尊敬的用户'+$('#up').val(),
				            position: 'top'
				        });
				  }
			  });
			}
		});
//登录提示
if($('#loginMessage1').val().length>0){
					$('#error1').text($('#loginMessage1').val());
	                $('#userphone').addClass('mdui-textfield-invalid');
	                mdui.snackbar({
	                    message: '手机号不存在',
	                    position: 'top'
	                });
	            };
if($('#loginMessage2').val().length>0){
					$('#error2').text($('#loginMessage2').val());
	                $('#userpassword').addClass('mdui-textfield-invalid');
	                mdui.snackbar({
	                    message: '密码错误！！',
	                    position: 'top'
	                });
	            };
if($('#loginMessage3').val().length>0){
	mdui.snackbar({
        message: '密码输错三次！！！24小时内你不许再登录！！！！',
        position: 'top'
    });
	            };
</script>
</html>