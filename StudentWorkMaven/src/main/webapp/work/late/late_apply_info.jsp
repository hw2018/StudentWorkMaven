<%@page import="unp.student.work.manager.domain.late_info" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<!--定义基准路径  -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../common/cssjs.inc"%>
</head>
<body>
	<h1 align="center">晚点申诉信息</h1>
	<form name="select"  action="lateinfo/showapply_lateinfo.action" method="post" >
	申诉状态：<input type="text" class="text-input textarea" name="status"/>
    <input type="submit" value="查询"/>
	<table>
		<tr>
			<td>缺勤人学号</td>
			<td>缺勤人名</td>
			<td>缺勤原因</td>
			<td>申诉状态</td>
		</tr>
		<%-- jsp尽量不要调用service或者dao对象, 应该从request里取出对象 --%>
		<tbody>
	<c:forEach var="item" items="${pageBean.data}">
	
		<tr>
		<td><a>${item.personInfo.studentid }</a></td>
		 	<td><a>${item.personInfo.name }</a></td>
			<td><a>${item.reason }</a></td>
			
			<td><a class="status" value="${item.status }">${item.status }</a></td>
			<td class="deal"><a  name="deal" href="lateinfo/dealinfo_lateinfo.action?latepersonid=${item.id }&id=${item.late_info.id}&status=${status}"> 同意</a></td>
			<td class="apply"><a id="${item.personInfo.studentid }" name="studentid" href="work/late/late_info_apply.jsp?latepersonid=${item.id }&studentid=${item.personInfo.studentid }&id=${item.late_info.id}&status=${status}"> 申诉</a></td>
			<td ><a name="delete" class="delete"  href="lateinfo/deleteapply_lateinfo.action?latepersonid=${item.id }&id=${item.late_info.id}&status=${status}"> 删除申诉</a></td>
			
		</tr>
	</c:forEach>
	</tbody>

	</table>


<br>
  <form name="PageForm" action="lateinfo/showapply_lateinfo.action" method="post">
			<a id="last" name="pageNum" href="lateinfo/showapply_lateinfo.action?pageno=${pageBean.curPage-1 }&status=${status}">上一页</a>
			<a id="cur" name="pageNum" href="lateinfo/showapply_lateinfo.action?pageno=${pageBean.curPage }&status=${status}">  ${pageBean.curPage}</a>
			<a id="next" name="pageNum" href="lateinfo/showapply_lateinfo.action?pageno=${pageBean.curPage+1 }&status=${status}">下一页</a>
			去第<input type="text"  name="pageno"/>页
			<input type="submit"  vlue="确定"/>
			
				<script type="text/javascript">
				
				  if(${pageBean.curPage}<=1){
				 var lastbutton=document.getElementById('last');
				 lastbutton.style.visibility="hidden";
				 }
				  if(${pageBean.curPage}>=${pageBean.maxPage}){
				 var nextbutton=document.getElementById('next');
				 nextbutton.style.visibility="hidden";
				  }		
				  
				   
				  var quanxian="${sessionScope.quanxian}";	 
				 if(quanxian.charAt(2)!='1'){
				
				  var deal=document.getElementsByClassName('deal');
				    for(var i=0;i<deal.length;i++){
				  deal[i].style.display="none";
				  }
				  }else{
				  var delete1=document.getElementsByClassName('delete');
				    for(var i=0;i<delete1.length;i++){
				  delete1[i].style.display="none";
				  }	  
				   var apply=document.getElementsByClassName('apply');
				    for(var i=0;i<apply.length;i++){
				  apply[i].style.display="none";
				  }	  
				  }
				  
				  var studentid="${sessionScope.studentid}";
				  var persons=document.getElementsByName('studentid');
				  for(var i=0;i<persons.length;i++){
				  	if(persons[i].id!=studentid){
				  	persons[i].style.visibility="hidden";
				  	}
				  }
				  
				 
				  
			
							/*function change(){
				var serach=document.getElementById("search_method").value;
				if(search=="2"){
				document.getElementById("form").innerHTML="~<input Id="to"  type="text" name="search_value_to"/>"
				}
				}*/
				</script>
		</form>
</body>
</html>
