<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>	
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>学生综合管理系统</title>
<%@ include file="../common/cssjs.inc"%>
<script type="text/javascript">
	$(function() {
		var a = $("#main-nav a");
		var menu = $("#main-nav li ul a");
		menu.click(function() {
			for (var j = 0; j < a.size(); j++) {
				a.eq(j).removeClass("current");
			}
			$(this).parent().parent().parent().find('a').addClass("current");

			for (var i = 0; i < menu.size(); i++) {
				menu.eq(i).removeClass("current");
			}
			$(this).addClass("current");
		});
	})
</script>
</head>
<body class="left">

	<div id="body-wrapper">
		<div id="sidebar"
			style="background: url('../images/bg-sidebar.gif') top left no-repeat;">
			<div id="sidebar-wrapper">
				<h1 id="sidebar-title">
					<a href="" target="dmMain">申请管理平台</a>
				</h1>
				<div id="profile-links">
					<p>
						<a>欢迎您${sessionScope.user}! <br></a> <a href="" title="密码修改" target="dmMain">密码修改
						</a>| <a href="userExit.action" title="退出系统" target="_top">退出</a>
						<br>
					</p>
				</div>

				<ul id="main-nav">
					<!-- Accordion Menu -->
					<li><a href="#" class="nav-top-item current"> <!-- Add the class "no-submenu" to menu items with no sub menu -->
							奖学金
					</a>
						<ul>
							<li><a href="apply/showScholarship.action" target="dmMain">奖学金管理</a></li>
						</ul></li>
					<li><a href="#" class="nav-top-item"> <!-- Add the class "no-submenu" to menu items with no sub menu -->
							社会资助
					</a>
						<ul>
							<li><a href="apply/showSupport.action" target="dmMain">资助管理</a></li>
						</ul></li>

					<li><a href="#" class="nav-top-item "> <!-- Add the class "no-submenu" to menu items with no sub menu -->
							勤工俭学
					</a>
						<ul>
							<li><a href="" target="dmMain">勤工管理</a></li>
						</ul></li>
					<li><a href="#" class="nav-top-item">
							活动申请
					</a>
						<ul>
							<li><a href="apply/showActivity.action" target="dmMain">活动申请管理</a></li>
						</ul></li>
					
					<li><a href="#" class="nav-top-item"> <!-- Add the class "no-submenu" to menu items with no sub menu -->
							假期留校
					</a>
						<ul>
							<li><a href="apply/showHoliday.action" target="dmMain">留校&提前返校管理</li>
						</ul></li>
					<li>																		
				</ul>
				<!-- End #main-nav -->
			</div>
		</div>
		<!-- End #sidebar -->
	</div>
</body>
</html>
