<%@ page language="java" import="
java.sql.*,
java.net.*,
java.util.List,
java.util.Iterator,
unp.student.work.manager.domain.Goodsrbpall,
unp.student.work.manager.dao.GoodsrbpallPageDao,
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


<br/>

<h2 align="left"  style="padding:10px;margin-bottom:5px;">所有征购：</h2>

<%!
ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml"); 
public GoodsrbpallPageDao goodsrbpallPageDao = (GoodsrbpallPageDao)ctx.getBean("goodsrbpallPageDao");
public int pageSize;  //用来保存每一页的行数
public int pageCount;	//用来保存页数
public int curPage; 
public Goodsrbpall goodsrbpall;
%>

<%
String studentid = (String)session.getAttribute("studentid"); //获取当前用户的studentid

goodsrbpallPageDao.initialize();
pageSize = goodsrbpallPageDao.getPageSize();  //设置每一页的行数
pageCount = goodsrbpallPageDao.getPageCount();	//用来保存页数

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


List<Goodsrbpall> goodsrbpallt = goodsrbpallPageDao.getPageResult(curPage);
if(goodsrbpallt!=null)   //因为一开始可能数据库里没有数据，那么即使传递一个不存在的curPage，它也会查找，结果返回null
{
Iterator it = goodsrbpallt.iterator();
%>

<table style="width:100%;">
<tr style="background-color:c6ceda;">
<td class="top" style="width:5%;">id</td>
<td class="top" style="width:15%;">名称</td>
<td class="top" style="width:10%;">单价</td>
<td class="top" style="width:40%;">描述</td>
<td class="top" style="width:15%;">时间</td>
<td class="top" style="width:15%;">联系方式</td>
</tr>

<% 
do 
{
goodsrbpall = (Goodsrbpall)it.next(); //初始时Iterator的指针指向第一个元素之前，第一个next操作使得它指向第一个元素 
%>
<tr>
<td class="content" style="width:5%;"><%=goodsrbpall.getId()%></td>
<td class="content" style="width:15%;"><%=goodsrbpall.getName()%></td>
<td class="content" style="width:10%;"><%=goodsrbpall.getPrice()%></td>
<td class="content" style="width:40%;"><%=goodsrbpall.getDes()%></td>
<td class="content" style="width:15%;"><%=goodsrbpall.getTime()%></td>
<td class="content" style="width:15%;"><%=goodsrbpall.getContact()%></td>
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
<td class="bottom"><a href="<%=basePath%>goods/goods/goods_rbpall.jsp?curPage=1">首页&nbsp|</a></td> 
<td class="bottom"><a href="<%=basePath%>goods/goods/goods_rbpall.jsp?curPage=<%=curPage-1%>">&nbsp上一页&nbsp|&nbsp</a></td> 
<td class="bottom">第<%=curPage%>页/</td> 
<td class="bottom">共<%=pageCount%>页</td>
<td class="bottom"><a href="<%=basePath%>goods/goods/goods_rbpall.jsp?curPage=<%=curPage+1%>">&nbsp|&nbsp下一页</a></td> 
<td class="bottom"><a href="<%=basePath%>goods/goods/goods_rbpall.jsp?curPage=<%=pageCount%>">&nbsp|&nbsp尾页</a></td> 
<td ></td>
<td></td>
</tr>
</table>

</body>
</html>












