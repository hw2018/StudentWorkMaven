<%@page import="unp.student.work.manager.utils.PageBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<%@page import="java.util.List,unp.student.work.manager.domain.ClassActivity"%>
<%@page import="unp.student.work.manager.dao.ClassActivityDao"%>
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
    
	<h1 align="center">活动信息查询结果</h1>
	<table>
		<tr>
		    <td>编号</td>
		    <td>活动名称</td>
			<td>申请人学号</td>
			<td>活动地点</td>
			<td>参与人数</td>
			<td>活动时间</td>
			<td>负责人</td>	
			<td>活动内容</td>					
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
			<td><s:property value="#f.name"/></td>		
			<td><s:property value="#f.studentid"/></td>
			<td><s:property value="#f.place"/></td>
			<td><s:property value="#f.number"/></td>
			<td><s:property value="#f.date"/></td>
			
			<td><s:property value="#f.master"/></td>
		    <td><s:property value="#f.content"/></td>
			<td><a href="update_classActivity.action?id=<s:property value='#f.id'/>">修改</a> 
			<a href="delete_classActivity.action?id=<s:property value='#f.id'/>">删除</a></td>
		</tr>
	</s:iterator>
		
	</table>

	
	<form name="PageForm" action="show_classPosition.action" method="post">
					<%@ include file="../common/page.jsp"%>
					
	</form>
</body>
</html>