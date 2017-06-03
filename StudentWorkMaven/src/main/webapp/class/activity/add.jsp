<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<!--定义基准路径  -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>申请活动页面</title>
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
		<h3>申请活动信息</h3>
	</div>
	<div class="content-box-content">
		<form name="form1" action="add_classActivity.action" method="post"
			onSubmit="return checkNull()">
			<p>
				活动名称：<input class="text-input medium-input" type="text"
					name="classactivity.name" />
			</p>
			<p>
				申请人学号：<input class="text-input medium-input" type="text"
					name="classactivity.studentid" />
			</p>
			<p>
				活动地点：<input class="text-input medium-input" type="text"
					name="classactivity.place" />
			</p>
	
			<P>
				参与人数：<select name="classactivity.number" id="terms">
				<option value="1~10人">1~10</option>
				<option value="10~100人">10~100</option>
				<option value="100~500人">100~500</option>
				<option value="500人以上">500</option>			
				</select> 
			</P>
			
			<p>
				活动时间：<input class="text-input medium-input" type="text"
					name="classactivity.date" />
			</p>
			<p>
				负责人：<input class="text-input medium-input" type="text"
					name="classactivity.master" />
			</p>
					<p>
				活动内容：				<textarea class="text-input textarea" rows="13" cols="50"
					name="classactivity.content"></textarea>
			</p>

			<p>
				<input class="button" type="submit" value="新增" />
				<input class="button" type="reset" value="取消" />
			</p>
		</form>
	</div>

</body>
</html>