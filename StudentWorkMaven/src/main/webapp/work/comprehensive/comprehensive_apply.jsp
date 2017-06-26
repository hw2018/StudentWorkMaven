<%@page import="unp.student.work.manager.utils.PageBean"%>
<%@page import="unp.student.work.manager.domain.comprehensive_record" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<!--定义基准路径  -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../common/cssjs.inc"%>
</head>
<body>
	<h1 align="center">综测情况</h1>
	<table>
		<tr>
			<td>综测编号</td>
			<td>学号</td>
			<td>姓名</td>
			<td>记录</td>
			<td>申诉原因</td>
			<td>状态</td>
			<td>操作</td>
		</tr>
		<%-- jsp尽量不要调用service或者dao对象, 应该从request里取出对象 --%>
		<tbody>
	<c:forEach var="item" items="${pageBean.data}">
	
		<tr>
			<td><a href="comprehensive/applyinfo_comprehensive.action?id=${item.id }">${item.id }</a></td>
			<td><a href="comprehensive/applyinfo_comprehensive.action?cid=${item.id }">${item.personInfo.studentid }</a></td>
			<td><a href="comprehensive/applyinfo_comprehensive.action?cid=${item.id }">${item.personInfo.name }</a></td>
			
			<td><a href="comprehensive/applyinfo_comprehensive.action?cid=${item.id }">${item.record }</a></td>
			<td><a href="comprehensive/applyinfo_comprehensive.action?cid=${item.id }">${item.reason }</a></td>
			<td><a href="comprehensive/applyinfo_comprehensive.action?cid=${item.id }">${item.status }</a></td>
			<td class="deal"><a   href="comprehensive/dealapply_comprehensive.action?cid=${item.id }"> 同意</a></td>
			<td class="apply"><a   href="comprehensive/getrecord_comprehensive.action?cid=${item.id }"> 申诉</a></td>
			<td class="delete"><a   href="comprehensive/deleteapply_comprehensive.action?cid=${item.id }"> 删除申诉</a></td>
			
		</tr>
	</c:forEach>
	</tbody>

	</table>
<br>
  <form name="PageForm" action="comprehensive/show_comprehensive.action" method="post">
			<a id="last" name="pageNum" href="comprehensive/show_comprehensive.action?pageno=${pageBean.curPage-1 }">上一页</a>
			<a id="cur" name="pageNum" href="comprehensive/show_comprehensive.action?pageno=${pageBean.curPage }">${pageBean.curPage }</a>
			<a id="next" name="pageNum" href="comprehensive/show_comprehensive.action?pageno=${pageBean.curPage+1 }">下一页</a>
			去第<input type="text"  name="pageno"/>页
			<input type="submit"  vlue="确定"  onclick="return checkpage(this.form)"/>
			
				<script type="text/javascript">
				
				  if(${pageBean.curPage}<=1){
				 var lastbutton=document.getElementById('last');
				 lastbutton.style.visibility="hidden";
				 }
				  if(${pageBean.curPage}>=${pageBean.maxPage}){
				 var nextbutton=document.getElementById('next');
				 nextbutton.style.visibility="hidden";
				  }		
				  
				   var quanxian="${sessionScope.quanxian}";	
				   var manager="${manager}";				  
					 if(quanxian.charAt(3)!='1'){
					  var deal=document.getElementsByClassName('deal');
				 			 for(var i=0;i<deal.length;i++){
				 			 deal[i].style.display="none";
				 			 }
				 	  	}else{
				 	  		if(manager==1){
				 	  			 var delete1=document.getElementsByClassName('delete');
				  				for(var i=0;i<delete1.length;i++){
				 				 delete1[i].style.display="none";
				 	 			 }
				 	 			 var studentid="${sessionScope.studentid}";	
				 	  			 var apply=document.getElementsByClassName('apply');
				 				 for(var i=0;i<apply.length;i++){
				 		 		apply[i].style.display="none";
				 	  			}
				 	  		}else{
				 	  			 var deal=document.getElementsByClassName('deal');
				 			 	for(var i=0;i<deal.length;i++){
				 				 deal[i].style.display="none";
				 			 	}
				 	  		}
				 		  }
				 	  
				 	   
				 	  
				 function checkpage(form) {

			if(isNaN(form.pageno.value)) {
                document.getElementById('errorinfo').innerHTML="页码只能为数字";
                form.pageno.focus();
                return false;
           }
          if(form.pageno.value<=0) {
                 document.getElementById('errorinfo').innerHTML="页码不能小于0";
                form.pageno.focus();
                return false;
           }
       if(form.pageno.value>=${pageBean.maxPage}){
                document.getElementById('errorinfo').innerHTML="页码不能大于最大页";
                form.pageno.focus();
                return false;
         }
         return true;
         } 
				
							/*function change(){
				var serach=document.getElementById("search_method").value;
				if(search=="2"){
				document.getElementById("form").innerHTML="~<input Id="to"  type="text" name="search_value_to"/>"
				}
				}*/
				</script>
		</form>
</body>
</html>