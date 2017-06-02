<%@page import="org.apache.struts2.components.Else"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<%@page import="java.util.List,unp.student.work.manager.domain.GroupMoney" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>社团资金流动页面</title>
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
<h1 align="center">社团资金流动表</h1>
	<table>
		<tr>
			<td>金额</td>
			<td>用途</td>
			<td>备注</td>
		</tr>
		<%
		Integer qx = (Integer)session.getAttribute("qx");
		List<GroupMoney> groupMoneys=(List<GroupMoney>)request.getAttribute("groupMoneys");
		for(GroupMoney groupMoney : groupMoneys){%>
		<tr>
			<td><%=groupMoney.getMoney() %></td>
			<%if(groupMoney.isMoneyIn()==true){%>
			<td><%="进账" %></td>
			<%}if(groupMoney.isMoneyIn()==false){%>
			<td><%="支出" %></td>
			<%} %>
			<td><%=groupMoney.getText() %></td>
		</tr>
		<%}%>
		</table>
<p>总剩余金额：<%=request.getAttribute("totalmoney") %></p>
<%if(qx == 1) {%>
<h1><a href="GroupMoney?type=2&id=<%=request.getParameter("id")%>" target="dmMain">添加</a></h1>
<%} %>
</body>
</html>