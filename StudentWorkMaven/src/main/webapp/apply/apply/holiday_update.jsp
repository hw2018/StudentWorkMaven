<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List,unp.student.work.manager.domain.Holiday"%>
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
		Holiday holiday = (Holiday)request.getAttribute("holiday");
	%>
	<div class="content-box-header">
		<h3>更新基金信息</h3>
	</div>
	<div class="content-box-content">
		<s:form name="form1" action="apply/apply/saveHoliday.action" method="post"
			onSubmit="return checkNull()">
			<p>
				留校开始日期：<input class="text-input medium-input" type="text"
					name="holiday.starttime" />
			</p>
			
			<p>
				留校结束日期：<input class="text-input medium-input" type="text"
					name="holiday.endtime" />
			</p>
			<p>
				联系电话：<input class="text-input medium-input" type="text"
					name="holiday.phone" />
			</p>
			<p>
				留宿宿舍：<input class="text-input medium-input" type="text"
					name="activity.principal" />
			</p>
			<p>
				申请原因：<select name="holiday.statement" id="statement">
				<option value="实习">实习</option>
				<option value="课题实验">课题实验</option>
				<option value="其他">其他</option>			
				</select>
			</p>
			<p>
				<input class="button" type="submit" value="修改" /> <input
					class="button" type="reset" value="取消" />
			</p>
		</s:form>
	</div>
</body>
</html>