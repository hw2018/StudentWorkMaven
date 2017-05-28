<%@page import="unp.student.work.manager.domain.GroupMeeting"%>
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
<title>社团会议列表</title>
<%@ include file="../common/cssjs.inc"%>
</head>
<body>
	<h1 align="center">会议信息</h1>
	<table>
		<tr>
			<td>社团编号</td>
			<td>会议名称</td>
			<td>会议时间</td>
			<td>操作</td>
		</tr>
		<%!int id; %>
		<%
		Integer qx = (Integer)session.getAttribute("qx");
		List<GroupMeeting> groupMeetings=(List<GroupMeeting>)request.getAttribute("gmList");
		for(GroupMeeting groupMeeting :groupMeetings){%>
		<tr>
			<td><%=groupMeeting.getGroupId() %></td>
			<td><%=groupMeeting.getName() %></td>
			<td><%=groupMeeting.getStartTime() %></td>
			<td>
			<%request.setAttribute("id", groupMeeting.getGroupId()); %>
			
			<a href="GroupMeeting?type=2&gmid=<%=groupMeeting.getId() %>">查看</a>
			<%if(qx == 1){%>
			<a href="GroupMeeting?type=3&gmid=<%=groupMeeting.getId() %>">修改</a> 
			<a href="GroupMeeting?type=4&gmid=<%=groupMeeting.getId() %>">删除</a>
			<%}%>
			</td>
		</tr>
		<%
		}%>
		<%id=(int)session.getAttribute("curGroup");%>
	</table>
	<%if(qx == 1){%>
	<h1><a href="GroupMeeting?type=5&id=<%=id%>" target="dmMain">添加</a></h1>
	<%}%>
</body>
</html>