<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>		
<base href="<%=basePath%>">		
<title>福州大学学生综合管理系统</title>	
<style type="text/css">
a{color:black;font-size:15px;font-fimily:楷体;text-decoration:none;margin-left:360px;}
</style>

<script type="text/javascript">
		function error()
		{
			var error = "<%=session.getAttribute("error")%>";
			if(error==1)
			alert("账号或密码错误，请重新输入！");
		}
	</script>
<link rel="stylesheet" href="person/resources/css/login.css">
</head>	
<body onload="error()" style="background-image:url(person/resources/images/bc.png);background-repeat:no-repeat;background-position:center;">
<%session.setAttribute("error",0);%>
<br/><br/><br/><br/>
<div align="center" style="margin-top:-20px;height:20%;background-image:url(person/resources/images/header.png);background-repeat:no-repeat;background-position:center;"></div>
<br/><br/>
<div>
<table align="center">
  <tr>
  <td>
  <div class="form">
    <form class="login-form" action="userValidate.action" method="post">
      <input type="text" name="studentid" placeholder="用户名"/>
      <input type="password" name="password" placeholder="密码"/>
      <input class="b" type="submit" style="font-size:20px;" value="登陆"/>
      <a href="register.jsp">注册</a>
    </form>
  </div>   
  
  </td>
  
  
  
  
  </tr>
  </table>

</div>
<br/><br/><br/><br/><br/><br/><br/><br/>
<p style="text-align:center;">Copyright &copy; 2017 UNP. All Rights Reserved.<br/><br/>UNP小组 版权所有</p>

</body>
</html>
