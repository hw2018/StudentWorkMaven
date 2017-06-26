<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<!--定义基准路径  -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>食堂投诉页面</title>
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
		<h3>食堂投诉页面</h3>
	</div>
	<div class="content-box-content">
		<form name="form1" action="diningroomcomplaints/addDiningroomcomplaints.action" method="post"
			onSubmit="return checkNull()">
			<p>
				投诉人姓名：<input value="${diningroomcomplaints.name}"class="text-input medium-input" type="text"
					name="diningroomcomplaints.name" />
			</p>
			<p>
				食堂名称： <input value="${diningroomcomplaints.diningroom}"class="text-input medium-input" type="text"
					name="diningroomcomplaints.diningroom" />
			</p>
			<p>
				投诉类型： <input type="radio" name="diningroomcomplaints.type" value="S"/>食品质量
				<input type="radio" name="diningroomcomplaints.type" value="D" />收费
				<input type="radio" name="diningroomcomplaints.type" value="X" />其他
			</p>
			<p>
				具体理由：
				<input  class="text-input medium-input" type="text"
					name="diningroomcomplaints.reason" />
				<!--<textarea class="text-input textarea" rows="16" cols="50"
					name="diningroomcomplaints.reason"></textarea>-->
			</p>
			<p>
				<input class="button" type="submit" value="新增" /> 
				<input class="button" type="reset" value="取消" />
			</p>
		</form>
	</div>

</body>
</html>
