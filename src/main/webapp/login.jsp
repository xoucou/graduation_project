<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>登录</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>  
</head>
<body>
<div class="bg"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:150px;"></div>
            <div class="media media-y margin-big-bottom">           
            </div>         
            <!--  <form method="post" action="login" id="login">  -->
            <div class="panel loginbox">
                <div class="text-center margin-big padding-big-top"><h1>后台管理中心</h1></div>
                <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="text" class="input input-big" id="username" name="username" placeholder="登录账号" data-validate="required:请填写账号" />
                            <span class="icon icon-user margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="password" class="input input-big" id="password" name="password" placeholder="登录密码" data-validate="required:请填写密码" />
                            <span class="icon icon-key margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field">
                            <input type="text" class="input input-big" id="inputcode" name="code" placeholder="填写右侧的验证码" data-validate="required:请填写右侧的验证码" />
                           <img src="code" id="code"alt="" width="100" height="32" class="passcode" style="height:43px;cursor:pointer;" onclick="this.src=this.src+'?'">  
                                                   
                        </div>
                    </div>
                </div>
                <div style="padding:30px;"><input type="button" id="submit" class="button button-block bg-main text-big input-big" value="登录"></div>
            </div>
         <!--   <form>        --> 
        </div>
    </div>
</div>
<script>
$(function(){
	$('#submit').click(loginAction);
});
function loginAction(){
	var SUCCESS = 0;
	var ERROR = 1;
	var USER_ID = "loginUserId";
	
	var username = $('#username').val();
	var password = $('#password').val();
	var code = $('#inputcode').val();
	
	$.ajax({
		url: 'login',
		type: 'POST',
		data: {'username':username,'password':password,'inputcode':code},
		dataType: 'JSON',
		success: function(result){
			// result 就是服务器发送回来
			// 的JsonResult对象
			if(result.state==SUCCESS){
				console.log(result.data);
				console.log("登录成功！");
				
				window.location.href='index.jsp';
				return;
			}
			var field = result.state;
			if(field==1){
				//显示用户名错误
				alert(result.message);
			}
			if(field==2){
				//显示密码错误
				alert(result.message);
			}
			if(field==3){
				//显示验证码错误
				alert(result.message)
			}
		}
	});
	
}

</script>
</body>
</html>