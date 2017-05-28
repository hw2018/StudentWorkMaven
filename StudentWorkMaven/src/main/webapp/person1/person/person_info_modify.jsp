<%@ page language="java" import="
unp.student.work.manager.domain.PersonPersonInfo,
unp.student.work.manager.service.PersonInfoService,
org.springframework.context.ApplicationContext,
org.springframework.context.support.ClassPathXmlApplicationContext,
org.hibernate.Session" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<base href="<%=basePath%>">   <!--定义基准路径  -->

<script type="text/javascript" src="person/resources/scripts/jquery.js"></script>
<script type="text/javascript" src="person/resources/scripts/hDate.js"></script>
<link href="person/resources/css/hDate.css" rel="stylesheet" />

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
a{text-decoration:NONE;color:black;}
</style>

</head>
<body style="background-color:dee6f2">
<%!
public PersonPersonInfo personPersonInfo = new PersonPersonInfo();
%>

<% //根据当前HttpSession里的studentid来得到PersonPersonInfo对象
ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml"); 
personPersonInfo = ((PersonInfoService)ctx.getBean("personInfoService")).getPersonInfo((String)session.getAttribute("studentid"));  //根据当前HttpSession里的studentid来得到PersonPersonInfo对象
%>


<br/><br/>
<h1 align="center">修改个人信息表</h1><br/>

<form name="info" method="post" action="person/modifyInfo">
<table align="center" style="table-layout:fixed">
<tr><td width="120">学号：</td><td><input readonly="true" name="personPersonInfoDto.studentid" value="<%=personPersonInfo.getStudentid()%>" type="text" size="30" style="background-color: transparent;border:none;"/></td>											<td width="120">姓名：</td><td><input readonly="true" name="personPersonInfoDto.name" value="<%=personPersonInfo.getName()%>" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">性别：</td><td><input name="personPersonInfoDto.sex" value="<%=personPersonInfo.getSex()%>" type="text" size="30" style="background-color: transparent;border:none;"/></td>		<td width="120">民族：</td><td><input name="personPersonInfoDto.nation" value="<%=personPersonInfo.getNation()%>" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">籍贯：</td><td><input name="personPersonInfoDto.placeofbirth" value="<%=personPersonInfo.getPlaceofbirth()%>" type="text" size="30" style="background-color: transparent;border:none;"/></td>		<td width="120">出生年月：</td><td><input onclick="calendar.show({ id: this })" name="personPersonInfoDto.birthday" value="<%=personPersonInfo.getBirthday()%>" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">年级：</td><td><input name="personPersonInfoDto.grade" value="<%=personPersonInfo.getGrade()%>" type="text" size="30" style="background-color: transparent;border:none;"/></td>		<td width="120">政治状态：</td><td><input name="personPersonInfoDto.politicalstatus" value="<%=personPersonInfo.getPoliticalstatus()%>" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">学院：</td><td><input name="personPersonInfoDto.college" value="<%=personPersonInfo.getCollege()%>" type="text" size="30" style="background-color: transparent;border:none;"/></td>		<td width="120">专业编号：</td><td><input name="personPersonInfoDto.majorid" value="<%=personPersonInfo.getMajorid()%>" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">手机：</td><td><input name="personPersonInfoDto.tel" value="<%=personPersonInfo.getTel()%>" type="text" size="30" style="background-color: transparent;border:none;"/></td>		<td width="120">电子邮箱：</td><td><input name="personPersonInfoDto.email" value="<%=personPersonInfo.getEmail()%>" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">楼号：</td><td><input onKeyUp="value=value.replace(/\D/g,'')" onafterpaste="value=value.replace(/\D/g,'')" name="personPersonInfoDto.build" value="<%=personPersonInfo.getBuild()%>" type="text" size="30" style="background-color: transparent;border:none;"/></td>		<td width="120">宿舍号：</td><td><input name="personPersonInfoDto.hostel" value="<%=personPersonInfo.getHostel()%>" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">身份证号：</td><td><input name="personPersonInfoDto.idcard" value="<%=personPersonInfo.getIdcard()%>" type="text" maxlength="18" size="30" style="background-color: transparent;border:none;"/></td>	<td width="120">在校状态：</td><td><input name="personPersonInfoDto.status" value="<%=personPersonInfo.getStatus()%>" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
</table>
<br/>
<center><input type="submit" value="提交"/>&#12288&#12288&#12288&#12288&#12288&#12288<a href="person/person/person_info.jsp"><input type="button" value="取消"/></a></center>
</form>


</body>
</html>












