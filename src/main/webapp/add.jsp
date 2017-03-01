<%@ page language="java" import="java.util.*"  contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%> 
<%@ page import="com.instrument.domain.InstrumentType" %> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	//获取所有的bookType信息
	 List<InstrumentType> bookTypeList = (List<InstrumentType>)request.getAttribute("type");
%>
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
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加乐器</strong></div>
  <div class="body-content">
    <form action="add" method="post" class="form-x"  enctype="multipart/form-data">  
      <div class="form-group">
        <div class="label">
          <label>乐器名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="instrumentname" id="instrumentname" data-validate="required:请输入名称" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>图片：</label>
        </div>
        <div class="field" style="margin-bottom:15px; margin-left:0px;">
          <img src="#" id="img" style="display: none;">
          <input  class="button bg-blue margin-left" type="button" id="image1" value="+ 浏览上传"  style="float:left;" onclick="openImg()">
		  <input type="file" style="display:none" id="imgfile" name="imgfile" onchange="imgPreview(this)">
          <div class="tipss">图片尺寸：500*500
        </div>
      </div>     
      
      <if condition="$iscid eq 1">
        <div class="form-group">
          <div class="label">
            <label>乐器种类：</label>
          </div>
          <div class="field">
            <select name="instrumenttype" id="instrumenttype"class="input w50">
            	<option value="">请选择分类</option>
              <%
            	for(int i=1;i <= bookTypeList.size();i++) {
            		InstrumentType type = bookTypeList.get(i-1); //获取到BookType对象
            		
             %>
    		<option value="<%=type.getInstrumenttypename() %>"><%=type.getInstrumenttypename() %></option>
    <% }%>
            </select>
            <div class="tips"></div>
          </div>
        </div>
      </if>
      <div class="form-group">
        <div class="label">
          <label>条形码：</label>
        </div>
        <div class="field">
          <input type="text" a class="input" name="barcode" id="barcode" style="width:25%;">
          <div class="tips"></div>
        </div>
      </div>
	  <div class="form-group">
        <div class="label">
          <label>数量：</label>
        </div>
        <div class="field">
          <input type="text" a class="input" name="count" id="count" style="width:25%;">
          <div class="tips"></div>
        </div>
      </div> <div class="form-group">
        <div class="label">
          <label>入库时间：</label>
        </div>
        <div class="field">
          <input type="text" readonly  a class="input" name="date" style="width:25%;" id="Clock">
          <div class="tips"></div>
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit" id="submit" value="">提交</button>
        </div>
      </div>
    </form>
  </div>
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
window.setTimeout("tick();", 1000);
document.getElementById("Clock").value = timeString;
}

window.onload = tick;
//-->
//$(function(){
//	$('#submit').click(loginAction);
//});
function loginAction(){
	var SUCCESS = 0;
	var ERROR = 1;
	
	var instrumentname = $('#instrumentname').val();
	var instrumentphoto = $('#instrumentphoto').val();
	var instrumenttype = $('#instrumenttype').val();
	var barcode = $('#barcode').val();
	var count = $('#count').val();
	var date = $('#date').val();
	
	
	
	$.ajax({
		url: 'add',
		type: 'POST',
		data: {'instrumentname':instrumentname,'instrumentphoto':instrumentphoto,'instrumenttype':instrumenttype,'barcode':barcode,'count':count,'date':date,},
		dataType: 'JSON',
		success: function(result){
			// result 就是服务器发送回来
			// 的JsonResult对象
			
		}
	});
	
}
function openImg(){
	 var ie = navigator.appName == "Microsoft Internet Explorer"? true:false;
	 console.log("11111");
	 if(ie){
		document.getElementById("imgfile").click();
		document.getElementById("url1").value = document.getElementById("imgfile").value;
	}else{
		var a = document.createEvent("MouseEvents");
		a.initEvent("click",true,true);
		document.getElementById("imgfile").dispatchEvent(a);
	}
}
function imgPreview(fileDom){
        //判断是否支持FileReader
        if (window.FileReader) {
            var reader = new FileReader();
        } else {
            alert("您的设备不支持图片预览功能，如需该功能请升级您的设备！");
        }

        //获取文件
        var file = fileDom.files[0];
        var imageType = /^image\//;
        //是否是图片
        if (!imageType.test(file.type)) {
            alert("请选择图片！");
            return;
        }
        //读取完成
        reader.onload = function(e) {
            //获取图片dom
            var img = document.getElementById("img");
            img.style.display="block";
            //图片路径设置为读取的图片
            img.src = e.target.result;
        };
        reader.readAsDataURL(file);
    }
</script>
</html>