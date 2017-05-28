<%@page import="unp.student.work.manager.utils.PageBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<%@page import="java.util.List,unp.student.work.manager.domain.GStudent" %>
<%@page import="unp.student.work.manager.dao.GStudentDao" %>
<%@page import="unp.student.work.manager.dao.impl.GStudentDaoImpl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@ include file="../common/cssjs.inc"%>
</head>
<body>
	<h1 align="center">成员信息</h1>
	<table>
		<tr>
			<td>社团名称</td>
			<td>成员名</td>
			<td>职务</td>
			<td>操作</td>
		</tr>
		<%!int id;%>
		<%
		Integer qx = (Integer)session.getAttribute("qx");
		List<GStudent> gStudents=(List<GStudent>)request.getAttribute("gsList");
		for (GStudent gStudent : gStudents) {%>
		<tr>
			<td><%=gStudent.getGroupId()%></td>
			<td><%=gStudent.getStuno()%></td>
			<td><%=gStudent.getJob()%></td>
			<%if(qx == 1){ %>
			<td><a href="GStudent?type=2&gsid=<%=gStudent.getId() %>">修改</a> 
			<a href="GStudent?type=4&gsid=<%=gStudent.getId()%>">删除</a></td>
			<%} %>
		</tr>
		<%id=gStudent.getGroupId();%>
		<%} %>
	</table>
	<%if(qx == 1||qx==2){ %>
	<h1><a href="GStudent?type=3&id=<%=id%>" target="dmMain">添加</a></h1>
	<%} %>
</body>
</html>