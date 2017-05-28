<%@page import="unp.student.work.manager.utils.PageBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<%@page import="java.util.List,unp.student.work.manager.domain.Holiday"%>
<%@page import="unp.student.work.manager.dao.ApplyHolidayDao"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<!--定义基准路径  -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>福大学生综合管理系统</title>
<%@ include file="../common/cssjs.inc"%>
</head>
<body>
	<h1 align="center">申请查询结果</h1>
	<table>
		<tr>
			<td>编号</td>
			<td>留校开始开始时间</td>
			<td>留校结束时间</td>
			<td>联系电话</td>
			<td>留宿宿舍</td>
			<td>申请原因</td>
			<td>申请状态</td>
			<td>申请时间 </td>
			<td>操作</td>
		</tr>
		<% 
			PageBean pageBean = (PageBean) request.getAttribute("pageBean"); //important!
		%>
		<s:iterator value="pageBean.data" var="f" status="st">
		<tr>
			<td><s:property value="#f.id"/></td>
			<td><s:property value="#f.starttime"/></td>
			<td><s:property value="#f.endtime"/></td>
			<td><s:property value="#f.phone"/></td>
			<td><s:property value="#f.dormitory"/></td>
			<td><s:property value="#f.statement"/></td>	
			<td><s:property value="#f.status"/></td>		
			<td>
			<s:date name="#f.createtime" format="yyyy-MM-dd"/>
			<td><a href="apply/apply/updateHoliday.action?id=<s:property value='#f.id'/>">修改</a> 
			<a href="apply/apply/deleteHoliday.action?id=<s:property value='#f.id'/>">删除</a></td>
		</tr>
	</s:iterator>
		
	</table>
	<form name="PageForm" action="apply/apply/showHoliday.action" method="post">
			<%@ include file="../common/page.jsp"%>
	</form>
</body>
</html>