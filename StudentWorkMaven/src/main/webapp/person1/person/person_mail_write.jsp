<%@ page language="java" import="
java.sql.*,
java.net.*,
java.util.List,
java.util.Iterator,
unp.student.work.manager.dao.PersonMailAccountDao,
unp.student.work.manager.domain.PersonMailAccount,
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
div.content{margin-left:65px;margin-top:-20px;} 
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

</script>



</head>

<body style="background-color:dee6f2">

<h2 align="left">写邮件：</h2>

<form name="form1" method="post" action="<%=basePath%>person/sendMail"> 
发件人：<select name="from" style="width:330px;">
<%
ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml"); 
PersonMailAccountDao personMailAccountDao = (PersonMailAccountDao)ctx.getBean("personMailAccountDao");
List<PersonMailAccount> personMailAccounts = personMailAccountDao.getAccounts((String)session.getAttribute("studentid"));
PersonMailAccount personMailAccount;
if(personMailAccounts!=null)   //因为一开始可能数据库里没有数据，那么即使传递一个不存在的curPage，它也会查找，结果返回null
{
Iterator it = personMailAccounts.iterator();

do 
{
personMailAccount = (PersonMailAccount)it.next();  //初始时Iterator的指针指向第一个元素之前，第一个next操作使得它指向第一个元素 
%>
<option><%=personMailAccount.getAddress() %></option>
<%}
while(it.hasNext());
}
%>

</select><br/><br/>
收件人：<input id="name" type="text" name="to" size="50" maxlength="128" /><br/><br/>
主&#12288;题：<input id="name" type="text" name="subject" size="50" maxlength="128" />
<input id="tempcontent" name="content" type="hidden"/>&#12288;&#12288;
<input onclick="getdiv()" type="submit" value="发送"/>&#12288;&#12288;<a href="<%=basePath%>person/person/person_mail_list.jsp" target="dmMain"><input type="button" value="返回邮箱账号列表"/></a>

<br/><br/>
<!-- 编辑的内容就在div中，把div放到form中通过form的提交传递给Action -->
正&#12288;文：<br/><div class="content" id="content" contenteditable="true" style="background-color:white;width:800px;min-height:600px;padding:20px;border:thin dashed black"></div> 
</form> 



</body>
</html>












