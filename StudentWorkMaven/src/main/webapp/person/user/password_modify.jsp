<%@ page language="java" import="java.sql.*,java.net.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<script>
function check()
{
	var username = document.getElementById("username").value;
	var password = document.getElementById("password").value;
	
	
	if(username.replace(/\s/g, "").length == 0)
	{
		alert("用户名不能为空！");
		return false;
	}
	else if(password.replace(/\s/g, "").length == 0)
	{
		alert("密码不能为空！");
		return false;
	}
}

function jump()
{
	window.location.href="person/index.jsp";
}

function pmbeacon()
{
	var pmbeacon = "<%=session.getAttribute("pmbeacon")%>";
	if(pmbeacon==1)
	alert("密码修改成功！");
	else if(pmbeacon==0)
	alert("密码修改失败！");
}
</script>

</head>
<body onload="pmbeacon()" >
<%session.setAttribute("pmbencon",3);%>
<h2>&#12288密码修改</h2><br/>
<%
String username = request.getParameter("username");
username = URLDecoder.decode(username,"utf-8");
%>


<form method="POST" onsubmit="return check()" action="passwordModify">
<label>&#12288&#12288用户名：<input name="username" type="text" value="<%=username%>"/></label><br/><br/>
<label>&#12288&#12288新密码：<input name="password" type="password" /></label><br/><br/>
	
&#12288&#12288<input type="submit" value="修改"/>&#12288<input type="button" value="取消" onclick="jump()"/>
</form>
</body>
</html>