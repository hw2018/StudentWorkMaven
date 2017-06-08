<%@page import="unp.student.work.manager.domain.GroupMeeting"%>
<%@page import="unp.student.work.manager.utils.PageBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>社团会议详细信息</title>
<%@ include file="../common/cssjs.inc"%>
</head>
<body>
<%
	GroupMeeting groupMeeting = (GroupMeeting) request.getAttribute("groupMeeting");
%>
<div class="content-box-header">
		<h3>查看会议信息</h3>
	</div>
	<div class="content-box-content">
		<form name="form1" method="post" >
			<p>
				会议名字：
				<input class="text-input large-input" type="text"
					name="groupMeeting.name" value="<%=groupMeeting.getName()%>" readonly></input>
			</p>
			<p>
				会议详情：
				<textarea class="text-input textarea"  rows="16" cols="50"
					name="groupMeeting.text" readonly><%=groupMeeting.getText()%></textarea>
			</p>
		</form>

</body>
</html>