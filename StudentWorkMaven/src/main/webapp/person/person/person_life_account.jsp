<%@ page language="java" import="
java.sql.*,
java.net.*,
java.util.List,
java.util.Iterator,
unp.student.work.manager.domain.PersonLifeAccount,
unp.student.work.manager.dao.PersonLifeAccountPageDao,
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
td.top{font-size:20px;font-weight:bold;border:thin dashed grey;text-align:center;line-height:30px;}
td.content{font-size:20px;border:thin dashed grey;text-align:center;line-height:30px;}
td.bottom{border:none;font-size:20px;}
html{overflow-x:hidden;}
table{	border-collapse:collapse;   //使得表格间距为0	}
a{text-decoration:NONE;color:black;}
input{background-color:ebf2fb;border:thin solid black;}
textarea{background-color:ebf2fb;border:thin solid black;}
</style>

<script type="text/javascript">
function fun1(id,body,account,password,remark)
{
	//alert(id);
	//alert(name);  //已检测到值传递过来
	//alert(url);
	document.getElementById("modify").style.display = "block";
	document.getElementById("modifyid").value = id;
	document.getElementById("modifybody").value = body;
	document.getElementById("modifyaccount").value = account;
	document.getElementById("modifypassword").value = password;
	document.getElementById("modifyremark").value = remark;
	
	document.getElementById("modifyid").readonly="true";
}

function cancel1()  //命名竟然不能是close，好像是保留字
{
	document.getElementById("modify").style.display = "none";
}

function check1()
{
	var body = document.getElementById("body");
	var account = document.getElementById("account");
	var password = document.getElementById("password");
	
	if(body.value.replace(/^ +| +$/g,"")=="")
		{alert("主体不能为空!");return false;}
	else if(account.value.replace(/^ +| +$/g,"")=="")
		{alert("账号不能为空!");return false;}
	else if(password.value.replace(/^ +| +$/g,"")=="")
		{alert("密码不能为空!");return false;}
}

function check2()
{
	var modifybody = document.getElementById("modifybody");
	var modifyaccount = document.getElementById("modifyaccount");
	var modifypassword = document.getElementById("modifypassword");
	
	if(modifybody.value.replace(/^ +| +$/g,"")=="")
		{alert("主体不能为空!");return false;}
	else if(modifyaccount.value.replace(/^ +| +$/g,"")=="")
		{alert("账号不能为空!");return false;}
	else if(modifypassword.value.replace(/^ +| +$/g,"")=="")
		{alert("密码不能为空!");return false;}
}

</script>
</head>
<body style="background-color:dee6f2">


<!--带关闭按钮的div修改弹窗-->
<div align="center" id="modify" style="display:none;font-height:20px;;color:dddcdc;position:fixed ;margin:auto;left:0px;right:0px;top:0px;bottom:0px;height:300px;width:500px;background-color:4d4c4c;z-index:3;border:thin solid green;"><br/>
<br/>
<form method="post" onsubmit="return check2()" action="<%=basePath%>person/modifyLifeAccount.action">
<lable style="line-height:30px;">ID：&#12288<input onfocus=this.blur() type="text" id = "modifyid" name="id" maxlength="50" size="50"/></lable><br/>  
<lable style="line-height:30px;">主体：<input type="text" id = "modifybody" name="body" maxlength="50" size="50"/></lable><br/>  
<lable style="line-height:30px;">账号：<input type="text" id = "modifyaccount" name="account" maxlength="100" size="50" /></lable><br/>
<lable style="line-height:30px;">密码：<input type="text" id = "modifypassword" name="password" maxlength="50" size="50"/></lable><br/>  
<lable style="line-height:30px;">备注：<input type="text" id = "modifyremark" name="remark" maxlength="50" size="50"/></lable><br/><br/>
<input style="cursor:pointer;" type="submit" value="更新"/>&#12288&#12288
<input onclick="cancel1()" style="cursor:pointer;" type="button" value="取消"/>  
</form>

</div>


<h2 align="left">添加生活账号：</h2>
<form name="form1" method="post" onsubmit="return check1()" action="<%=basePath%>person/addLifeAccount.action" style="padding:15px;border:thin dashed black;">
<table><tr>
<td>
<div>账号主体：<input class="text-input medium-input" name="body" id="body" type="text" maxlength="100" size="30" /></div><br/>
<div>账号名称：<input class="text-input medium-input" name="account" id ="account" type="text" maxlength="100" size="30"/></div><br/>
<div>账号密码：<input class="text-input medium-input" name="password" id ="password" type="text" maxlength="30" size="30"/></div>
</td>

<td>
<div>&#12288&#12288账号备注：&#12288&#12288&#12288&#12288&#12288&#12288&#12288&#12288&#12288&#12288&#12288&#12288&#12288&#12288&#12288<input type="submit" value="添加"/>&#12288&#12288<input type="reset" value="取消"/></div>  <br/>  
<div>&#12288&#12288<textarea class="text-input textarea" name="remark" id="remark" rows="4" cols="55"></textarea></div>
</td>

</tr></table>
</form>


<h2 align="left"  style="margin-bottom:5px;">生活账号列表：</h2>


<%!
ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml"); 
public PersonLifeAccountPageDao personLifeAccountPageDao = (PersonLifeAccountPageDao)ctx.getBean("personLifeAccountPageDao");
public int pageSize;  //用来保存每一页的行数
public int pageCount;	//用来保存页数
public int curPage; 
public PersonLifeAccount personLifeAccount;
%>

<%
String studentid = (String)session.getAttribute("studentid"); //获取当前用户的studentid 

personLifeAccountPageDao.initialize(studentid);
pageSize = personLifeAccountPageDao.getPageSize();  //设置每一页的行数
pageCount = personLifeAccountPageDao.getPageCount();	//用来保存页数

String temp1=request.getParameter("curPage");   //当用户点击首页/上一页/下一页/尾页时传递过来的curPage信息
if(pageCount==0) 
	curPage=0;
else if(temp1==null)									//初始时curPage为null,所以设置curPage=1
	curPage=1;
else
{
	curPage=Integer.parseInt(temp1);  //将字符串temp1装华为整数
	if(curPage>pageCount)
		curPage=pageCount;
	if(curPage<1)
		curPage=1;
}

List<PersonLifeAccount> personLifeAccounts = personLifeAccountPageDao.getPageResult(curPage,studentid);
if(personLifeAccounts!=null)   //因为一开始可能数据库里没有数据，那么即使传递一个不存在的curPage，它也会查找，结果返回null
{
Iterator it = personLifeAccounts.iterator();
%>

<table style="width:100%;">
<tr style="background-color:c6ceda;">
<td class="top" style="width:5%;">ID</td>
<td class="top" style="width:15%;">主体</td>
<td class="top" style="width:15%;">账号</td>
<td class="top" style="width:15%;">密码</td>
<td class="top" style="width:35%;">备注</td>
<td class="top" style="width:15%;">操作</td>
</tr>

<% 
do 
{
personLifeAccount = (PersonLifeAccount)it.next();  //初始时Iterator的指针指向第一个元素之前，第一个next操作使得它指向第一个元素 
%>
<tr>
<td class="content" style="width:5%;"><%=personLifeAccount.getId()%></td>
<td class="content" style="width:15%;"><%=personLifeAccount.getBody()%></td>
<td class="content" style="width:15%;"><%=personLifeAccount.getAccount()%></td>
<td class="content" style="width:15%;"><%=personLifeAccount.getPassword()%></td>
<td class="content" style="width:35%;"><%=personLifeAccount.getRemark()%></td>
<td class="content" style="width:15%;"><a onclick="fun1('<%=personLifeAccount.getId()%>','<%=personLifeAccount.getBody()%>','<%=personLifeAccount.getAccount()%>','<%=personLifeAccount.getPassword()%>','<%=personLifeAccount.getRemark()%>')" style="cursor:pointer;">修改&#160|&#160
</a><a href="<%=basePath%>person/deleteLifeAccount.action?id=<%=personLifeAccount.getId()%>">删除</a></td>
</tr>
<%}
while(it.hasNext());
%>
</table>
<br/>
<%}%>

<table align="center">
<tr><td></td></tr>
<tr>
<td></td>
<td></td>
<td class="bottom"><a href="<%=basePath%>person/person/person_life_account.jsp?curPage=1">首页&nbsp|</a></td> 
<td class="bottom"><a href="<%=basePath%>person/person/person_life_account.jsp?curPage=<%=curPage-1%>">&nbsp上一页&nbsp|&nbsp</a></td> 
<td class="bottom">第<%=curPage%>页/</td> 
<td class="bottom">共<%=pageCount%>页</td>
<td class="bottom"><a href="<%=basePath%>person/person/person_life_account.jsp?curPage=<%=curPage+1%>">&nbsp|&nbsp下一页</a></td> 
<td class="bottom"><a href="<%=basePath%>person/person/person_life_account.jsp?curPage=<%=pageCount%>">&nbsp|&nbsp尾页</a></td> 
<td ></td>
<td></td>
</tr>
</table>

</body>
</html>
























