<%@ page language="java" import="
java.sql.*,
java.net.*,
java.util.List,
java.util.Iterator,
java.text.SimpleDateFormat,
unp.student.work.manager.domain.PersonPersonInfo,
unp.student.work.manager.domain.PersonPlan,
unp.student.work.manager.dao.PersonPlanPageDao,
unp.student.work.manager.service.PersonPlanService,
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

<link href="person/resources/css/datePicker.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="person/resources/scripts/jquery.min.js"></script>
<script type="text/javascript" src="person/resources/scripts/jquery.date_input.pack.js"></script> 

<style type="text/css">
td.top{font-size:20px;font-weight:bold;border:thin dashed grey;text-align:center;line-height:30px;}
td.content{font-size:20px;border:thin dashed grey;text-align:center;line-height:30px;}
td.bottom{border:none;font-size:20px;}
table{	border-collapse:collapse;   //使得表格间距为0	}
a{text-decoration:NONE;color:black;}
select{background-color:ebf2fb;border:thin solid black;}
textarea{background-color:ebf2fb;border:thin solid black;}
html{overflow-x:hidden;height:100%; }
input{background-color:ebf2fb;border:thin solid black;}
</style>

<script type="text/javascript">
function fun1(id,name,start,end,createtime,result,remark)
{
	document.getElementById("modify").style.display = "block";
	document.getElementById("modifyid").value = id;
	document.getElementById("modifyname").value = name;
	document.getElementById("modifystart").value = start;
	document.getElementById("modifyend").value = end;
	document.getElementById("modifycreatetime").value = createtime;
	document.getElementById("modifyresult").value = result;
	document.getElementById("modifyremark").value = remark;
}

function cancel1()  //命名竟然不能是close，好像是保留字
{
	document.getElementById("modify").style.display = "none";
}

function check1()
{
	var start = document.getElementById("start");
	var end = document.getElementById("end");
	if(parseInt(start.value.replace(/-/g,"")) > parseInt(end.value.replace(/-/g,"")))
	{
		alert("开始时间不能大于结束时间！");
		return false;
	}
	
}

function check2()
{
	var start = document.getElementById("modifystart");
	var end = document.getElementById("modifyend");
	if(parseInt(start.value.replace(/-/g,"")) > parseInt(end.value.replace(/-/g,"")))
	{
		alert("开始时间不能大于结束时间！");
		return false;
	}
	
}

</script>


</head>
<body style="background-color:dee6f2">


<script type="text/javascript">   <!-- 必须写在body中 -->
$(function(){
	$('#modifystart').date_input();
	$('#modifyend').date_input();
	$('#start').date_input();
	$('#end').date_input();
	})
</script>


<!--带关闭按钮的div修改弹窗-->
<div align="center" id="modify" style="display:none;font-height:20px;;color:dddcdc;position:fixed ;margin:auto;left:0px;right:0px;top:0px;bottom:0px;height:270px;width:500px;background-color:4d4c4c;z-index:3;border:thin solid green;"><br/>
<br/>
<form method="post" onsubmit="return check2()" action="person/modifyPlan.action">
<lable style="line-height:30px;">计划编号：<input onfocus=this.blur() type="text" id = "modifyid" name="id" maxlength="50" size="50"/></lable><br/>  
<lable style="line-height:30px;">计划名称：<input onblur="if(this.value.replace(/^ +| +$/g,'')=='')alert('名称不能为空!')" type="text" id = "modifyname" name="name" maxlength="50" size="50"/></lable><br/>
<lable style="line-height:30px;">开始时间：<input type="text" id = "modifystart" name="start" maxlength="100" size="10" /></lable>&#12288;&#12288;&#12288;&nbsp;&nbsp;&nbsp;
<lable style="line-height:30px;">结束时间：<input type="text" id = "modifyend" name="end" maxlength="100" size="10" /></lable><br/> 

计划状态：<select id="modifyresult" name="result" style="width:88px;">  
<option value="unfinished">未完成</option> 
<option value="completed">已完成</option> 
</select>
&#12288;&#12288;&#12288;&nbsp;&nbsp;&nbsp;
<lable style="line-height:30px;">创建时间：<input onfocus=this.blur() type="text" id = "modifycreatetime" name="createtime" maxlength="100" size="10" /></lable><br/>  
<lable style="line-height:30px;">计划备注：<input type="text" id = "modifyremark" name="remark" maxlength="50" size="50"/></lable><br/><br/>

<input style="cursor:pointer;" type="submit" value="更新"/>&#12288&#12288
<input onclick="cancel1()" style="cursor:pointer;" type="button" value="取消"/>  
</form>
</div>





<table><tr>
<td>
<h2 align="left">新的计划：</h2>
<form name="form1" method="post" onsubmit="return check1()" action="person/addPlan.action" style="padding:15px;border:thin dashed black;">

<table style="padding:15px;">
<tr>
<td>
<div>计划名称：<input onblur="if(this.value.replace(/^ +| +$/g,'')=='')alert('名称不能为空!')" name="name" id="name1" type="text" maxlength="100" size="30" /></div><br/>
<div>开始时间：<input name="start" id ="start" type="text" maxlength="100" size="30"/></div><br/>
<div>结束时间：<input name="end" id ="end" type="text" maxlength="30" size="30" />
</div>

</td>
<td>
<div>&#12288&#12288计划备注：&#12288&#12288&#12288&#12288&#12288&#12288&#12288&#12288&#12288&#12288&#12288&#12288&#12288&#12288&#12288
<input type="submit" value="添加"/>&#12288&#12288<input type="reset" value="取消"/></div>  <br/>  
<div style="margin-top:-2px;">&#12288&#12288<textarea style="background-color:ebf2fb;border:thin solid black;" name="remark" id="remark" rows="4" cols="55"></textarea></div>
</td>
</tr>
</table>
</form>

</td>


<td style="width:30px;"></td>

<td>
<h2 align="left">计划统计：</h2>
<div style="border:thin dashed black;width:300px;height:135px;">
<br/>
<%
PersonPlanService personPlanServices = (PersonPlanService)ctx.getBean("personPlanService");
int []n = personPlanServices.getStatistics((String)session.getAttribute("studentid"));
%>
&#12288;已完成：<%=n[0]%>项<br/><br/>
&#12288;未完成：<%=n[1]%>项<br/><br/>
&#12288;总数量：<%=n[2]%>项&#12288;&#12288;
&#12288;完成率：<%=(((float)n[0])/((float)n[2]))*100.0f%>%
<br/>
</div>
</td>

</tr>
</table>



<br/>




<h2 align="left">计划列表：</h2><br/>

<%!
ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml"); 
public PersonPlanPageDao personPlanPageDao = (PersonPlanPageDao)ctx.getBean("personPlanPageDao");
public int pageSize;  //用来保存每一页的行数
public int pageCount;	//用来保存页数
public int curPage; 
public PersonPlan personPlan;
%>

<%
String studentid = (String)session.getAttribute("studentid"); //获取当前用户的studentid

personPlanPageDao.initialize(studentid);
pageSize = personPlanPageDao.getPageSize();  //设置每一页的行数
pageCount = personPlanPageDao.getPageCount();	//用来保存页数

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

List<PersonPlan> personPlans = personPlanPageDao.getPageResult(curPage,studentid);
if(personPlans!=null)   //因为一开始可能数据库里没有数据，那么即使传递一个不存在的curPage，它也会查找，结果返回null
{
Iterator it = personPlans.iterator();
%>

<table style="width:100%;">
<tr style="background-color:c6ceda;">
<td class="top" style="width:5%;">id</td>
<td class="top" style="width:20%;">计划名称</td>
<td class="top" style="width:10%;">开始时间</td>
<td class="top" style="width:10%;">结束时间</td>
<td class="top" style="width:15;">创建时间</td>
<td class="top" style="width:20%;">备注</td>
<td class="top" style="width:10%;">状态</td>
<td class="top" style="width:10%;">操作</td>
</tr>

<% 
do 
{
personPlan = (PersonPlan)it.next();  //初始时Iterator的指针指向第一个元素之前，第一个next操作使得它指向第一个元素 
%>
<tr>
<td class="content" style="width:5%;"><%=personPlan.getId()%></td>
<td class="content" style="width:20%;"><%=personPlan.getName()%></td>
<td class="content" style="width:10%;"><%=new SimpleDateFormat("yyyy-MM-dd").format(personPlan.getStart())%></td>
<td class="content" style="width:10%;"><%=new SimpleDateFormat("yyyy-MM-dd").format(personPlan.getEnd())%></td>
<td class="content" style="width:15%;"><%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(personPlan.getCreatetime())%></td>
<td class="content" style="width:20%;"><%=personPlan.getRemark()%></td>
<td class="content" style="width:10%;">
<%
String type = personPlan.getResult();
if(type.equals("completed")) out.println("已完成");
else if(type.equals("unfinished")) out.println("未完成");
%>
</td>
<td class="content" style="width:10%;"><a onclick="fun1('<%=personPlan.getId()%>','<%=personPlan.getName()%>','<%=new SimpleDateFormat("yyyy-MM-dd").format(personPlan.getStart())%>','<%=new SimpleDateFormat("yyyy-MM-dd").format(personPlan.getEnd())%>','<%=new SimpleDateFormat("yyyy-MM-dd").format(personPlan.getCreatetime())%>','<%=personPlan.getResult()%>','<%=personPlan.getRemark()%>')" style="cursor:pointer;">修改&#160|&#160
</a><a href="<%=basePath%>person/deletePlan.action?id=<%=personPlan.getId()%>">删除</a></td>
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
<td class="bottom"><a href="<%=basePath%>person/person/person_plan.jsp?curPage=1">首页&nbsp|</a></td> 
<td class="bottom"><a href="<%=basePath%>person/person/person_plan.jsp?curPage=<%=curPage-1%>">&nbsp上一页&nbsp|&nbsp</a></td> 
<td class="bottom">第<%=curPage%>页/</td> 
<td class="bottom">共<%=pageCount%>页</td>
<td class="bottom"><a href="<%=basePath%>person/person/person_plan.jsp?curPage=<%=curPage+1%>">&nbsp|&nbsp下一页</a></td> 
<td class="bottom"><a href="<%=basePath%>person/person/person_plan.jsp?curPage=<%=pageCount%>">&nbsp|&nbsp尾页</a></td> 
<td ></td>
<td></td>
</tr>
</table>



</body>
</html>












