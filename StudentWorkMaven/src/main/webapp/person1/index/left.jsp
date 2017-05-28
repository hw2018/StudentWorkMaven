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

<title>个人管理系统</title>
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
					<a href="person/person_introduction.jsp" target="dmMain">个人管理系统</a>
				</h1>
				<div id="profile-links">
					<p>
						<a>欢迎您&nbsp;<%=session.getAttribute("studentid")%></a> | <a href="userExit" title="退出系统" target="_top">退出</a><br/>
					</p>
				</div>

			   
			   <ul id="main-nav">
					<li><a href="person/person/person_info.jsp" class="nav" target="dmMain">个人信息</a></li>
					<li><a href="person/person/person_mail_list.jsp" class="nav" target="dmMain">我的邮箱</a></li>
					<li><a href="person/person/person_favorite.jsp" class="nav" target="dmMain">网页收藏</a></li>
					<li><a href="person/person/person_life_account.jsp" class="nav" target="dmMain">生活账号</a></li>
					<li><a href="person/person/person_diary_list.jsp" class="nav" target="dmMain">生活日记</a></li>
					<li><a href="person/person/person_contacts.jsp" class="nav" target="dmMain">通讯录</a></li>
					
					<li><a href="person/person/person_finance.jsp" class="nav" target="dmMain">个人财务</a></li>
					<li><a href="person/person/person_plan.jsp" class="nav" target="dmMain">计划目标</a></li>
				</ul>
				
			</div>
		</div>
	</div>
</body>
</html>
