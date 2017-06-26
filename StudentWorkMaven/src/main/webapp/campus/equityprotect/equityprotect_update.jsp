<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="unp.student.work.manager.domain.Equityprotect"%>
<%@ include file="../common/head.jsp"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<!--定义基准路径  -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更新页面</title>
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
		Equityprotect equityprotect = (Equityprotect) request.getAttribute("equityprotect");
	%>
	<div class="content-box-header">
		<h3>更新维权信息</h3>
	</div>
	<div class="content-box-content">
		<s:form name="form1" action="equityprotect/saveEquityprotect.action" method="post"
			onSubmit="return checkNull()">
			<p>
				申请人姓名：
				<input  value="${equityprotect.name}"class="text-input medium-input" type="text"
					name="equityprotect.name" />
				<!--<s:textfield class="text-input large-input" type="text"
					name="equityprotect.name"></s:textfield>-->
			</p>
			<p>
				性别：
				<input type="radio" name="equityprotect.sex" value="M"
				  <s:if test='equityprotect.sex=="M"'>checked</s:if>>
				男
				<input type="radio" name="equityprotect.sex" value="F"
					<s:if test='equityprotect.sex=="F"'>checked</s:if>>
				女
			</p>
			<p>
				申请权益类型：
				<input type="radio" name="equityprotect.type" value="Y"
				  <s:if test='equityprotect.type=="Y"'>checked</s:if>>
				财产
				<input type="radio" name="equityprotect.type" value="N"
					<s:if test='equityprotect.type=="N"'>checked</s:if>>
				名誉
				<input type="radio" name="equityprotect.type" value="W"
					<s:if test='equityprotect.type=="W"'>checked</s:if>>
				其他事件
			</p>
			<p>
				权益维护描述：
				<input  value="${equityprotect.description}"class="text-input medium-input" type="text"
					name="equityprotect.description" />
				<!--<s:textarea class="text-input textarea" rows="16" cols="50"
					name="equityprotect.description"></s:textarea>-->
			</p>

			<s:hidden name="equityprotect.id" />
			<p>
				<input class="button" type="submit" value="修改" /> <input
					class="button" type="reset" value="取消" />
			</p>
		</s:form>
	</div>

</body>
</html>