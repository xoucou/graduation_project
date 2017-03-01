<%@ page language="java" import="java.util.*"  contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%> 

<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel margin-top" id="add">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>修改内容</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="updateInformation">    
      <div class="form-group">
        <div class="label">
          <label>地址：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" id="address" name="address" value="<%=request.getAttribute("address") %>" name="title" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>座机：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" id="phone" name="phone" value="<%=request.getAttribute("phone") %>"  />
          <div class="tips"></div>
        </div>
      </div>
     <div class="form-group">
        <div class="label">
          <label>手机：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" id="telephone" name="telephone" value="<%=request.getAttribute("telephone") %>"  />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>关于我们：</label>
        </div>
        <div class="field">
          <textarea type="text" class="input" id="aboutUs" name="aboutUs" style="height:120px;" value=""><%=request.getAttribute("aboutUs") %></textarea>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit" name="submit" id="submit" value="">提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body>
<script type="text/javascript">
//$(function(){
//	$('#submit').click(loginAction());
//});
//function loginAction(){
	
//	var address = $('#address').val();
//	var phone = $('#phone').val();
//	var telephone = $('#telephone').val();
//	var aboutUs = $('#aboutUs').val();
	
	
	
//	$.ajax({
//		url: 'updateInformation',
//		type: 'POST',
//		data: {'address':address,'phone':phone,'telephone':telephone,'aboutUs':aboutUs},
//		dataType: 'JSON',
//		success: function(result){
			// result 就是服务器发送回来
			// 的JsonResult对象
//			if(result.equals("SUCCESS")){
//				window.open("message"); 
//			}
//		}
//	});
	
//}
</script>
</html>