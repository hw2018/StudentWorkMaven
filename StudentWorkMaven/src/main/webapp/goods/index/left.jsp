<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="java.text.DecimalFormat"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()	+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>学生管理系统</title>
<link rel="stylesheet" href="goods/resources/css/reset.css" type="text/css"	media="screen" />
<link rel="stylesheet" href="goods/resources/css/style.css" type="text/css"	media="screen" />
<link rel="stylesheet" href="goods/resources/css/invalid.css" type="text/css"	media="screen" />

<script type="text/javascript"	src="goods/resources/scripts/jquery-1.3.2.min.js"></script>
<script type="text/javascript"	src="goods/resources/scripts/simpla.jquery.configuration.js"></script>
<script type="text/javascript" src="goods/resources/scripts/facebox.js"></script>
<script type="text/javascript" src="goods/resources/scripts/jquery.wysiwyg.js"></script>
<script type="text/javascript"	src="goods/resources/scripts/jquery.datePicker.js"></script>
<script type="text/javascript" src="goods/resources/scripts/jquery.date.js"></script>

</head>
<body class="left"> 

	<div id="body-wrapper">
		<div id="sidebar"
			style="background: url('../resources/images/bg-sidebar.gif') top left no-repeat;">
			<div id="sidebar-wrapper">
				<h1 id="sidebar-title">
					<a href="goods/goods_introduction.jsp" target="dmMain">跳蚤市场</a>
				</h1>
				<div id="profile-links">
					<p>
						<a>欢迎您&nbsp;<%=session.getAttribute("studentid")%></a> | <a href="userExit" title="退出系统" target="_top">退出</a><br/>
					</p>
				</div>

			   
			   <ul id="main-nav">
					<li><a href="#" class="nav-top-item">买家中心</a>
						<ul>
							<li><a href="goods/goods/goods_infoall.jsp"  target="dmMain">所有物品</a></li>
							<li><a href="goods/goods/goods_rbpmy.jsp" target="dmMain">我的征购</a></li>
						</ul>
					</li>
					<li><a href="#" class="nav-top-item">卖家中心</a>
						<ul>
							<li><a href="goods/goods/goods_infomy.jsp"  target="dmMain">我的物品</a></li>
							<li><a href="goods/goods/goods_rbpall.jsp" target="dmMain">所有征购</a></li>
						</ul>
					</li>
				</ul>
				
			</div>
		</div>
	</div>
</body>
</html>
