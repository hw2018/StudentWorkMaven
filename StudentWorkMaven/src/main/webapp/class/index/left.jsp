<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>班级管理系统</title>
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
					<a href="" target="dmMain">班级管理系统</a>
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
					<li><a href="#" class="nav-top-item"> <!-- Add the class "no-submenu" to menu items with no sub menu -->
							班级职务管理
					</a>
						<ul>		
							<li><a href="class/position/add.jsp" target="dmMain">委任成员职务</a></li>
							<li><a href="show_classPosition.action" target="dmMain">成员职务列表</a></li>

						</ul></li>
						
						
				    <li><a href="#" class="nav-top-item"> <!-- Add the class "no-submenu" to menu items with no sub menu -->
							班级活动管理
					</a>
						<ul>
							<li><a href="class/activity/add.jsp" target="dmMain">班级活动申请</a></li>
							<li><a href="show_classActivity.action" target="dmMain">班级活动列表</a></li>
						</ul></li>
											
				<li><a href="#" class="nav-top-item"> <!-- Add the class "no-submenu" to menu items with no sub menu -->
							班级出勤管理
					</a>
						<ul>		
							<li><a href="class/chuqin/add.jsp" target="dmMain">添加出勤信息</a></li>
							<li><a href="show_classChuqin.action" target="dmMain">出勤信息列表</a></li>

						</ul></li>
						
					<li><a href="#" class="nav-top-item"> <!-- Add the class "no-submenu" to menu items with no sub menu -->
							班级作业管理
					</a>
						<ul>
							<li><a href="class/homework/add.jsp" target="dmMain">新增作业信息</a></li>
							<li><a href="show_classHomework.action" target="dmMain">作业信息列表</a></li>
						</ul></li>

					<li><a href="#" class="nav-top-item current"> <!-- Add the class "no-submenu" to menu items with no sub menu -->
							班级请假管理
					</a>
						<ul>
							<li><a href="show_classLeave.action" target="dmMain">请假信息列表</a></li>
						</ul></li>

				</ul>
				<!-- End #main-nav -->
			</div>
		</div>
		<!-- End #sidebar -->
	</div>
</body>
</html>
