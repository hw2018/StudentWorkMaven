<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="unp.student.work.manager.domain.Diningroomcomplaints"%>
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
	Diningroomcomplaints diningroomcomplaints = (Diningroomcomplaints) request.getAttribute("diningroomcomplaints");
	%>
	<div class="content-box-header">
		<h3>更新投诉信息</h3>
	</div>
	<div class="content-box-content">
		<s:form name="form1" action="diningroomcomplaints/saveDiningroomcomplaints.action" method="post"
			onSubmit="return checkNull()">
			<p>
				投诉人姓名：
				<input  value="${diningroomcomplaints.name}"class="text-input medium-input" type="text"
					name="diningroomcomplaints.name" />
				<!--<s:textfield class="text-input large-input" type="text"
					name="diningroomcomplaints.name"></s:textfield>-->
			</p>
			<p>
				食堂名称：
				<input  value="${diningroomcomplaints.diningroom}"class="text-input medium-input" type="text"
					name="diningroomcomplaints.diningroom" />
				<!--<s:textfield class="text-input large-input" type="text"
					name="diningroomcomplaints.dininingroom"></s:textfield>-->
			</p>
			<p>
				投诉类型：
				<input type="radio" name="diningroomcomplaints.type" value="S"
				  <s:if test='diningroomcomplaints.type=="S"'>checked</s:if>>
				食品质量
				<input type="radio" name="equityprotect.type" value="D"
					<s:if test='diningroomcomplaints.type=="D"'>checked</s:if>>
				收费
				<input type="radio" name="equityprotect.type" value="X"
					<s:if test='diningroomcomplaints.type=="X"'>checked</s:if>>
				其他
			</p>
			<p>
				具体理由：
				<input  value="${diningroomcomplaints.reason}"class="text-input medium-input" type="text"
					name="diningroomcomplaints.reason" />	
				<!--<s:textarea class="text-input textarea" rows="16" cols="50"
					name="diningroomcomplaints.reason"></s:textarea>-->
			</p>

			<s:hidden name="diningroomcomplaints.id" />
			<p>
				<input class="button" type="submit" value="修改" /> <input
					class="button" type="reset" value="取消" />
			</p>
		</s:form>
	</div>

</body>
</html>