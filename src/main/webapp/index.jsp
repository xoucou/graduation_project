<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

if(session.getAttribute("username")==null){  
    response.sendRedirect("login.jsp");  
    return;  
}  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>后台管理中心</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
</head>
<body style="background-color:#f2f9fd;" id="main">
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
    <h1><img src="images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />后台管理中心</h1>
  </div>
  <div class="head-l">
	<img src="images/main_5.png" onclick="javascript:top.location.href='index.jsp';" width="45" height="45" style="cursor:pointer;" >
	<img src="images/main_3.png" onclick="javascript:history.go(-1);" width="45" height="45" align="middle" style="cursor:pointer;" >
	<img src="images/main_2.png" onclick="javascript:history.go(1);" width="45" height="45" style="cursor:pointer;" >
	<img src="images/main_4.png" onclick="javascript:self.location.reload();" width="45" height="45" style="cursor:pointer;" >
	<img src="images/main_1.png" onclick="javascript:top.location.href='logout';" width="45" height="45" style="cursor:pointer;" >
  </div>
  <div class="head-2" width="100px">
	<table>
		<tr><div align="left">欢迎[管理员]:<font color=blue ><%=session.getAttribute("username") %></font></tr>
		<tr>现在是：<span id="Clock"></span></tr>
	</table>
  </div>  
</div>

<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
  <h2><span class="icon-user"></span>基本设置</h2>
  <ul style="display:block">
    <li><a href="tochangePassword" target="right"><span class="icon-caret-right"></span>修改密码</a></li>
	<li><a href="toregister" target="right"><span class="icon-caret-right"></span>添加管理员账号</a></li>
	<li><a href="words" target="right"><span class="icon-caret-right"></span>留言管理</a></li>
	<li><a href="information" target="right"><span class="icon-caret-right"></span>修改信息</a></li>
  </ul>   
  <h2><span class="icon-pencil-square-o"></span>乐器类型管理</h2>
  <ul>
    <li><a href="InstrumentType/list" target="right"><span class="icon-caret-right"></span>添加分类</a></li>
    <li><a href="InstrumentType/toupdate" target="right"><span class="icon-caret-right"></span>分类管理</a></li>        
  </ul>
  <h2><span class="icon-pencil-square-o"></span>乐器管理</h2>
  <ul>
    <li><a href="Instrument/toadd" target="right"><span class="icon-caret-right"></span>添加乐器</a></li>
    <li><a href="Instrument/tolist" target="right"><span class="icon-caret-right" ></span>乐器管理</a></li>        
  </ul>    
</div>

<script type="text/javascript">
$(function(){
  $(".leftnav h2").click(function(){
	  $(this).next().slideToggle(200);	
	  $(this).toggleClass("on"); 
  })
  $(".leftnav ul li a").click(function(){
	    $("#a_leader_txt").text($(this).text());
  		$(".leftnav ul li a").removeClass("on");
		$(this).addClass("on");
  })
});
</script>
<ul class="bread">
  <li><a href="{:U('Index/desk')}" target="right" class="icon-home"> 首页</a></li>
  <li><a href="##" id="a_leader_txt">网站信息</a></li>
  <li><marquee width="1000">欢迎使用本系统！</marquee></li>
</ul>
<div class="admin pintyer">
  <iframe scrolling="auto" rameborder="0" src="desk.jsp" name="right" width="100%" height="100%"></iframe>
</div>
<div style="text-align:center;">
</div>
</body>
<script type="text/javascript">
function tick() {
var hours, minutes, seconds;
var intHours, intMinutes, intSeconds;
var today;
today = new Date();
intYear = today.getFullYear();
intMonth = today.getMonth() + 1;
intDay = today.getDate();

if (intHours == 0) {
hours = "00:";
} else if (intHours < 10) { 
hours = "0" + intHours+":";
} else {
hours = intHours + ":";
}

if (intMinutes < 10) {
minutes = "0"+intMinutes+":";
} else {
minutes = intMinutes+":";
}
if (intSeconds < 10) {
seconds = "0"+intSeconds+" ";
} else {
seconds = intSeconds+" ";
} 
timeString = intYear + "年" + intMonth + "月" + intDay + "日";
Clock.innerHTML = timeString;
window.setTimeout("tick();", 1000);
}

window.onload = tick;
//-->

</script>
</html>