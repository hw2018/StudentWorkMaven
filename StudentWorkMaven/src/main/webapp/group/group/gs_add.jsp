<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>新增社团成员</title>
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
		<h3>新增社团成员</h3>
	</div>
	<div class="content-box-content">
		<form name="form1" action="group/addGStudent.action?type=1" method="post"
			onSubmit="return checkNull()">
			<p>
				成员学号：<input class="text-input medium-input" type="text" name="groupStudent.stuno" />
			</p>
			<p>
				成员职务：<input class="text-input medium-input" type="text" name="groupStudent.job" />
			</p>
			<p>
			<input type="hidden" name="groupStudent.groupId" value="<%=request.getAttribute("id") %>"/>
			</p>
			<p>
				<input class="button" type="submit" value="新增" /> <input
					class="button" type="reset" value="取消" />
			</p>
		</form>
	</div>
</body>
</html>