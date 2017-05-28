<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>		
		<base href="<%=basePath%>">		
		<title>跳蚤市场</title>
		<link rel="stylesheet" href="goods/resources/css/reset.css" type="text/css" media="screen" />	  
		<link rel="stylesheet" href="goods/resources/css/style.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="goods/resources/css/invalid.css" type="text/css" media="screen" />	

		<script type="text/javascript" src="goods/resources/scripts/jquery-1.3.2.min.js"></script>
		<script type="text/javascript" src="goods/resources/scripts/simpla.jquery.configuration.js"></script>		
		<script type="text/javascript" src="goods/resources/scripts/facebox.js"></script>
		<script type="text/javascript" src="goods/resources/scripts/jquery.wysiwyg.js"></script>
		<script type="text/javascript" src="goods/resources/scripts/jquery.datePicker.js"></script>
		<script type="text/javascript" src="goods/resources/scripts/jquery.date.js"></script>		
</head>	
	
	<frameset frameSpacing="-30px" cols="260,*" >
		<frame name=menu src="goods/index/left.jsp">
		<frame name=dmMain src="goods/goods_introduction.jsp">
	</frameset>
</html>
