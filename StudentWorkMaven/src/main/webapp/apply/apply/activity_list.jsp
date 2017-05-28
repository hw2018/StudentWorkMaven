<%@page import="unp.student.work.manager.utils.PageBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<%@page import="java.util.List,unp.student.work.manager.domain.Activity"%>
<%@page import="unp.student.work.manager.dao.ApplyActivityDao"%>
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
	<h1 align="center">活动查询结果</h1>
	<table>
		<tr>
			<td>活动编号</td>
			<td>活动人数</td>
			<td>车辆数</td>
			<td>带队老师</td>
			<td>带队老师电话</td>
			<td>负责人</td>
			<td>申请时间</td>
			<td>操作</td>
		</tr>
		<%-- jsp尽量不要调用service或者dao对象, 应该从request里取出对象 --%>
		<%
			//FundDao fundDao=new FundDaoJDBCImpl();
			//List<Fund> funds=fundDao.findAll();
			PageBean pageBean = (PageBean) request.getAttribute("pageBean"); //important!
		%>
		<s:iterator value="pageBean.data" var="f" status="st">
		<tr>
			<td><s:property value="#f.id"/></td>
			<td><s:property value="#f.peoplenumber"/></td>
			<td><s:property value="#f.carnumber"/></td>
			<td><s:property value="#f.leadteacher"/></td>
			<td><s:property value="#f.leadteacherphone"/></td>
			<td><s:property value="#f.principal"/></td>			
			<td>
			<s:date name="#f.createTime" format="yyyy-MM-dd"/>
			<td><a href="apply/apply/updateActivity.action?id=<s:property value='#f.id'/>">修改</a> 
			<a href="apply/apply/deleteActivity.action?id=<s:property value='#f.id'/>">删除</a></td>
		</tr>
	</s:iterator>
		
	</table>
	<form name="PageForm" action="apply/apply/showActivity.action" method="post">
			<%@ include file="../common/page.jsp"%>
	</form>
</body>
</html>