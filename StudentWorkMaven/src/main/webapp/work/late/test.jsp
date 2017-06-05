<%@page import="unp.student.work.manager.utils.PageBean"%>
<%@page import="unp.student.work.manager.domain.late_info" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<!--定义基准路径  -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/StudentWorkMaven/work/jquery-validation-1.16.0\lib\jquery.js"></script>
<script type="text/javascript" src="/StudentWorkMaven/work/jquery-validation-1.16.0\dist\jquery.validate.js"></script>

<title>Insert title here</title>
</head>
<body>
	<h1 align="center">晚点情况</h1>
	<form id="select" name="select"  action="lateinfo/show_lateinfo.action" method="post" >
	负责人学号：<input id="studentid" type="text" class="text-input textarea" name="studentid"/>
    <input type="submit" value="查询"/>
    </form>
	<table>
		<tr>
			<td>晚点编号</td>
			<td>晚点缺勤人数</td>
			<td>晚点时间</td>
			<td>晚点负责人</td>
		</tr>
		<%-- jsp尽量不要调用service或者dao对象, 应该从request里取出对象 --%>
		<tbody>
	<c:forEach var="item" items="${pageBean.data}">
	
		<tr>
			<td><a href="lateinfo/info_lateinfo.action?id=${item.id }">${item.id }</a></td>
			<td><a href="lateinfo/info_lateinfo.action?id=${item.id }">${item.num }</a></td>
			<td><a href="lateinfo/info_lateinfo.action?id=${item.id }">${item.time }</a></td>
			
			<td><a href="lateinfo/info_lateinfo.action?id=${item.id }">${item.personInfo.studentid }</a></td>
			<td class="update"><a name="update" href="lateinfo/info_lateinfo.action?id=${item.id }"> 修改</a></td>
			<td class="delete"><a name="delete" href="lateinfo/delete_lateinfo.action?id=${item.id }"> 删除</a></td>
			
		</tr>
	</c:forEach>
	</tbody>

	</table>
<a id="add" href="work/late/late_add.jsp">新增</a>
<br>
  <form name="PageForm" action="lateinfo/show_lateinfo.action?studentid=${studentid}" method="post">
			<a id="last" name="pageNum" href="lateinfo/show_lateinfo.action?pageno=${pageBean.curPage-1 }&studentid=${studentid}">上一页</a>
			<a id="cur" name="pageNum" href="lateinfo/show_lateinfo.action?pageno=${pageBean.curPage }&studentid=${studentid}">    ${pageBean.curPage }     </a>
			<a id="next" name="pageNum" href="lateinfo/show_lateinfo.action?pageno=${pageBean.curPage+1 }&studentid=${studentid}">下一页</a>
			去第<input type="text" class="text-input textarea" name="pageno"/>页
			<input type="submit"  vlue="确定"/><br>
			
				
		</form>
		
		
<script>
				$(function () {
				
			$("#select").validate( {   
				rules: {
					studentid: {
						required:true
					}
				},
				messages:{
					studentid:"<br>输出正确的学号"
				}
			} );
		});
				
								/*function change(){
				var serach=document.getElementById("search_method").value;
				if(search=="2"){
				document.getElementById("form").innerHTML="~<input Id="to"  type="text" name="search_value_to"/>"
				}
				}*/
		</script>
</body>
</html>
