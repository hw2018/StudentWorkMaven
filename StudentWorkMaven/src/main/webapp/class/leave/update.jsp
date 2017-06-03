<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="unp.student.work.manager.domain.ClassLeave"%>
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
	ClassLeave classleave = (ClassLeave) request.getAttribute("classleave");
	%>
	<div class="content-box-header">
		<h3>更新请假信息</h3>
	</div>
	<div class="content-box-content">
		<s:form name="form1" action="save_classLeave.action" method="post"
			onSubmit="return checkNull()">
	        <p>
				学生学号：<input class="text-input medium-input" type="text"
					name="classleave.studentid" />
			</p>
			<p>
				请假时间：<input class="text-input medium-input" type="text"
					name="classleave.leavedate" />
			</p>
			<p>
				请假原因：<input class="text-input medium-input" type="text"
					name="classleave.leavereason" />
			</p>
	
			<p>
				销假时间：<input class="text-input medium-input" type="text"
					name="classleave.backdate" />
			</p>
			
		<p>
				是否同意： <input type="radio" name="classleave.agree" value="同意"/>是
				<input type="radio" name="classleave.agree" value="不同意" />否
			</p>
			<p>
				辅导员：<input class="text-input medium-input" type="text"
					name="classleave.instructor" />
			</p>
			
			<s:hidden name="classleave.id" />
			<p>
				<input class="button" type="submit" value="修改" /> <input
					class="button" type="reset" value="取消" />
			</p>
		</s:form>
	</div>

</body>
</html>