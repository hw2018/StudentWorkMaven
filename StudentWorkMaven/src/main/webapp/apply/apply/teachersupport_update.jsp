<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="unp.student.work.manager.domain.Support"%>
<%@ include file="../common/head.jsp"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<!--定义基准路径  -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更新活动信息</title>
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
<body>
	<%
		Support support = (Support)request.getAttribute("support");
	%>
	<div class="content-box-header">
		<h3>更新申请信息</h3>
	</div>
	<div class="content-box-content">
		<s:form name="form1" action="apply/apply/save1Support.action" method="post"
			onSubmit="return checkNull()">
		<P>
				学期：<input  value="${support.term}"class="text-input medium-input" type="text"
					name="support.term" /> 
			</P>
			<p>
				专业：<input  value="${support.profession}"class="text-input medium-input" type="text"
					name="support.profession" /> 
			</p>
			<p>
				资助类型：<input  value="${support.supsort}"class="text-input medium-input" type="text"
					name="support.supsort" />
			</p>
			<p>
				申请对象：<input  value="${support.level}"class="text-input medium-input" type="text"
					name="support.level" />	
			</p>
			<p>
				学号：<input  value="${support.studentID}"class="text-input medium-input" type="text"
					name="support.studentID" />
			</p>
			<p>
				审核
				<input type="radio" name="support.status" value="Y"
				  <s:if test='support.status=="Y"'>checked</s:if>>
				审核通过 
				<input type="radio" name="support.status" value="N"
				<s:if test='support.status=="N"'>checked</s:if>>
				审核不通过
			</p>
			<s:hidden name="support.id" />
			<p>
				<input class="button" type="submit" value="修改" /> <input
					class="button" type="reset" value="取消" />
			</p>
		</s:form>
	</div>

</body>
</html>