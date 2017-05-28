<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.text.DecimalFormat"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()	+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>综合管理系统</title>
<link rel="stylesheet" href="person/resources/css/reset.css" type="text/css"	media="screen" />
<link rel="stylesheet" href="person/resources/css/style.css" type="text/css"	media="screen" />
<link rel="stylesheet" href="person/resources/css/invalid.css" type="text/css"	media="screen" />

<script type="text/javascript"	src="person/resources/scripts/jquery-1.3.2.min.js"></script>
<script type="text/javascript"	src="person/resources/scripts/simpla.jquery.configuration.js"></script>
<script type="text/javascript" src="person/resources/scripts/facebox.js"></script>
<script type="text/javascript" src="person/resources/scripts/jquery.wysiwyg.js"></script>
<script type="text/javascript"	src="person/resources/scripts/jquery.datePicker.js"></script>
<script type="text/javascript" src="person/resources/scripts/jquery.date.js"></script>

</head>
<body class="left"> 

	<div id="body-wrapper">
		<div id="sidebar"
			style="background: url('../resources/images/bg-sidebar.gif') top left no-repeat;">
			<div id="sidebar-wrapper">
				<h1 id="sidebar-title">
					<a href="person/person_introduction.jsp" target="dmMain">综合管理系统</a>
				</h1>
				<div id="profile-links">
					<p>
						<a>欢迎您&nbsp;<%=session.getAttribute("studentid")%></a> | <a href="userExit.action" title="退出系统" target="_top">退出</a><br/>
					</p>
				</div>

			   
			   <ul id="main-nav">
					<li><a href="person/index.jsp" class="nav" target="_top">个人管理</a></li>
					<li><a href="dorm/index.jsp" class="nav" target="_top">宿舍管理</a></li>
					<li><a href="class/index.jsp" class="nav" target="_top">班级管理</a></li>
					<li><a href="group/index.jsp" class="nav" target="_top">社团管理</a></li>
					<li><a href="apply/index.jsp" class="nav" target="_top">申请管理</a></li>
					<li><a href="goods/goods_index.jsp" class="nav" target="_top">跳蚤市场</a></li>
					<li><a href="work/work_index.jsp" class="nav" target="_top">工作管理</a></li>
					<li><a href="campus/index.jsp" class="nav" target="_top">校园服务</a></li>
				</ul>
				
			</div>
		</div>
	</div>
</body>
</html>
