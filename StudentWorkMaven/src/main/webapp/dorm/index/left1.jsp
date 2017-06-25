<%@page import="unp.student.work.manager.controller.SessionCounter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="unp.student.work.manager.controller.SessionCounter"  %>
<%@ include file="../common/head.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>宿舍管理系统</title>
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
					<a href="" target="dmMain">宿舍管理系统</a>
				</h1>
				<div id="profile-links">
					<p>
						<a>欢迎您${sessionScope.user}! <br></a> <a href="" title="密码修改" target="dmMain">密码修改
						</a>| <a href="userExit.action" title="退出系统" target="_top">退出</a>
						<br>
						当前在线人数:<%=SessionCounter.getActiveSessions() %>
					</p>
				</div>

				<ul id="main-nav">
					<!-- Accordion Menu -->
					
				
					<li><a href="#" class="nav-top-item"> <!-- Add the class "no-submenu" to menu items with no sub menu -->
							宿舍管理
					</a>
					
						<ul>
							<li><a href="dorm/applyManage/show1Apply.action" target="dmMain">审核物品借用申请</a></li>
							<li><a href="dorm/repairManage/show1Repair.action" target="dmMain">审核维修申请</a></li>
							
						</ul></li>
					
						</ul>

					
					
				<!-- End #main-nav -->
			</div>
		</div>
		<!-- End #sidebar -->
	</div>
</body>
</html>
