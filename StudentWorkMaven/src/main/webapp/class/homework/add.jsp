<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<!--定义基准路径  -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加作业信息页面</title>
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
		<h3>添加作业信息</h3>
	</div>
	<div class="content-box-content">
		<form name="form1" action="add_classHomework.action" method="post"
			onSubmit="return checkNull()">
			<p>
				课程名称：<input class="text-input medium-input" type="text"
					name="classhomework.course" />
			</p>
			<p>
				作业内容：<input class="text-input medium-input" type="text"
					name="classhomework.content" />
			</p>
			<p>
				发布时间：<input class="text-input medium-input" type="text"
					name="classhomework.startdate" />
			</p>
	
			<p>
				提交时间：<input class="text-input medium-input" type="text"
					name="classhomework.deadline" />
			</p>
			
			<p>
				学生学号：<input class="text-input medium-input" type="text"
					name="classhomework.studentid" />
			</p>

			<p>
				是否提交： <input type="radio" name="classhomework.submit" value="是"/>是
				<input type="radio" name="classhomework.submit" value="否" />否
			</p>
	

			<p>
				<input class="button" type="submit" value="新增" />
				<input class="button" type="reset" value="取消" />
			</p>
		</form>
	</div>

</body>
</html>