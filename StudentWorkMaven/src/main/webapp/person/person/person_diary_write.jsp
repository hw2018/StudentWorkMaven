﻿<%@ page language="java" import="
java.sql.*,
java.net.*,
java.util.List,
java.util.Iterator,
unp.student.work.manager.domain.PersonDiary,
unp.student.work.manager.service.PersonDiaryService,
org.springframework.context.ApplicationContext,
org.springframework.context.support.ClassPathXmlApplicationContext,
org.hibernate.Session,org.hibernate.Query" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>

<style type="text/css">
html{overflow-x:hidden;}
table{border:thin solid black;}
div.content{ margin:0 auto;} 
input.title{text-align:center;border:none;font-family: 微软雅黑; font-size: 20px; font-weight: normal; background-color: transparent;}
</style>

<script type="text/javascript">

function replace1(str){
var reg=new RegExp("\r\n","g"); 
var reg1=new RegExp(" ","g"); 
str = str.replace(reg,"<br>"); 
str = str.replace(reg1,"<p>"); 
return str; 
}

function getdiv()
{
	var content = document.getElementById("content").innerText;
	document.getElementById("tempcontent").setAttribute("value",replace1(content));
}

function check()
{
	var name = document.getElementById("name");
	if(name.value.replace(/^ +| +$/g,"")=="")
		{alert("标题不能为空!");return false;}
}

</script>



</head>

<body style="background-color:dee6f2">

<h2 align="left">日记本：</h2>

<form name="form1" method="post" onsubmit="return check()" action="<%=basePath%>person/addDiary.action"> 
<div style="position:relative; margin:0 auto;width:800px;">
&#12288&#12288&#12288&#12288&#12288&#12288  
<input id="name" class="title" type="text" name="name" size="50" maxlength="128" placeholder="请在这里输入日记标题" />
<input id="tempcontent" name="content" type="hidden"/>
<input onclick="getdiv()" type="submit" value="保存"/>&#12288&#12288<a href="<%=basePath%>person/person/person_diary_list.jsp" target="dmMain"><input type="button" value="返回日记列表"/></a>
</div>
<br/>
<!-- 编辑的内容就在div中，把div放到form中通过form的提交传递给Action -->
<div class="content" id="content" contenteditable="true" style="background-color:white;width:800px;min-height:600px;padding:20px;border:thin dashed black"></div> 
</form> 



</body>
</html>












