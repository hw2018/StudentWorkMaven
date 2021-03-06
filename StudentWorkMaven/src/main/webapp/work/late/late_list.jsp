<%@page import="unp.student.work.manager.utils.PageBean"%>
<%@page import="unp.student.work.manager.domain.late_info" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<h1 align="center">晚点情况</h1>
	<form id="select" name="select"  action="lateinfo/show_lateinfo.action" method="post" >
	负责人学号：<input id="studentid" type="text" class="text-input textarea" name="studentid"/>
    <br><input type="submit" value="查询"/>
    </form>
	<table>
		<tr>
			<td>晚点编号</td>
			<td>晚点缺勤人数</td>
			<td>晚点时间</td>
			<td>晚点负责人</td>
		</tr>
		<%-- jsp尽量不要调用service或者dao对象, 应该从request里取出对象 --%>
		<tbody>
	<c:forEach var="item" items="${pageBean.data}">
	
		<tr>
			<td><a href="lateinfo/info_lateinfo.action?id=${item.id }">${item.id }</a></td>
			<td><a href="lateinfo/info_lateinfo.action?id=${item.id }">${item.num }</a></td>
			<td><a href="lateinfo/info_lateinfo.action?id=${item.id }"><fmt:formatDate value="${item.time}" pattern="yyyy-MM-dd"/></a></td>
			
			<td><a href="lateinfo/info_lateinfo.action?id=${item.id }">${item.personInfo.studentid }</a></td>
			<td class="update"><a name="update" href="lateinfo/info_lateinfo.action?id=${item.id }"> 修改</a></td>
			<td class="delete"><a name="delete" href="lateinfo/delete_lateinfo.action?id=${item.id }"> 删除</a></td>
			
		</tr>
	</c:forEach>
	</tbody>

	</table>
<a id="add" href="work/late/late_add.jsp">新增</a>
<br>
  <form name="PageForm" action="lateinfo/show_lateinfo.action?studentid=${studentid}" method="post">
			<a id="last" name="pageNum" href="lateinfo/show_lateinfo.action?pageno=${pageBean.curPage-1 }&studentid=${studentid}">上一页</a>
			<a id="cur" name="pageNum" href="lateinfo/show_lateinfo.action?pageno=${pageBean.curPage }&studentid=${studentid}">    ${pageBean.curPage }     </a>
			<a id="next" name="pageNum" href="lateinfo/show_lateinfo.action?pageno=${pageBean.curPage+1 }&studentid=${studentid}">下一页</a>
			去第<input type="text" class="text-input textarea" name="pageno"/>页
			<input type="submit"  vlue="确定"  onclick="return checkpage(this.form)"/><br>
			
				
		</form>
		
		
<script>
				$(function () {
				
			$( "#select" ).validate( {   
				rules: {
					studentid: {
						number:true
					}
				},
				messages:{
					studentid:"只能为数字"
				},
				
			} );
		});
				  if(${pageBean.curPage}<=1){
				 var lastbutton=document.getElementById('last');
				 lastbutton.style.display="none";
				 }
				  if(${pageBean.curPage}>=${pageBean.maxPage}){
				 var nextbutton=document.getElementById('next');
				 nextbutton.style.display="none";
				  }		
				  
				  var quanxian="${sessionScope.quanxian}";				  
				 if(quanxian.charAt(2)!='1'){
				  var add=document.getElementById('add');
				  add.style.display="none";
				  var delete1=document.getElementsByClassName('delete');
				  for(var i=0;i<delete1.length;i++){
				  delete1[i].style.display="none";
				  }
				  var update=document.getElementsByClassName('update');
				    for(var i=0;i<delete1.length;i++){
				  update[i].style.display="none";
				  }
				  }
				 function checkpage(form) {

			if(isNaN(form.pageno.value)) {
                document.getElementById('errorinfo').innerHTML="页码只能为数字";
                form.pageno.focus();
                return false;
           }
          if(form.pageno.value<=0) {
                 document.getElementById('errorinfo').innerHTML="页码不能小于0";
                form.pageno.focus();
                return false;
           }
       if(form.pageno.value>=${pageBean.maxPage}){
                document.getElementById('errorinfo').innerHTML="页码不能大于最大页";
                form.pageno.focus();
                return false;
         }
         return true;
         } 
						/*function change(){
				var serach=document.getElementById("search_method").value;
				if(search=="2"){
				document.getElementById("form").innerHTML="~<input Id="to"  type="text" name="search_value_to"/>"
				}
				}*/
		</script>
</body>
</html>
