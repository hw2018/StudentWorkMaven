<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="unp.student.work.manager.domain.Lostandfound"%>
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
		Lostandfound lostandfound = (Lostandfound) request.getAttribute("lostandfound");
	%>
	<div class="content-box-header">
		<h3>更新失物信息</h3>
	</div>
	<div class="content-box-content">
		<s:form name="form1" action="lostandfound/saveLostandfound.action" method="post"
			onSubmit="return checkNull()">
			<p>
				申请人姓名：
				<input  value="${lostandfound.name}"class="text-input medium-input" type="text"
					name="lostandfound.name" />
				<!--<s:textfield class="text-input large-input" type="text"
					name="lostandfound.name"></s:textfield>-->
			</p>
			<p>
				失物类型：
				<input type="radio" name="lostandfound.type" value="Q"
				  <s:if test='lostandfound.type=="Q"'>checked</s:if>>
				财产
				<input type="radio" name="lostandfound.type" value="G"
					<s:if test='lostandfound.type=="G"'>checked</s:if>>
				物品
			</p>
			<p>
				归还地点：
				<input  value="${lostandfound.tradeplace}"class="text-input medium-input" type="text"
					name="lostandfound.tradeplace" />
				<!--<s:textfield class="text-input large-input" type="text"
					name="lostandfound.tradeplace"></s:textfield>-->
			</p>
			<p>
				联系方式：
				<input  value="${lostandfound.tradetype}"class="text-input medium-input" type="text"
					name="lostandfound.tradetype" />
				<!--<s:textfield class="text-input large-input" type="text"
					name="lostandfound.tradetype"></s:textfield>-->
			</p>
			<p>
				权益维护描述：
				<input  value="${lostandfound.description}"class="text-input medium-input" type="text"
					name="lostandfound.description" />
				<!--<s:textarea class="text-input textarea" rows="16" cols="50"
					name="lostandfound.description"></s:textarea>-->
			</p>

			<s:hidden name="lostandfound.id" />
			<p>
				<input class="button" type="submit" value="修改" /> <input
					class="button" type="reset" value="取消" />
			</p>
		</s:form>
	</div>

</body>
</html>