<%@ page language="java" import="java.util.*"  contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%> 
<%@ page import="com.instrument.domain.Instrument" %>
<%@ page import="com.instrument.domain.InstrumentType" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	//获取所有的bookType信息
	 List<InstrumentType> bookTypeList = (List<InstrumentType>)request.getAttribute("listQuery");
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
<script type="text/javascript">
window.onload=function(){
	func1(){
		//document.getElementById("submit").click();
	};
}
</script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong></div>
  <div class="padding border-bottom">
    <button type="button" class="button border-yellow" onclick="window.location.href='toadd'"><span class="icon-plus-square-o"></span> 添加分类</button>
  </div>   
  
  <form action="delete" name="bookTypeDeleteForm" method="post" id="bookTypeDeleteForm">
  <form action="list" name="bookTypeQueryForm" method="post" id="bookTypeQueryForm">
  <table class="table table-hover text-center">
    <tr>
      <th width="5%">ID</th>
      <th width="15%">一级分类</th>
      <th width="10%">排序</th>
      <th width="10%">操作</th>
    </tr>
    <input type="hidden" name="delete" id="delete" value="1">
    <%
           		/*计算起始序号*/
            	//int startIndex = (currentPage -1) * 3;
            	/*遍历记录*/
            	
            	for(int i=1;i <= bookTypeList.size();i++) {
            		//int currentIndex = startIndex + i + 1; //当前记录的序号
            		InstrumentType type = bookTypeList.get(i-1); //获取到BookType对象
            		
    %>
    <tr>
      <td><%=i %></td>
      <td><%=type.getInstrumenttypename() %></td>
      <td><%=i %></td>
      <td><div class="button-group"> <a class="button border-main" href="toupdate"><span class="icon-edit"></span> 修改</a> <a class="button border-red" href="javascript:void(0)" onclick="del(<%=i %>)"><span class="icon-trash-o"></span> 删除</a> </div></td>
    </tr>
    <% }%>
     <tr>
     	 <td colspan="8"><div class="pagelist"> <a href="javascript:void(0);" onclick="changePage(<%=historyPage%>)">上一页</a>
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
     	<a href="javascript:void(0);" onclick="changePage(<%=nextPage%>)">下一页</a><a href="javascript:void(0);" onclick="changePage(<%=pages%>)">尾页</a> </div></td>
     </tr>
  	</table>
  </form>
  </form>
</div>
<script type="text/javascript">
function del(type){
	var delType = "type"
	var a = confirm("您确定要删除吗?");
	if(a == true){			
		document.getElementById("delete").value = type;
		$("#bookTypeDeleteForm").submit();
	}
	
}
//$("#test").find("a").each(function() { 
//   alert($(this).html()); 
//});
function changePage(pageNum){
		document.getElementById("curPage").value = pageNum;
		$("#bookTypeQueryForm").submit();
  }
</script>
<div class="panel admin-panel margin-top">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>添加内容</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="add">
      <div class="form-group">
        <div class="label">
          <label>分类标题：</label>
        </div>
        <div class="field">
          <input type="text" name="type" class="input w50" name="title" />
          <div class="tips"></div>
        </div>
      </div>
        <div class="field" style="margin-left:166.69px;">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body>
</html>