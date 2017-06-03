<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<%@page import="java.util.List,unp.student.work.manager.domain.GroupWork" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>社团值班表页面</title>
<%@ include file="../common/cssjs.inc"%>
<style type="text/css">
		.nav ul{
				width:980px;
				margin:0px auto;
				height:38px;
				padding:0;
				}
		.nav ul li{
				float:left;
				}
		.nav ul li a{
				width:80px;
				height:28px;
				line-height:28px;
				background:black;
				color:#FFF;
				margin:5px 10px;
				font-size:14px;
				display:block;
				text-align:center;
				text-decoration:none;

		.nav ul li a:hover{
				width:78px;
				height:26px;
				line-height:28px;
				border:1px solid red;
				color:blue;
				background:#FFF;
				}
</style>
</head>
<body>
<%
		Integer id = (Integer)session.getAttribute("curGroup");
	%>
	<div class="nav">
	<ul>
		<li><a href="GStudent?type=1&id=<%=id%>">成员管理</a></li>
		<li><a href="GroupMeeting?type=1&id=<%=id%>">会议管理</a></li> 
		<li><a href="GroupAct?type=1&id=<%=id%>">活动管理</a> </li>
		<li><a href="GroupMoney?type=1&id=<%=id%>">资金管理</a> </li>
		<li><a href="GStudent?type=1&id=<%=id%>">物品管理</a> </li>
		<li><a href="GroupWork?type=1&id=<%=id%>">值班管理</a> </li>
		<li><a href="GroupSupport?type=1&id=<%=id%>">赞助管理</a> </li>
	</ul>
	</div>
	<h1 align="center">社团值班表</h1>
	<table>
		<tr>
			<td>     </td>
			<td>星期一</td>
			<td>星期二</td>
			<td>星期三</td>
			<td>星期四</td>
			<td>星期五</td>
			<td>星期六</td>
			<td>星期日</td>
		</tr>
		<tr>
			<td>8:00-10:00</td>
			<td>
			<%
			Integer qx = (Integer)session.getAttribute("qx");
			if(request.getAttribute("groupWork11")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork11");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
			<td>
			<%if(request.getAttribute("groupWork21")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork21");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
			<td>
			<%if(request.getAttribute("groupWork31")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork31");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
			<td>
			<%if(request.getAttribute("groupWork41")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork41");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
			<td>
			<%if(request.getAttribute("groupWork51")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork51");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
			<td>
			<%if(request.getAttribute("groupWork61")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork61");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
			<td>
			<%if(request.getAttribute("groupWork71")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork71");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
		</tr>
		<tr>
			<td>10:00-12:00</td>
			<td>
			<%if(request.getAttribute("groupWork12")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork12");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
			<td>
			<%if(request.getAttribute("groupWork22")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork22");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
			<td>
			<%if(request.getAttribute("groupWork32")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork32");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
			<td>
			<%if(request.getAttribute("groupWork42")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork42");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
			<td>
			<%if(request.getAttribute("groupWork52")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork52");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
			<td>
			<%if(request.getAttribute("groupWork62")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork62");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
			<td>
			<%if(request.getAttribute("groupWork72")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork72");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
		</tr>
		<tr>
			<td>14:00-16:00</td>
			<td>
			<%if(request.getAttribute("groupWork13")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork13");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
			<td>
			<%if(request.getAttribute("groupWork23")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork23");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
			<td>
			<%if(request.getAttribute("groupWork33")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork33");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
			<td>
			<%if(request.getAttribute("groupWork43")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork43");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
			<td>
			<%if(request.getAttribute("groupWork53")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork53");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
			<td>
			<%if(request.getAttribute("groupWork63")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork63");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
			<td>
			<%if(request.getAttribute("groupWork73")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork73");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
		</tr>
		<tr>
			<td>16:00-18:00</td>
			<td>
			<%if(request.getAttribute("groupWork14")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork14");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
			<td>
			<%if(request.getAttribute("groupWork24")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork24");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
			<td>
			<%if(request.getAttribute("groupWork34")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork34");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
			<td>
			<%if(request.getAttribute("groupWork44")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork44");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
			<td>
			<%if(request.getAttribute("groupWork54")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork54");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
			<td>
			<%if(request.getAttribute("groupWork64")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork64");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
			<td>
			<%if(request.getAttribute("groupWork74")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork74");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
		</tr>
		<tr>
			<td>19:00-21:00</td>
			<td>
			<%if(request.getAttribute("groupWork15")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork15");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
			<td>
			<%if(request.getAttribute("groupWork25")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork25");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
			<td>
			<%if(request.getAttribute("groupWork35")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork35");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
			<td>
			<%if(request.getAttribute("groupWork45")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork45");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
			<td>
			<%if(request.getAttribute("groupWork55")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork55");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
			<td>
			<%if(request.getAttribute("groupWork65")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork65");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
			<td>
			<%if(request.getAttribute("groupWork75")!=null)
				{
				GroupWork groupWork=(GroupWork) request.getAttribute("groupWork75");%>
				<%=groupWork.getStuno()%>
				<br/>
				<%=groupWork.getPlace()%>
				<%
				}%>
			</td>
		</tr>
	</table>
	<%if(qx == 1){ %>
	<a href="GroupWork?type=2&id=<%=request.getParameter("id")%>">修改</a> 
	<%} %>
</body>
</html>