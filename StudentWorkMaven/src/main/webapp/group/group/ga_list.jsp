<%@page import="unp.student.work.manager.domain.GroupMeeting"%>
<%@page import="unp.student.work.manager.utils.PageBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<%@page import="java.util.List,unp.student.work.manager.domain.*" %>
<%@page import="unp.student.work.manager.dao.*" %>
<%@page import="unp.student.work.manager.dao.impl.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>社团活动页面</title>
<%@ include file="../common/cssjs.inc"%>
</head>
<body>
	<h1 align="center">活动信息</h1>
	<table>
		<tr>
			<td>社团编号</td>
			<td>活动名称</td>
			<td>活动时间</td>
			<td>操作</td>
		</tr>
		<%!int id; %>
		<%
		Integer qx = (Integer)session.getAttribute("qx");
		List<GroupAct> groupActs=(List<GroupAct>)request.getAttribute("gaList");
		for(GroupAct groupAct :groupActs){%>
		<tr>
			<td><%=groupAct.getGroupId() %></td>
			<td><%=groupAct.getName() %></td>
			<td><%=groupAct.getActTime() %></td>
			<td>
			<%request.setAttribute("id", groupAct.getGroupId()); %>
			<a href="GroupAct?type=2&gaid=<%=groupAct.getId() %>">查看</a>
			<%if(qx == 1){ %>
			<a href="GroupAct?type=3&gaid=<%=groupAct.getId() %>">修改</a> 
			<a href="GroupAct?type=4&gaid=<%=groupAct.getId() %>">删除</a>
			<%} %>
		</tr>
		<%
		}%>
		<%id=(int)session.getAttribute("curGroup");%>
	</table>
	<%if(qx == 1){ %>
	<h1><a href="GroupAct?type=5&id=<%=id%>" target="dmMain">添加</a></h1>
	<%}%>
</body>
</html>