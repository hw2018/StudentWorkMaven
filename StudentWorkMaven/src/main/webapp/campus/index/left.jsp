<%@page import="unp.student.work.manager.controller.SessionCounter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="unp.student.work.manager.controller.SessionCounter"  %>
<%@ include file="../common/head.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>校园服务</title>
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
					<a href="" target="dmMain">校园服务平台</a>
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
							校园权益维护
					</a>
						<ul>
							<li><a href="equityprotect/equityprotect_add.action" target="dmMain">权益维护申请</a></li>
							<li><a href="equityprotect/showEquityprotect.action" target="dmMain">权益维护记录</a></li>
							<li><a href="equityprotect/showEquityprotect.action" target="dmMain">我的权益维护</a></li>
						</ul></li>
					<li><a href="#" class="nav-top-item"> <!-- Add the class "no-submenu" to menu items with no sub menu -->
							失物招领
					</a>
						<ul>
							<li><a href="lostandfound/lostandfound_add.action" target="dmMain">登记失物信息</a></li>
							<li><a href="lostandfound/lostandfound_add.action" target="dmMain">查询失物信息</a></li>
							<li><a href="lostandfound/showLostandfound.action" target="dmMain">失物招领记录</a></li>
						</ul></li>

					<li><a href="#" class="nav-top-item current"> <!-- Add the class "no-submenu" to menu items with no sub menu -->
							食堂服务
					</a>
						<ul>
							<li><a href="diningroomcomplaints/diningroomcomplaints_add.action" target="dmMain">食堂投诉申请</a></li>
							<li><a href="diningroomcomplaints/showDiningroomcomplaints.action" target="dmMain">食堂投诉记录</a></li>
							<!--<li><a href="" target="dmMain">说吧</a></li>
							<li><a href="" target="dmMain">吐槽记录</a></li>-->
						</ul></li>
					<!--<li><a href="#" class="nav-top-item">校园信息一点通</a>
						<ul>
							<li><a href="" target="dmMain">锐捷使用及常见问题</a></li>
							<li><a href="" target="dmMain">火车票优惠充磁办理说明</a></li>
							<li><a href="" target="dmMain">学生卡挂失及补办</a></li>
						</ul></li>-->
				</ul>
				<!-- End #main-nav -->
			</div>
		</div>
		<!-- End #sidebar -->
	</div>
</body>
</html>
