<%@ page language="java" import="
java.sql.*,
java.net.*,
java.util.List,
java.util.Iterator,
unp.student.work.manager.domain.Goodsinfoall,
unp.student.work.manager.dao.GoodsinfoallPageDao,
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
</style>

<script type="text/javascript">

</script>
</head>
<body style="background-color:dee6f2">

</div>
<h2 align="left">关键字搜索：</h2>
<form name="form1" method="post" action="<%=basePath%>goods/searchgoodsinfo.action"  style="padding:15px;border:thin dashed black;">
<div>名称：<input class="text-input medium-input" name="searchkey" id="name" type="text" maxlength="50" size="50" />&#12288&#12288&#12288&#12288&#12288&#12288&#12288&#12288&#12288&#12288&#12288<input type="submit" value="搜索"/>&#12288<input type="reset" value="取消"/></div><br/>
</form>

<br/>

<h2 align="left"  style="padding:10px;margin-bottom:5px;">所有物品：</h2>

<%!
ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml"); 
public GoodsinfoallPageDao goodsinfoallPageDao = (GoodsinfoallPageDao)ctx.getBean("goodsinfoallPageDao");
public int pageSize;  //用来保存每一页的行数
public int pageCount;	//用来保存页数
public int curPage; 
public Goodsinfoall goodsinfoall;
%>

<%
String studentid = (String)session.getAttribute("studentid"); //获取当前用户的studentid

goodsinfoallPageDao.initialize();
pageSize = goodsinfoallPageDao.getPageSize();  //设置每一页的行数
pageCount = goodsinfoallPageDao.getPageCount();	//用来保存页数

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


List<Goodsinfoall> goodsinfoallt = goodsinfoallPageDao.getPageResult(curPage);
if(goodsinfoallt!=null)   //因为一开始可能数据库里没有数据，那么即使传递一个不存在的curPage，它也会查找，结果返回null
{
Iterator it = goodsinfoallt.iterator();
%>

<table style="width:100%;">
<tr style="background-color:c6ceda;">
<td class="top" style="width:5%;">id</td>
<td class="top" style="width:15%;">名称</td>
<td class="top" style="width:10%;">单价</td>
<td class="top" style="width:35%;">描述</td>
<td class="top" style="width:15%;">时间</td>
<td class="top" style="width:20%;">联系方式</td>
</tr>

<% 
do 
{
goodsinfoall = (Goodsinfoall)it.next(); //初始时Iterator的指针指向第一个元素之前，第一个next操作使得它指向第一个元素 
%>
<tr>
<td class="content" style="width:5%;"><%=goodsinfoall.getId()%></td>
<td class="content" style="width:15%;"><%=goodsinfoall.getName()%></td>
<td class="content" style="width:10%;"><%=goodsinfoall.getPrice()%></td>
<td class="content" style="width:35%;"><%=goodsinfoall.getDes()%></td>
<td class="content" style="width:15%;"><%=goodsinfoall.getTime()%></td>
<td class="content" style="width:20%;"><%=goodsinfoall.getContact()%></td>
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
<td class="bottom"><a href="<%=basePath%>goods/goods/goods_infoall.jsp?curPage=1">首页&nbsp|</a></td> 
<td class="bottom"><a href="<%=basePath%>goods/goods/goods_infoall.jsp?curPage=<%=curPage-1%>">&nbsp上一页&nbsp|&nbsp</a></td> 
<td class="bottom">第<%=curPage%>页/</td> 
<td class="bottom">共<%=pageCount%>页</td>
<td class="bottom"><a href="<%=basePath%>goods/goods/goods_infoall.jsp?curPage=<%=curPage+1%>">&nbsp|&nbsp下一页</a></td> 
<td class="bottom"><a href="<%=basePath%>goods/goods/goods_infoall.jsp?curPage=<%=pageCount%>">&nbsp|&nbsp尾页</a></td> 
<td ></td>
<td></td>
</tr>
</table>

</body>
</html>












