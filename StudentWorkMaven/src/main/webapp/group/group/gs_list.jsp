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
<style type="text/css">
		.nav ul{
				width:980px;
				margin:0px auto;
				height:38px;
				padding:0;
				}
		.nav ul li{
				float:left;
				}
		.nav ul li a{
				width:80px;
				height:28px;
				line-height:28px;
				background:black;
				color:#FFF;
				margin:5px 10px;
				font-size:14px;
				display:block;
				text-align:center;
				text-decoration:none;

		.nav ul li a:hover{
				width:78px;
				height:26px;
				line-height:28px;
				border:1px solid red;
				color:blue;
				background:#FFF;
				}
</style>
</head>
<body>
<%
		Integer id = (Integer)session.getAttribute("curGroup");
	%>
	<div class="nav">
	<ul>
		<li><a href="GStudent?type=1&id=<%=id%>">成员管理</a></li>
		<li><a href="GroupMeeting?type=1&id=<%=id%>">会议管理</a></li> 
		<li><a href="GroupAct?type=1&id=<%=id%>">活动管理</a> </li>
		<li><a href="GroupMoney?type=1&id=<%=id%>">资金管理</a> </li>
		<li><a href="GStudent?type=1&id=<%=id%>">物品管理</a> </li>
		<li><a href="GroupWork?type=1&id=<%=id%>">值班管理</a> </li>
		<li><a href="GroupSupport?type=1&id=<%=id%>">赞助管理</a> </li>
	</ul>
	</div>
	<h1 align="center">成员信息</h1>
	<table>
		<tr>
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