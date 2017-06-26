 <%@page import="unp.student.work.manager.utils.PageBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<%@page import="java.util.List,unp.student.work.manager.domain.Equityprotect"%>
<%@page import="unp.student.work.manager.dao.CampusEquityprotectDao"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<!--定义基准路径  -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>显示列表</title>
<%@ include file="../common/cssjs.inc"%>
</head>
<body>
	<h1 align="center">失物招领记录</h1>
	<table>
		<tr>
			<td>失物招领编号</td>
			<td>失主姓名</td>
			<td>失物类型</td>
			<td>失主联系方式</td>
			<td>归还地点</td>
			<td>失物登记日期</td>
			
			<td>操作</td>
		</tr>
		<%-- jsp尽量不要调用service或者dao对象, 应该从request里取出对象 --%>
		<%
			//FundDao fundDao=new FundDaoJDBCImpl();
			//List<Fund> funds=fundDao.findAll();
			PageBean pageBean = (PageBean) request.getAttribute("pageBean"); //important!
		%>
		<s:iterator value="pageBean.data" var="g" status="st">
		<tr>
			<td><s:property value="#g.id"/></td>
			<td><s:property value="#g.name"/></td>
			<td>
				<s:if test='#g.type=="Q"'>
					钱包
				</s:if>
				<s:else>
					物品
				</s:else>
			</td>
			<td><s:property value="#g.tradetype"/></td>
			<td><s:property value="#g.tradeplace"/></td>
			<td>
			<s:date name="#g.releasedate" format="yyyy-MM-dd"/>
			
			<td><a href="lostandfound/updateLostandfound.action?id=<s:property value='#g.id'/>">修改</a> 
			<a href="lostandfound/deleteLostandfound.action?id=<s:property value='#g.id'/>">删除</a></td>
		</tr>
	</s:iterator>
		
	</table>
	<form name="PageForm" action="lostandfound/showLostandfound.action" method="post">
					<%@ include file="../common/page.jsp"%>
	</form>
</body>
</html>