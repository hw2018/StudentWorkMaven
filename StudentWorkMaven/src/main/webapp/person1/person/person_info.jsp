<%@ page language="java" import="
java.sql.*,
java.net.*,
java.util.List,
java.util.Iterator,
java.text.SimpleDateFormat,
unp.student.work.manager.domain.PersonPersonInfo,
unp.student.work.manager.service.PersonInfoService,
org.springframework.context.ApplicationContext,
org.springframework.context.support.ClassPathXmlApplicationContext,
org.hibernate.Session,org.hibernate.Query" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<base href="<%=basePath%>">   <!--定义基准路径  -->
<style type="text/css">
td,th{
	line-height:30px;
	font-size:1.4em;
	margin-left:40px;
	list-style:none;
	border-width:1px;
	border-style:solid;
	border-color:black;
}
table{
	border-collapse:collapse;
	
}
</style>

<style type="text/css">
html{overflow-x:hidden }
</style>

</head>
<body style="background-color:dee6f2">
<%!
public PersonPersonInfo personPersonInfo = new PersonPersonInfo();
//根据当前登陆的学号，获取personPersonInfo
%>

<% 
ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml"); 
personPersonInfo = ((PersonInfoService)ctx.getBean("personInfoService")).getPersonInfo((String)session.getAttribute("studentid"));  //根据当前HttpSession里的studentid来得到PersonPersonInfo对象

java.util.Date d = personPersonInfo.getBirthday();
String s = new SimpleDateFormat("yyyy-MM-dd").format(d);

%>


<br/><br/>
<h1 align="center">福州大学学生个人信息一览表</h1><br/>
<table align="center" width="800" style="table-layout:fixed">
<tr><td width="120">学号：</td><td><% out.print(personPersonInfo.getStudentid()); %></td>		<td width="120">姓名：</td><td><% out.print(personPersonInfo.getName()); %></td></tr>
<tr><td width="120">性别：</td><td><% out.print(personPersonInfo.getSex()); %></td>				<td width="120">民族：</td><td><% out.print(personPersonInfo.getNation()); %></td></tr>
<tr><td width="120">籍贯：</td><td><% out.print(personPersonInfo.getPlaceofbirth()); %></td>		<td width="120">出生年月：</td><td><% out.print(s); %></td></tr>
<tr><td width="120">年级：</td><td><% out.print(personPersonInfo.getGrade()); %></td>			<td width="120">政治状态：</td><td><% out.print(personPersonInfo.getPoliticalstatus()); %></td></tr>
<tr><td width="120">学院：</td><td><% out.print(personPersonInfo.getCollege()); %></td>			<td width="120">专业编号：</td><td><% out.print(personPersonInfo.getMajorid()); %></td></tr>
<tr><td width="120">手机：</td><td><% out.print(personPersonInfo.getTel()); %></td>				<td width="120">电子邮箱：</td><td><% out.print(personPersonInfo.getEmail()); %></td></tr>
<tr><td width="120">楼号：</td><td><% out.print(personPersonInfo.getBuild()); %></td>			<td width="120">宿舍号：</td><td><% out.print(personPersonInfo.getHostel()); %></td></tr>
<tr><td width="120">身份证号：</td><td><% out.print(personPersonInfo.getIdcard()); %></td>		<td width="120">在校状态：</td><td><% out.print(personPersonInfo.getStatus()); %></td></tr>
</table>

<br/>
<br/>

<div align="center">
<a href="person/person/person_info_modify.jsp" target="dmMain"><input type="button" value="修改"/></a>&#12288&#12288&#12288&#12288&#12288&#12288&#12288&#12288&#12288&#12288
<input onClick="javascript:window.print()" type="button" value="打印"/>
</div>


</body>
</html>












