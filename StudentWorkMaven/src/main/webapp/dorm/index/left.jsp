<%@page import="unp.student.work.manager.controller.SessionCounter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="unp.student.work.manager.controller.SessionCounter"  %>
<%@ include file="../common/head.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>基金交易系统</title>
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
					<a href="" target="dmMain">学生管理系统</a>
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
							宿舍信息管理
					</a>
					
						<ul>
							<li><a href="dorm/infoManage/dorm_add.action" target="dmMain">新增宿舍信息</a></li>
							<li><a href="dorm/infoManage/showDorm.action" target="dmMain">宿舍信息列表</a></li>
							
						</ul></li>

					<li><a href="#" class="nav-top-item current"> <!-- Add the class "no-submenu" to menu items with no sub menu -->
							公共物品管理
					</a>
						<ul>
							<li><a href="dorm/itemManage/item_add.action" target="dmMain">新增物品信息</a></li>
							<li><a href="dorm/itemManage/showItem.action" target="dmMain">物品信息列表</a></li>
							<li><a href="dorm/applyManage/apply_add.action" target="dmMain">创建借用申请</a></li>
							<li><a href="dorm/applyManage/showApply.action" target="dmMain">申请列表</a></li>
							
						</ul></li>
					<li><a href="#" class="nav-top-item">
							记录信息管理
					</a>
						<ul>
							<li><a href="dorm/recordManage/record_add.action" target="dmMain">新增记录信息</a></li>
							<li><a href="dorm/recordManage/showRecord.action" target="dmMain">记录信息列表</a></li>
							
						</ul></li>
						
					<li><a href="#" class="nav-top-item">
							维修管理
					</a>	
					<ul>
							<li><a href="dorm/repairManage/repair_add.action" target="dmMain">新增维修信息</a></li>
							<li><a href="dorm/repairManage/showRepair.action" target="dmMain">记录信息列表</a></li>
							
							
						</ul></li>
					
				</ul>
				<!-- End #main-nav -->
			</div>
		</div>
		<!-- End #sidebar -->
	</div>
</body>
</html>
