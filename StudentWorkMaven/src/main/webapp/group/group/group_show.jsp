<%@page import="unp.student.work.manager.utils.PageBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<%@page import="java.util.List,unp.student.work.manager.domain.Group" %>
<%@page import="unp.student.work.manager.dao.GroupDao" %>
<%@page import="unp.student.work.manager.dao.impl.GroupDaoImpl" %>
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
	<h1 align="center">社团信息</h1>
	
	<table>
		<tr>
			<td>社团编号</td>
			<td>社团名称</td>
			<td>操作</td>
		</tr>
		<%
		    String user = (String)session.getAttribute("user");
			GroupDao groupDao=new GroupDaoImpl();
			List<Group> groups=groupDao.findByStuno(user);
			Integer qx = (Integer)session.getAttribute("qx");
			System.out.println(user);
			System.out.println(qx);
			if(qx == 2)
				groups = groupDao.findAll();
			for (Group group : groups) {
		%>
		<tr>
			<td><%=group.getId()%></td>
			<td><%=group.getName()%></td>
			<td>
			<%if(qx == 0){ %>
			<a href="Group?type=5&id=<%=group.getId()%>">查看</a>
			<%}else if(qx == 1){ %>
			<a href="Group?type=5&id=<%=group.getId()%>">查看</a>
			<a href="Group?type=3&id=<%=group.getId()%>">修改</a> 
			<%}else{ %>
			<a href="Group?type=5&id=<%=group.getId()%>">查看</a>
			<a href="Group?type=3&id=<%=group.getId()%>">修改</a> 
			<a href="Group?type=4&id=<%=group.getId()%>">删除</a>
			<%} %>
			</td>
		</tr>

		<%
			}
		%>
	</table>
	<%if(qx == 2){ %>
		<h1><a href="group/group/group_add.jsp" target="dmMain">添加</a></h1>
	<%} %>
</body>
</html>