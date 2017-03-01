<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.instrument.domain.Message" %>
<%
	List<Message> messageList = (List<Message>)request.getAttribute("message");
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
<form method="post" action="">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 留言管理</strong></div>
    <div class="padding border-bottom">
      <ul class="search">
        <li>
          <button type="button"  class="button border-green" id="checkall"><span class="icon-check"></span> 全选</button>
          <button type="button" class="button border-red" onclick="DelSelect()"><span class="icon-trash-o"></span> 批量删除</button>
        </li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="120">ID</th>
        <th>姓名</th>       
        <th>邮箱</th>
        <th width="25%">内容</th>
        <th width="120">留言时间</th>
        <th>操作</th>       
      </tr>
      	<%
      		if(messageList.size() == 0){
      		
      	%>  
      	<tr><td colspan="8">暂无留言</td></tr>
      	<% 
      		}else{	
      			for(int i=0; i<messageList.size(); i++){
      				Message message = messageList.get(i);
      	%>    
        <tr>
          <td><input type="checkbox" name="id[]" value="<%=message.getId()%>" />
            <%=i+1 %></td>
          <td><%=message.getProposer() %></td>
          <td><%=message.getEmail() %></td>       
          <td><%=message.getMessage() %></td>
          <td><%=message.getDate() %></td>
          <td><div class="button-group"> <a class="button border-red" href="javascript:void(0)" onclick="del('<%=message.getId()%>')"><span class="icon-trash-o"></span> 删除</a> </div></td>
        </tr>
        <%	 } 
      	  }        
        %>
        <td colspan="8"><div class="pagelist"> 
        
       <a href="javascript:void(0);" onclick="changePage(<%=historyPage%>)">上一页</a>
     	 <input type="hidden" name="curPage" id="curPage" value="1">
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
     	<a href="javascript:void(0);" onclick="changePage(<%=nextPage%>)">下一页</a><a href="javascript:void(0);" onclick="changePage(<%=pages%>)">尾页</a>
        
        
        </div></td>
      </tr>
    </table>
  </div>
</form>
<script type="text/javascript">

function changePage(pageNum){
	document.getElementById("curPage").value = pageNum;
	$("#bookTypeQueryForm").submit();
}

function del(id){
	var id = id;
	var a = confirm("您确定要删除吗?");
	if(a == true){			
		$.ajax({
			url: 'delMessage',
			type: 'POST',
			data: {'id':id},
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
	  if (this.checked) {
		  this.checked = false;
	  }
	  else {
		  this.checked = true;
	  }
  });
})

function DelSelect(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		var t=confirm("您确认要删除选中的内容吗？");
		if (t==false) return false; 		
	}
	else{
		alert("请选择您要删除的内容!");
		return false;
	}
}
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
		url: 'delMessageList',
		type: 'POST',
		data: {"id":checkList.toString()},
		dataType: 'JSON',
		success: function(result){
			// result 就是服务器发送回来
			// 的JsonResult对象
			if(result == true){
				alert("删除成功");
				window.location.href="words";
			}
		}
	});
}	

</script>
</body></html>