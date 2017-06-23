<%@page import="unp.student.work.manager.utils.PageBean"%>
<%@page import="unp.student.work.manager.domain.counsellor" %>
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
	<h1 align="center">辅导员考核</h1>
		<form id="select" name="select"  action="counsellor/getresult_counsellor.action" method="post" >
	辅导员姓名：<input id="sname" type="text" class="text-input textarea" name="sname"/>
    <input type="submit" value="查询"/>
    </form>
	<table>
		<tr>
			<td>姓名</td>
			<td>分数</td>
		</tr>
		<%-- jsp尽量不要调用service或者dao对象, 应该从request里取出对象 --%>
		<tbody>
	<c:forEach var="item" items="${pageBean.data}">
	
		<tr>
			<td>${item.name }</td>
			<td>${item.score }</td>
		</tr>
	</c:forEach>
	</tbody>

	</table>
<br>
  <form name="PageForm" action="counsellor/getresult_counsellor.action" method="post">
			<a id="last" name="pageNum" href="counsellor/getresult_counsellor.action?pageno=${pageBean.curPage-1 }&sname=${name}">上一页</a>
			<a id="cur" name="pageNum" href="counsellor/getresult_counsellor.action?pageno=${pageBean.curPage }&sname=${name}">${pageBean.curPage }</a>
			<a id="next" name="pageNum" href="counsellor/getresult_counsellor.action?pageno=${pageBean.curPage+1 }&sname=${name}">下一页</a>
			去第<input type="text"  name="pageno"/>页
			<input type="submit"  vlue="确定"  onclick="return checkpage(this.form)"/>
			
				<script type="text/javascript">
				
				$(function () {
				
			$( "#select" ).validate( {   
				rules: {
					sname: {
						maxlength:4 
						
					}
				},
				messages:{
					studentid:"输出正确的学号"
				},
				
			} );
		});
				  if(${pageBean.curPage}<=1){
				 var lastbutton=document.getElementById('last');
				 lastbutton.style.visibility="hidden";
				 }
				  if(${pageBean.curPage}>=${pageBean.maxPage}){
				 var nextbutton=document.getElementById('next');
				 nextbutton.style.visibility="hidden";
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
				 
				</script>
		</form>
</body>
</html>
