<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<base href="<%=basePath%>">
<!--定义基准路径  -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增社团信息页面</title>
<%@ include file="../common/cssjs.inc"%>
<script language="javascript">
function checkNull() {
	/*判断是否有空内容*/
	for (i = 0; i < form1.length; i++) {
		System.out.println(form1.elements[i].value);
		if(i==1){
			if (form1.elements[i].value == "") {
				alert(form1.elements[i].title + "不能为空!");
				form1.elements[i].focus();
				return false;
			}
		}
		if(i==0){
			String s=(String)form1.elements[i].value;
			if (s.endsWith("社")||s.endsWith("协会"));
			else{
				alert(form1.elements[i].title + "社团名称不能为空且必须以“社”或者“协会”结尾！");
				form1.elements[i].focus();
				return false;
		}
		1if(i==2){
			if (form1.elements[i].value == "") {
				alert(form1.elements[i].title + "不能为空!");
				form1.elements[i].focus();
				return false;
			}
		}
	}
}
</script>
</head>
<body>
<div class="content-box-header">
		<h3>新增社团信息</h3>
	</div>
	<div class="content-box-content">
		<form name="form1" action="group/addGroup.action?type=1" method="post"
			onSubmit="return checkNull()">
			<p>
				社团名字：<input class="text-input medium-input" type="text"
					name="group.name" />
			</p>
			<p>
				社团描述：
				<textarea class="text-input textarea" rows="16" cols="50"
					name="group.description"></textarea>
			</p>
			<p>
				社团负责人：<input class="text-input medium-input" type="text"
					name="group.res" />
			</p>
			<p>
				<input class="button" type="submit" value="新增" /> <input
					class="button" type="reset" value="取消" />
			</p>
		</form>
	</div>
</body>
</html>