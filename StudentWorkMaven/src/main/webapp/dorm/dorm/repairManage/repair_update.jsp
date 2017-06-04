<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="unp.student.work.manager.domain.DormRepair"%>
<%@ include file="../../common/head.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<!--定义基准路径  -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>add fund</title>
<%@ include file="../../common/cssjs.inc"%>
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
		DormRepair dormrepair = (DormRepair) request.getAttribute("dormrepair");
	%>
	<div class="content-box-header">
		<h3>审核申请</h3>
	</div>
	<div class="content-box-content">
		<s:form name="form1" action="dorm/repairManage/saveRepair.action" method="post"
			onSubmit="return checkNull()">
		<p>
				编号：<input  value="${dormrepair.id}"class="text-input medium-input" type="text"
					name="dormrepair.id" /> 
			</p>
			<p>
				宿舍号：<input  value="${dormrepair.dormId}"class="text-input medium-input" type="text"
					name="dormrepair.dormId" /> 
			</p>
		
		<p>
				学号：<input  value="${dormrepair.studentId}"class="text-input medium-input" type="text"
					name="dormrepair.studentId" /> 
			</p>
			<p>
				物品编号：<input  value="${dormborrowapply.itemId}"class="text-input medium-input" type="text"
					name="dormrepair.itemId" /> 
			</p>
				<p>
				维修内容：<input  value="${dormrepair.content}"class="text-input medium-input" type="text"
					name="dormrepair.content" /> 
			</p>
			<p>
				反馈：<input  value="${dormrepair.comment}"class="text-input medium-input" type="text"
					name="dormrepair.comment" /> 
			</p>
			<p>
				审核结果("已通过"或"未通过")：
				<s:textfield class="text-input large-input" type="text"
					name="dormrepair.status"></s:textfield>
			</p>
			
			


			
			<p>
				<input class="button" type="submit" value="确认" /> <input
					class="button" type="reset" value="取消" />
			</p>
		</s:form>
	</div>

</body>
</html>