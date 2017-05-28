<%@ page language="java" import="
java.sql.*,
java.net.*,
java.util.List,
java.util.Iterator,
unp.student.work.manager.domain.Goodsrbpmy,
unp.student.work.manager.dao.GoodsrbpmyPageDao,
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
function fun1(id,name,price,contact,des)
{
	//alert(id);
	//alert(name);  //已检测到值传递过来
	//alert(url);
	document.getElementById("modify").style.display = "block";
	document.getElementById("modifyid").value = id;
	document.getElementById("modifyname").value = name;
	document.getElementById("modifyprice").value = price;
	document.getElementById("modifycontact").value = contact;
	document.getElementById("modifydes").value = des;
	document.getElementById("modifyid").readonly="true";
	
}

function cancel1()  //命名竟然不能是close，好像是保留字
{
	document.getElementById("modify").style.display = "none";
}


</script>
</head>
<body style="background-color:dee6f2">


<!--带关闭按钮的div修改弹窗-->
<div align="center" id="modify" style="display:none;font-height:20px;;color:dddcdc;position:fixed ;margin:auto;left:0px;right:0px;top:0px;bottom:0px;height:260px;width:500px;background-color:4d4c4c;z-index:3;border:thin solid green;"><br/>
<br/>
<form method="post" action="<%=basePath%>goods/modifygoodsrbp.action">
<lable style="line-height:30px;">&#12288ID：&#12288&#12288<input onfocus=this.blur() type="text" id = "modifyid" name="id" maxlength="50" size="50"/></lable><br/>  
<lable style="line-height:30px;">&#12288名称：&#12288<input type="text" id = "modifyname" name="name" maxlength="50" size="50"/></lable><br/>  
<lable style="line-height:30px;">&#12288单价：&#12288<input type="text" id = "modifyprice" name="price" maxlength="50" size="50"/></lable><br/>  
<lable style="line-height:30px;">联系方式：<input type="text" id = "modifycontact" name="contact" maxlength="50" size="50"/></lable><br/>  
<lable style="line-height:30px;">&#12288描述：&#12288<input type="text" id = "modifydes" name="des" maxlength="200" size="50"/></lable><br/> 
<br/>
<input style="cursor:pointer;" type="submit" value="更新"/>&#12288&#12288
<input onclick="cancel1()" style="cursor:pointer;" type="button" value="取消"/>  
</form>

</div>


<h2 align="left">添加征购：</h2>
<form name="form1" method="post" action="<%=basePath%>goods/addgoodsrbp.action"  style="padding:15px;border:thin dashed black;">
<div>名称：<input class="text-input medium-input" name="name" id="name" type="text" maxlength="50" size="50" />&#12288&#12288&#12288&#12288&#12288&#12288&#12288&#12288&#12288&#12288&#12288<input type="submit" value="添加"/>&#12288<input type="reset" value="取消"/></div><br/>
<div>单价：<input class="text-input medium-input" name="price" id ="price" type="text" maxlength="50" size="50" /></div><br/>
<div>联系方式：<input class="text-input medium-input" name="contact" id ="contact" type="text" maxlength="50" size="50" /></div><br/>
<div>描述：<input class="text-input medium-input" name="des" id ="des" type="text" maxlength="20" size="100" /></div>
</form>

<br/>

<h2 align="left"  style="padding:10px;margin-bottom:5px;">我的征购：</h2>

<%!
ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml"); 
public GoodsrbpmyPageDao goodsrbpmyPageDao = (GoodsrbpmyPageDao)ctx.getBean("goodsrbpmyPageDao");
public int pageSize;  //用来保存每一页的行数
public int pageCount;	//用来保存页数
public int curPage; 
public Goodsrbpmy goodsrbpmy;
%>

<%
String studentid = (String)session.getAttribute("studentid"); //获取当前用户的studentid

goodsrbpmyPageDao.initialize(studentid);
pageSize = goodsrbpmyPageDao.getPageSize();  //设置每一页的行数
pageCount = goodsrbpmyPageDao.getPageCount();	//用来保存页数

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


List<Goodsrbpmy> goodsrbpmyt = goodsrbpmyPageDao.getPageResult(curPage,studentid);
if(goodsrbpmyt!=null)   //因为一开始可能数据库里没有数据，那么即使传递一个不存在的curPage，它也会查找，结果返回null
{
Iterator it = goodsrbpmyt.iterator();
%>

<table style="width:100%;">
<tr style="background-color:c6ceda;">
<td class="top" style="width:5%;">id</td>
<td class="top" style="width:15%;">名称</td>
<td class="top" style="width:10%;">单价</td>
<td class="top" style="width:40%;">描述</td>
<td class="top" style="width:15%;">时间</td>
<td class="top" style="width:15%;">操作</td>
</tr>

<% 
do 
{
goodsrbpmy = (Goodsrbpmy)it.next(); //初始时Iterator的指针指向第一个元素之前，第一个next操作使得它指向第一个元素 
%>
<tr>
<td class="content" style="width:5%;"><%=goodsrbpmy.getId()%></td>
<td class="content" style="width:15%;"><%=goodsrbpmy.getName()%></td>
<td class="content" style="width:10%;"><%=goodsrbpmy.getPrice()%></td>
<td class="content" style="width:40%;"><%=goodsrbpmy.getDes()%></td>
<td class="content" style="width:15%;"><%=goodsrbpmy.getTime()%></td>
<td class="content" style="width:15%;"><a onclick="fun1('<%=goodsrbpmy.getId()%>','<%=goodsrbpmy.getName()%>','<%=goodsrbpmy.getPrice()%>','<%=goodsrbpmy.getContact()%>','<%=goodsrbpmy.getDes()%>')" style="cursor:pointer;">修改&#160|&#160
</a><a href="<%=basePath%>goods/deletegoodsrbp.action?id=<%=goodsrbpmy.getId()%>">删除</a></td>
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
<td class="bottom"><a href="<%=basePath%>goods/goods/goods_rbpmy.jsp?curPage=1">首页&nbsp|</a></td> 
<td class="bottom"><a href="<%=basePath%>goods/goods/goods_rbpmy.jsp?curPage=<%=curPage-1%>">&nbsp上一页&nbsp|&nbsp</a></td> 
<td class="bottom">第<%=curPage%>页/</td> 
<td class="bottom">共<%=pageCount%>页</td>
<td class="bottom"><a href="<%=basePath%>goods/goods/goods_rbpmy.jsp?curPage=<%=curPage+1%>">&nbsp|&nbsp下一页</a></td> 
<td class="bottom"><a href="<%=basePath%>goods/goods/goods_rbpmy.jsp?curPage=<%=pageCount%>">&nbsp|&nbsp尾页</a></td> 
<td ></td>
<td></td>
</tr>
</table>

</body>
</html>












