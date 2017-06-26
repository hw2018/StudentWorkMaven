<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="unp.student.work.manager.domain.Activity"%>
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
		Activity activity = (Activity)request.getAttribute("activity");
	%>
	<div class="content-box-header">
		<h3>更新活动信息</h3>
	</div>
	<div class="content-box-content">
		<s:form name="form1" action="apply/apply/saveActivity.action" method="post"
			onSubmit="return checkNull()">
			<p>
				活动人数：<input  value="${activity.peoplenumber}"class="text-input medium-input" type="text"
					name="activity.peoplenumber" /> 
			</p>
			<p>
				车辆数目：<input  value="${activity.carnumber}"class="text-input medium-input" type="text"
					name="activity.carnumber" /> 
			</p>
			<p>
				带队老师：<input  value="${activity.leadteacher}"class="text-input medium-input" type="text"
					name="activity.leadteacher" /> 
			</p>
			<p>
				负责人：<input  value="${activity.principal}"class="text-input medium-input" type="text"
					name="activity.principal" /> 
			</p>
			
			<s:hidden name="activity.id" />
			<p>
				<input class="button" type="submit" value="修改" /> <input
					class="button" type="reset" value="取消" />
			</p>
		</s:form>
	</div>

</body>
</html>