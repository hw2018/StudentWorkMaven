<%@page import="unp.student.work.manager.utils.PageBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<%@page import="java.util.List,unp.student.work.manager.domain.ClassActivity"%>
<%@page import="unp.student.work.manager.dao.ClassActivityDao"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<!--定义基准路径  -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>申请活动页面</title>
<%@ include file="../common/cssjs.inc"%>
<script language="javascript">
	function checkNull() {
		/*判断是否有空内容*/
		for (i = 0; i < form1.length; i++) {
			if (form1.elements[i].value == "") {
				alert(form1.elements[i].title + "不能为空!");
				form1.elements[i].focus();
				return false;
			}
		}
	}
</script>
</head>


	<%
			//FundDao fundDao=new FundDaoJDBCImpl();
			//List<Fund> funds=fundDao.findAll();
			PageBean pageBean = (PageBean) request.getAttribute("pageBean"); //important!
		%>

<h1 align="center">详细活动内容</h1>
<form name="form2" method="post" action="<%=basePath%>person/modifyDiary"> 
	
<div style="position:relative; margin:0 auto;width:800px;"></div>
<a href="<%=basePath%>person/person/person_diary_list.jsp" target="dmMain"><input type="button" value="返回日记列表"/></a>
	<s:iterator value="#request.pageBean.data" var="f" status="st">
<div class="content" id="content" contenteditable="true" style="background-color:white;width:800px;min-height:600px;padding:20px;border:thin dashed black"><s:property value="#f.content"/></div>


	</s:iterator> 
</form> 



















</html>