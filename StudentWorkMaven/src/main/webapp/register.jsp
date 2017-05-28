<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>		
 
 
<link href="person/resources/css/datePicker.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="person/resources/scripts/jquery.min.js"></script>
<script type="text/javascript" src="person/resources/scripts/jquery.date_input.pack.js"></script> 
 
 
<base href="<%=basePath%>">		
<title>福州大学学生综合管理系统</title>	
<style type="text/css">
a{color:black;font-size:15px;font-fimily:楷体;text-decoration:none;}
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

<script type="text/javascript">
function error()
{
	var exist = "<%=session.getAttribute("exist")%>";
	if(exist==1)
		alert("账号已存在，请重新注册！");
}
function check()
{
	var studentid = document.getElementById("studentid");
	var name = document.getElementById("name");
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
	
	if(studentid.value.replace(/^ +| +$/g,"")=="" || studentid.value.length!=9 || studentid.value.replace(/\d/g,"")!="")
		{alert("学号不符合规范!");return false;}
	else if(name.value.replace(/^ +| +$/g,"")=="" )
		{alert("姓名不能为空!");return false;}
	else if(sex.value!="男" && sex.value!="女")
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
<link rel="stylesheet" href="person/resources/css/login.css">
</head>	
<body onload="error()" style="z-index:1;background-image:url(person/resources/images/bc.png);background-repeat:no-repeat;background-position:center;">
<%session.setAttribute("exist",0);%>
<br/>

<script type="text/javascript">   <!-- 必须写在body中 -->
$(function(){
	$('#birthday').date_input();
	})
</script>


<h1 align="center">注册个人信息</h1>

<form name="info" method="post" onsubmit="return check()" action="userRegister.action">
<table align="center" style="table-layout:fixed">
<tr><td width="120">学号：</td><td><input name="personPersonInfoDto2.studentid" id="studentid" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">姓名：</td><td><input name="personPersonInfoDto2.name" id="name" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">性别：</td><td><input name="personPersonInfoDto2.sex"  id="sex" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">民族：</td><td><input name="personPersonInfoDto2.nation"  id="nation" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">籍贯：</td><td><input name="personPersonInfoDto2.placeofbirth" id="placeofbirth" type="text" size="30" style="background-color: transparent;border:none;"/></td>	</tr>
<tr><td width="120">出生年月：</td><td><input name="personPersonInfoDto2.birthday" id="birthday" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">年级：</td><td><input name="personPersonInfoDto2.grade" id="grade" type="text" size="30" style="background-color: transparent;border:none;"/></td>		</tr>
<tr><td width="120">政治状态：</td><td><input name="personPersonInfoDto2.politicalstatus" id="politicalstatus" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">学院：</td><td><input name="personPersonInfoDto2.college" id="college" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">专业编号：</td><td><input name="personPersonInfoDto2.majorid" id="majorid" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">手机：</td><td><input name="personPersonInfoDto2.tel" id="tel" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">电子邮箱：</td><td><input name="personPersonInfoDto2.email" id="email" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">楼号：</td><td><input name="personPersonInfoDto2.build" id="build" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">宿舍号：</td><td><input name="personPersonInfoDto2.hostel" id="hostel" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">身份证号：</td><td><input name="personPersonInfoDto2.idcard" id="idcard" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">在校状态：</td><td><input name="personPersonInfoDto2.status" id="status" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">密码：</td><td><input name="personPersonInfoDto2.password" type="text" maxlength="30" size="30" style="background-color: transparent;border:none;"/></td>	</tr>
</table>
<br/>
<center><input type="submit" value="提交"/><a href="login.jsp">&#12288;&#12288;<input type="button" value="取消"/></a></center>
</form>




</body>
</html>
