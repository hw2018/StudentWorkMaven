<%@page import="unp.student.work.manager.utils.PageBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<%@page import="java.util.List,unp.student.work.manager.domain.Group" %>
<%@page import="unp.student.work.manager.dao.GroupDao" %>
<%@page import="unp.student.work.manager.dao.impl.GroupDaoImpl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>社团详细信息</title>
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
		Group group = (Group) request.getAttribute("group");
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
	<div class="content-box-header">
		<h3>查看社团信息</h3>
	</div>
	<div class="content-box-content">
		<form name="form1" action="group/updateGroup.action" method="post">
			<p>
				社团名字：<input class="text-input large-input" type="text"
					name="group.name" value="<%=group.getName()%>" disabled></input>
			</p>
			<p>
				社团负责人：
				<input class="text-input large-input" type="text"
					name="group.res" value="<%=group.getRes()%>" disabled></input>
			</p>
			<p>
				社团描述：
				<textarea class="text-input textarea"  rows="16" cols="50"
					name="group.description" disabled><%=group.getDescription()%></textarea>
			</p>
			<input type="hidden" name="group.id" value="<%=group.getId()%>" />
			<input type="hidden" name="group.createTime" value="<%=group.getCreateTime()%>" />
		</form>
	</div>

</body>
</html>