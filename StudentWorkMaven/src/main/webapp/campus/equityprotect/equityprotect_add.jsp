<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<!--定义基准路径  -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>权益维护申请页面</title>
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
		<h3>权益维护申请</h3>
	</div>
	<div class="content-box-content">
		<form name="form1" action="equityprotect/addEquityprotect.action" method="post"
			onSubmit="return checkNull()">
			<p>
				申请人姓名：<input class="text-input medium-input" type="text"
					name="equityprotect.name" />
			</p>
			
			<p>
				性别： <input type="radio" name="equityprotect.sex" value="M"/>男
				<input type="radio" name="equityprotect.sex" value="F" />女
			</p>
			
			<p>
				申请权益类型： <input type="radio" name="equityprotect.type" value="Y"/>财产
				<input type="radio" name="equityprotect.type" value="N" />名誉
				<input type="radio" name="equityprotect.type" value="W" />其他事件
			</p>
			
			<p>
				权益维护描述：
				<textarea class="text-input textarea" rows="16" cols="50"
					name="equityprotect.description"></textarea>
			</p>
			<p>
				<input class="button" type="submit" value="新增" /> 
				<input class="button" type="reset" value="取消" />
			</p>
		</form>
	</div>

</body>
</html>
