<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="unp.student.work.manager.domain.ClassPosition"%>
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
	ClassPosition classposition = (ClassPosition) request.getAttribute("classposition");
	%>
	<div class="content-box-header">
		<h3>更新职务信息</h3>
	</div>
	<div class="content-box-content">
		<s:form name="form1" action="save_classPosition.action" method="post"
			onSubmit="return checkNull()">
			<p>
				职务名称：<input value="${classposition.position}" class="text-input medium-input" type="text"
					name="classposition.position" />
			</p>
			<p>
				学生学号：<input value="${classposition.studentid}" class="text-input medium-input" type="text"
					name="classposition.studentid" />
			</p>
					<P>
				委任时期：<select name="classposition.date" id="terms">
				<option value="2014-2015  第一学期">2014-2015  第一学期</option>
				<option value="2014-2015  第二学期">2014-2015  第二学期</option>
				<option value="2015-2016  第一学期">2015-2016  第一学期</option>
				<option value="2015-2016  第二学期">2015-2016  第二学期</option>
				<option value="2016-2017  第一学期">2016-2017  第一学期</option>
				<option value="2016-2017  第二学期">2016-2017  第二学期</option>
				<option value="2017-2018  第一学期">2017-2018  第一学期</option>
				<option value="2017-2018  第二学期">2017-2018  第二学期</option>				
				</select> 
			</P>

			
			<s:hidden name="classposition.id" />
			<p>
				<input class="button" type="submit" value="修改" /> <input
					class="button" type="reset" value="取消" />
			</p>
		</s:form>
	</div>

</body>
</html>