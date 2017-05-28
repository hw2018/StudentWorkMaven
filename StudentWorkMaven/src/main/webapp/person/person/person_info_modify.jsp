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

<link href="person/resources/css/datePicker.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="person/resources/scripts/jquery.min.js"></script>
<script type="text/javascript" src="person/resources/scripts/jquery.date_input.pack.js"></script> 

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


<script type="text/javascript">
function check()
{
	var sex = document.getElementById("sex");
	var nation = document.getElementById("nation");
	var placeofbirth = document.getElementById("placeofbirth");
	var birthday = document.getElementById("birthday");
	var grade = document.getElementById("grade");
	var politicalstatus = document.getElementById("politicalstatus");
	var college = document.getElementById("college");
	var majorid = document.getElementById("majorid");
	var tel = document.getElementById("tel");
	var email = document.getElementById("email");
	var build = document.getElementById("build");
	var hostel = document.getElementById("hostel");
	var idcard = document.getElementById("idcard");
	var status = document.getElementById("status");
	
	if(sex.value!="男" && sex.value!="女")
		{alert("性别不符合规范！");return false;}
	else if(nation.value.replace(/^ +| +$/g,"")=="")
		{alert("民族不能为空!");return false;}
	else if(placeofbirth.value.replace(/^ +| +$/g,"")=="")
		{alert("籍贯不能为空!");return false;}
	else if(birthday.value.replace(/^ +| +$/g,"")=="")
		{alert("出生年月不能为空!");return false;}
	else if(grade.value.replace(/^ +| +$/g,"")=="" || grade.value.length!=4 || parseInt(grade.value)>2018 || grade.value.replace(/\d/g,"")!="")
		{alert("年级不符合规范!");return false;}
	else if(politicalstatus.value.replace(/^ +| +$/g,"")=="")
		{alert("政治状态不能为空!");return false;}
	else if(college.value.replace(/^ +| +$/g,"")=="")
		{alert("学院不能为空!");return false;}
	else if(majorid.value.replace(/^ +| +$/g,"")=="" || majorid.value.length!=2 || majorid.value.replace(/\d/g,"")!="")
		{alert("专业编号不符合规范!");return false;}
	else if(tel.value.replace(/^ +| +$/g,"")=="" || tel.value.replace(/[\d]/g,"")!="" || tel.value.length!=11)
		{alert("手机号码不符合规范!");return false;}
	else if(email.value.replace(/^ +| +$/g,"")=="" || email.value.match(/^(.+)@(.+)$/)==null )
		{alert("电子邮件不符合规范!");return false;}
	else if(build.value.replace(/^ +| +$/g,"")=="" || build.value.length > 2 || build.value.replace(/\d/g,"")!="")
		{alert("楼号不符合规范");return false;}
	else if(hostel.value.replace(/^ +| +$/g,"")=="" || hostel.value.length != 3 || hostel.value.replace(/\d/g,"")!="")
		{alert("宿舍号不符合规范");return false;}
	else if(idcard.value.replace(/^ +| +$/g,"")=="" || idcard.value.length != 18 || idcard.value.replace(/\d/g,"")!="")
		{alert("身份证号不符合规范!");return false;}
	else if(status.value.replace(/^ +| +$/g,"")=="")
		{alert("在校状态不能为空!");return false;}
	
}

</script>


</head>
<body style="background-color:dee6f2">

<script type="text/javascript">   <!-- 必须写在body中 -->
$(function(){
	$('#birthday').date_input();
	})
</script>


<%!
public PersonPersonInfo personPersonInfo = new PersonPersonInfo();
%>

<% //根据当前HttpSession里的studentid来得到PersonPersonInfo对象
ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml"); 
personPersonInfo = ((PersonInfoService)ctx.getBean("personInfoService")).getPersonInfo((String)session.getAttribute("studentid"));  //根据当前HttpSession里的studentid来得到PersonPersonInfo对象
%>


<br/><br/>
<h1 align="center">修改个人信息表</h1><br/>

<form name="info" method="post" onsubmit="return check()" action="person/modifyInfo.action">
<table align="center" style="table-layout:fixed">
<tr><td width="120">学号：</td><td><input readonly="true" name="personPersonInfoDto.studentid" value="<%=personPersonInfo.getStudentid()%>" type="text" size="30" style="background-color: transparent;border:none;"/></td>											<td width="120">姓名：</td><td><input readonly="true" name="personPersonInfoDto.name" value="<%=personPersonInfo.getName()%>" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">性别：</td><td><input name="personPersonInfoDto.sex" id="sex" value="<%=personPersonInfo.getSex()%>" type="text" size="30" style="background-color: transparent;border:none;"/></td>		<td width="120">民族：</td><td><input name="personPersonInfoDto.nation" id="nation" value="<%=personPersonInfo.getNation()%>" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">籍贯：</td><td><input name="personPersonInfoDto.placeofbirth" id="placeofbirth" value="<%=personPersonInfo.getPlaceofbirth()%>" type="text" size="30" style="background-color: transparent;border:none;"/></td>		<td width="120">出生年月：</td><td><input id="birthday" name="personPersonInfoDto.birthday" value="<%=personPersonInfo.getBirthday()%>" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">年级：</td><td><input name="personPersonInfoDto.grade" id="grade" value="<%=personPersonInfo.getGrade()%>" type="text" size="30" style="background-color: transparent;border:none;"/></td>		<td width="120">政治状态：</td><td><input name="personPersonInfoDto.politicalstatus" id="politicalstatus" value="<%=personPersonInfo.getPoliticalstatus()%>" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">学院：</td><td><input name="personPersonInfoDto.college" id="college" value="<%=personPersonInfo.getCollege()%>" type="text" size="30" style="background-color: transparent;border:none;"/></td>		<td width="120">专业编号：</td><td><input name="personPersonInfoDto.majorid" id="majorid" value="<%=personPersonInfo.getMajorid()%>" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">手机：</td><td><input name="personPersonInfoDto.tel" id="tel" value="<%=personPersonInfo.getTel()%>" type="text" size="30" style="background-color: transparent;border:none;"/></td>		<td width="120">电子邮箱：</td><td><input name="personPersonInfoDto.email" id="email" value="<%=personPersonInfo.getEmail()%>" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">楼号：</td><td><input name="personPersonInfoDto.build" id="build" value="<%=personPersonInfo.getBuild()%>" type="text" size="30" style="background-color: transparent;border:none;"/></td>		<td width="120">宿舍号：</td><td><input name="personPersonInfoDto.hostel" id="hostel" value="<%=personPersonInfo.getHostel()%>" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">身份证号：</td><td><input name="personPersonInfoDto.idcard" id="idcard" value="<%=personPersonInfo.getIdcard()%>" type="text" maxlength="18" size="30" style="background-color: transparent;border:none;"/></td>	<td width="120">在校状态：</td><td><input name="personPersonInfoDto.status" id="status" value="<%=personPersonInfo.getStatus()%>" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
</table>
<br/>
<center><input type="submit" value="提交"/>&#12288&#12288&#12288&#12288&#12288&#12288<a href="person/person/person_info.jsp"><input type="button" value="取消"/></a></center>
</form>


</body>
</html>












