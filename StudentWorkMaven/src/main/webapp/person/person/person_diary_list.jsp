<%@ page language="java" import="
java.sql.*,
java.net.*,
java.util.List,
java.util.Iterator,
unp.student.work.manager.domain.PersonDiary,
unp.student.work.manager.dao.PersonDiaryPageDao,
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
td.content{font-size:20px;border:thin dashed grey;text-align:center;width:3em; height:1.31em;margin-top:-1.3em;}
td.bottom{border:none;font-size:20px;}
html{overflow-x:hidden;}
table{	border-collapse:collapse;   //使得表格间距为0	}
a{text-decoration:NONE;color:black;}
</style>


</head>
<body style="background-color:dee6f2">

<h2 style="padding:1px;" align="left">日记列表：&#12288&#12288&#12288&#12288&#12288&#12288&#12288&#12288<a href="<%=basePath%>person/person/person_diary_write.jsp" target=dmMain><input type="button" value="写日记"/></a></h2>


<%!
ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml"); 
public PersonDiaryPageDao personDiaryPageDao = (PersonDiaryPageDao)ctx.getBean("personDiaryPageDao");
public int pageSize;  //用来保存每一页的行数
public int pageCount;	//用来保存页数
public int curPage; 
public PersonDiary personDiary;
%>

<%
String studentid = (String)session.getAttribute("studentid"); //获取当前用户的studentid

personDiaryPageDao.initialize(studentid);
pageSize = personDiaryPageDao.getPageSize();  //设置每一页的行数
pageCount = personDiaryPageDao.getPageCount();	//用来保存页数

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

List<PersonDiary> personDiaries = personDiaryPageDao.getPageResult(curPage,studentid);

if(personDiaries!=null)   //因为一开始可能数据库里没有数据，那么即使传递一个不存在的curPage，它也会查找，结果返回null
{
Iterator it = personDiaries.iterator();
%>

<table style="width:100%;">
<tr style="background-color:c6ceda;">
<td class="top" style="width:10%;">ID</td>
<td class="top" style="width:30%;">日记名称</td>
<td class="top" style="width:40%;">创建日期</td>
<td class="top" style="width:20%;">操作</td>
</tr>

<% 
do 
{
personDiary = (PersonDiary)it.next();  //初始时Iterator的指针指向第一个元素之前，第一个next操作使得它指向第一个元素 
%>
<tr>
<td class="content" style="width:10%;"><%=personDiary.getId()%></td>
<td class="content" style="width:30%;"><%=personDiary.getName()%></td>
<td class="content" style="width:40%;"><%=personDiary.getCreatetime()%></td>
<td class="content" style="width:20%;"><a href="<%=basePath%>person/person/person_diary_modify.jsp?personDiaryId=<%=personDiary.getId()%>">编辑&#160|&#160</a>
<a href="<%=basePath%>person/deleteDiary.action?id=<%=personDiary.getId()%>">删除</a></td>
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
<td class="bottom"><a href="<%=basePath%>person/person/person_diary_list.jsp?curPage=1">首页&nbsp|</a></td> 
<td class="bottom"><a href="<%=basePath%>person/person/person_diary_list.jsp?curPage=<%=curPage-1%>">&nbsp上一页&nbsp|&nbsp</a></td> 
<td class="bottom">第<%=curPage%>页/</td> 
<td class="bottom">共<%=pageCount%>页</td>
<td class="bottom"><a href="<%=basePath%>person/person/person_diary_list.jsp?curPage=<%=curPage+1%>">&nbsp|&nbsp下一页</a></td> 
<td class="bottom"><a href="<%=basePath%>person/person/person_diary_list.jsp?curPage=<%=pageCount%>">&nbsp|&nbsp尾页</a></td> 
<td ></td>
<td></td>
</tr>
</table>



</body>
</html>












