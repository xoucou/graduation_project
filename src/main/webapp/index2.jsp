<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%> 
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<title>图书管理系统-首页</title>
<link href="<%=basePath%>css/index.css" rel="stylesheet" type="text/css" />
 </head>
<body>
<div id="">
	<div id="banner"><img src="<%=basePath%>images/logo.gif" /></div>
	<div id="globallink">
		<ul>
			<li><a href="<%=basePath %>index2.jsp">首页</a></li>
			<li><a href="<%=basePath %>BookType/frontlist" target="OfficeMain">图书类型</a></li> 
			<li><a href="<%=basePath %>Book/frontlist" target="OfficeMain">图书</a></li> 
			<li><a href="<%=basePath%>toLogin"><font color=red>后台登陆</font></a></li>
		</ul>
		<br/>
	</div> 
	<div id="">
	 <iframe id="frame1" src="<%=basePath %>desk.jsp" name="OfficeMain" scrolling="yes" marginwidth=0 marginheight=0 frameborder=0 vspace=0 hspace=0 height=100% width=100% >
	 </iframe>
	</div>

</div>
</body>
</html>
