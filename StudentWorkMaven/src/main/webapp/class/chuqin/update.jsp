<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="unp.student.work.manager.domain.ClassChuqin"%>
<%@ include file="../common/head.jsp"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<!--定义基准路径  -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>add fund</title>
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
	ClassChuqin classchuqin = (ClassChuqin) request.getAttribute("classchuqin");
	%>
	<div class="content-box-header">
		<h3>更新职务信息</h3>
	</div>
	<div class="content-box-content">
		<s:form name="form1" action="save_classChuqin.action" method="post"
			onSubmit="return checkNull()">
			<p>
				课程名称：<input value="${classchuqin.course}" class="text-input medium-input" type="text"
					name="classchuqin.course" />
			</p>
			<p>
				缺勤学生：<input value="${classchuqin.studentid}" class="text-input medium-input" type="text"
					name="classchuqin.studentid" />
			</p>
			<p>
				缺勤日期：<input value="${classchuqin.date}" class="text-input medium-input" type="text"
					name="classchuqin.date" />
			</p>

			
			<s:hidden name="classchuqin.id" />
			<p>
				<input class="button" type="submit" value="修改" /> <input
					class="button" type="reset" value="取消" />
			</p>
		</s:form>
	</div>

</body>
</html>