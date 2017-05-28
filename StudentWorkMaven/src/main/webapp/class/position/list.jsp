<%@page import="unp.student.work.manager.utils.PageBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<%@page import="java.util.List,unp.student.work.manager.domain.ClassPosition"%>
<%@page import="unp.student.work.manager.dao.ClassPositionDao"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<!--定义基准路径  -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../common/cssjs.inc"%>
</head>
<body>




</tr></table>
</form>
    
	<h1 align="center">职务信息查询结果</h1>
	<table>
		<tr>
		    <td>编号</td>
			<td>职务名称</td>
			<td>学生学号</td>
			<td>委任时期</td>
			<td>操作</td>
		</tr>
		<%-- jsp尽量不要调用service或者dao对象, 应该从request里取出对象 --%>
		<%
			//FundDao fundDao=new FundDaoJDBCImpl();
			//List<Fund> funds=fundDao.findAll();
			PageBean pageBean = (PageBean) request.getAttribute("pageBean"); //important!
		%>

		
		<s:iterator value="#request.pageBean.data" var="f" status="st">
		<tr>
			<td><s:property value="#f.id"/></td>
			<td><s:property value="#f.position"/></td>
			<td><s:property value="#f.studentid"/></td>
			<td><s:property value="#f.date"/></td>
			<td><a href="update_classPosition.action?id=<s:property value='#f.id'/>">修改</a> 
			<a href="delete_classPosition.action?id=<s:property value='#f.id'/>">删除</a></td>
		</tr>
	</s:iterator>
		
	</table>

	
	<form name="PageForm" action="position/show_classPosition.action" method="post">
					<%@ include file="../common/page.jsp"%>
					
	</form>
</body>
</html>