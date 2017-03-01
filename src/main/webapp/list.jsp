<%@ page language="java" import="java.util.*"  contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%> 
<%@ page import="com.instrument.domain.Instrument" %>
<%@ page import="com.instrument.domain.InstrumentType" %>
 
<%
    String path = request.getContextPath();
 	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    List<Instrument> instrumentList = (List<Instrument>)request.getAttribute("queryList");
   //获取所有的信息
    List<InstrumentType> instrumentType = (List<InstrumentType>)request.getAttribute("instrumentType");
   // BookType bookType = (BookType)request.getAttribute("bookType");
	 int  pages =   (Integer)request.getAttribute("pages");  //一共多少页
	 int  recordNumber =   (Integer)request.getAttribute("recordNumber");  //一共多少记录
	 int  currentPage = (Integer)request.getAttribute("currentPage");
     int historyPage = 1;//前一页
     if(currentPage-1 > 0){
    	 historyPage = currentPage - 1;
     }
	 int nextPage = pages;//后一页
	 if(nextPage < pages){
		 nextPage = currentPage + 1;
	 }
		
		
		
	
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
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
<script type="text/javascript" src="jedate/jquery-1.7.2.js"></script>
<script type="text/javascript" src="jedate/jquery.jedate.js"></script>
<link type="text/css" rel="stylesheet" href="jedate/skin/jedate.css">
</script>

</head>

<body>
<form action="tolist" name="QueryForm" method="post" id="QueryForm">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong> <a href="toadd" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li> <a class="button border-main icon-plus-square-o" href="add.html"> 添加内容</a> </li>
        <li>乐器名称:<input type=text class="input" style="width:200px; line-height:17px" name="instrumentName" id="instrumentName"value="" />
        <li>乐器所在类别:<select name="instrumentType" id="instrumentType" class="input" style="width:200px; line-height:17px;">
           	<option></option>
             <% 
             
             	for(InstrumentType list : instrumentType){
             %>
             <option><%=list.getInstrumenttypename() %> </option>
             <% } %>
           </select>
        </li>
        <li>乐器条形码:<input type=text class="input" style="width:200px; line-height:17px;" name="barcode" id="barcode" value="" />
		</li>
		</li>入库时间:<input id="date03" name="date03" type="text" class="input" style="width:200px; line-height:17px;" value="" placeholder="请选择日期"  readonly>
		  <input type=hidden name=currentPage value="1" />
          <input type=submit value="搜索" class="button border-main icon-search" onclick="QueryList();"/>
		</li>
 
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="100" style="text-align:left; padding-left:20px;">ID</th>
        <th width="10%">条码</th>
        <th>图片</th>
        <th>名称</th>
        <th>分类名称</th>
        <th>库存</th>
        <th width="10%">入库时间</th>
        <th width="310">操作</th>
      </tr>
      
      <% 	
      		if(instrumentList.size() == 0){
       %>
       	<tr><td colspan="8">暂无商品</td></tr>
       <%
          	}
      		for(Instrument list : instrumentList){
         	
       %>

        <tr>
          <td style="text-align:left; padding-left:20px;"><input type="checkbox" name="id[]" value="<%=list.getBarcode() %>" />
          </td>
          <td><%=list.getBarcode() %></td>
          <td width="10%"><img src="<%=basePath + list.getInstrumentphoto() %>" alt="" width="70" height="50" /></td>
          <td><%=list.getInstrumentname() %></td>
          <td><%=list.getInstrumenttype() %></td>
          <td><%=list.getCount() %></td>
          <td><%=list.getDate() %></td>
          <td><div class="button-group"> <a class="button border-main" href="add.html">
          <span class="icon-edit" style="cursor:hand;" onclick="location.href='add'"></span> 修改</a>
           <a class="button border-red" href="" onclick="del('<%=list.getBarcode() %>')"><span class="icon-trash-o"></span> 删除</a> </div></td>
        </tr>
        <%} %>
      <tr>
        <td style="text-align:left; padding:19px 0;padding-left:20px;"><input type="checkbox" id="checkall"/>
          全选 </td>
        <td colspan="7" style="text-align:left;padding-left:20px;"><a href="javascript:void(0)" class="button border-red icon-trash-o" style="padding:5px 15px;" onclick="DelSelect()"> 删除</a></a>
        </td>
      </tr>
      <tr>
      	<input type="hidden" name="curPage" id="curPage" value="1">
        <td colspan="8"><div class="pagelist"> <a href="javascript:void(0);" onclick="changePage(<%=historyPage%>)">上一页</a>

        <%
    	for(int i = 1 ; i <= pages ; i++){
     		if(i == currentPage){
        
        %>
        <span class="current" id=<%=i %>><%=i %></span>
        <%
     		}else{
        
        %>
        <a href="javascript:void(0)" id=<%=i %> onclick="changePage(<%=i %>)"><%=i %></a>
        <%
     		}}
        %>
        <a href="javascript:void(0);" onclick="changePage(<%=nextPage%>)">下一页</a><a href="javascript:void(0);" onclick="changePage(<%=pages%>)">尾页</a> </div></td>
      </tr>
    </table>
  </div>
</form>

<script type="text/javascript">
$("#date03").jeDate({
    isinitVal:false,    //是否初始化时间，默认不初始化时间
    festival:true,		//是否显示农历节日
    ishmsVal:false,		//时分秒限制
    minDate: '2016-06-16', 
    maxDate: $.nowDate(0),
    format:"YYYY年MM月DD日",
    zIndex:3000,
})
function changePage(pageNum){
		document.getElementById("curPage").value = pageNum;
		$("#QueryForm").submit();
  }


function QueryList(){
	
	var instrumentName = $('#instrumentName').val();
	var barcode = $('#barcode').val();
	var date = $('#date03').val();
	var instrumentType = $('#instrumentType').val();
	
	$.ajax({
		url: 'tolist',
		type: 'POST',
		data: {'instrumentName':instrumentName,'barcode':barcode,'date':date,'instrumentType':instrumentType},
		dataType: 'JSON',
		success: function(result){
			// result 就是服务器发送回来
			// 的JsonResult对象
		}
	});
	
}
function del(barcode){
	
	var barcode = barcode;
	
	var a = confirm("您确定要删除吗?");
	if(a == true){			
		$.ajax({
			url: 'delete',
			type: 'POST',
			data: {'barcode':barcode},
			dataType: 'JSON',
			success: function(result){
				// result 就是服务器发送回来
				// 的JsonResult对象
				if(result == true){
					alert("删除成功");
				}
			}
		});
	}
	
}
$("#checkall").click(function(){ 
	  $("input[name='id[]']").each(function(){
		  if(this.checked){   
			  $("input[name='id[]']").prop("checked", false);  
		    }else{   
		    	$("input[name='id[]']").prop("checked", true);
		    }   
	  });
	})
function DelSelect(){
	
	var checkNum = $("input[name='id[]']:checked").length;
	if(checkNum == 0){
		alert("请至少选择一项");
		return false;
	}
	if(confirm("确定要删除所选项目吗?")){
		var checkList = new Array();
		 $("input[name='id[]']:checked").each(function(){
			checkList.push($(this).val());
		 });
	}
	$.ajax({
		url: 'delList',
		type: 'POST',
		data: {"delitems":checkList.toString()},
		dataType: 'JSON',
		success: function(result){
			// result 就是服务器发送回来
			// 的JsonResult对象
			if(result == true){
				alert("删除成功");
			}
		}
	});
}	
</script>

</body>
</html>