<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<%@ page import="unp.student.work.manager.domain.Activity"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<!--定义基准路径  -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增基金页面</title>
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
	<div class="content-box-header">
		<h3>新建活动</h3>
	</div>
	<div class="content-box-content">
		<form name="form1" action="apply/apply/addActivity.action" method="post"
			onSubmit="return checkNull()">
			<p>
				活动人数：<input class="text-input medium-input" type="text"
					name="activity.peoplenumber" />
			</p>
			<p>
				车辆数目：<input class="text-input medium-input" type="text"
					name="activity.carnumber" />
			</p>
			<p>
				带队老师：<input class="text-input medium-input" type="text"
					name="activity.leadteacher" />
			</p>
			<p>
				负责人：<input class="text-input medium-input" type="text"
					name="activity.principal" />
			</p>
			<p>
				<input type="radio" name="activity.status" value="Y" checked />Y
				<input type="radio" name="activity.status" value="N"  />N
			</p>	
			<p>
				<input class="button" type="submit" value="提交" /> <input
					class="button" type="reset" value="取消" />
			</p>
		</form>
	</div>

</body>
</html>