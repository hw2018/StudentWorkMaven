<%@page import="unp.student.work.manager.utils.PageBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<%@page import="java.util.List,unp.student.work.manager.domain.Support"%>
<%@page import="unp.student.work.manager.dao.ApplySupportDao"%>
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
	<h1 align="center">资助查询结果</h1>
	<table>
		<tr>
			<td>编号</td>
			<td>学期</td>
			<td>学号</td>
			<td>专业</td>
			<td>培养层次</td>
			<td>资助种类</td>
			<td>申请状态</td>
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
			<td><s:property value="#f.term"/></td>
			<td><s:property value="#f.studentID"/></td>
			<td><s:property value="#f.profession"/></td>
			<td><s:property value="#f.level"/></td>			
			<td><s:property value="#f.supsort"/></td>
<%-- 			<td><s:property value="#f.status"/></td> --%>
			<td>
				<s:if test='#f.status=="Y"'>
					审核中
				</s:if>
				<s:else>
					审核通过
				</s:else>
			</td>
			<td>
			<s:date name="#f.createtime" format="yyyy-MM-dd"/></td>
			<td><a href="apply/apply/teacherupdateSupport.action?id=<s:property value='#f.id'/>">审核</a> 
		</tr>
	</s:iterator>
		
	</table>
	<form name="PageForm" action="apply/apply/showSupport.action" method="post">
			<%@ include file="../common/page.jsp"%>
	</form>
</body>
</html>