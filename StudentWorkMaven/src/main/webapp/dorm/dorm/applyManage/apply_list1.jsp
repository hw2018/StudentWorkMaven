<%@page import="unp.student.work.manager.utils.PageBean"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../common/head.jsp"%>
<%@page import="java.util.List,unp.student.work.manager.domain.DormItem"%>
<%@page import="unp.student.work.manager.dao.DormItemDao"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<!--定义基准路径  -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../../common/cssjs.inc"%>
</head>
<body>
	<h1 align="center">借用申请查询结果</h1>
	<table>
		<tr>
			<td>编号</td>
			<td>学号</td>
			<td>物品号</td>
			<td>状态</td>
			
			<td>操作</td>
			
		</tr>
		<%-- jsp尽量不要调用service或者dao对象, 应该从request里取出对象 --%>
		<%
			
			PageBean  pageBean =  (PageBean) request.getAttribute("pageBean"); //important!
		%>
		<s:iterator value="pageBean.data" var="d" status="st">
		<tr>
			<td><s:property value="#d.id"/></td>
			
			<td><s:property value="#d.studentId"/></td>
			<td><s:property value="#d.itemId"/></td>
			<td><s:property value="#d.status"/></td>
		
			
			
			
			<td><a href="dorm/applyManage/updateApply.action?id=<s:property value='#d.id'/>">审核</a> 
			<a href="dorm/applyManage/deleteApply.action?id=<s:property value='#d.id'/>">删除</a></td>
		</tr>
	</s:iterator>
		
	</table>
	<form name="PageForm" action="dorm/applyManage/showApply.action" method="post">
					<%@ include file="../../common/page.jsp"%>
	</form>
</body>
</html>