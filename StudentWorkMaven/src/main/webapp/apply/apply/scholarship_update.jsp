<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="unp.student.work.manager.domain.Scholarship"%>
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
		Scholarship scholarship = (Scholarship)request.getAttribute("scholarship");
	%>
	<div class="content-box-header">
		<h3>更新申请信息</h3>
	</div>
	<div class="content-box-content">
		<s:form name="form1" action="apply/apply/saveScholarship.action" method="post"
			onSubmit="return checkNull()">
			<p>
				学期：<input class="text-input medium-input" type="text"
					name="scholarship.term" />
			</p>
			<p>
				学号：<input class="text-input medium-input" type="text"
					name="scholarship.studentID" />
			</p>
			<p>
				专业：<input class="text-input medium-input" type="text"
					name="scholarship.profession" />
			</p>
			<p>
				奖学金种类：<input class="text-input medium-input" type="text"
					name="scholarship.schsort" />
			</p>
			<p>
				<input class="button" type="submit" value="修改" /> <input
					class="button" type="reset" value="取消" />
			</p>
		</s:form>
	</div>

</body>
</html>