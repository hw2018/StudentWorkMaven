<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<%@ page import="unp.student.work.manager.domain.Holiday"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新建申请</title>
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
		<h3>新建申请</h3>
	</div>
	<div class="content-box-content">
		<form name="form1" action="apply/apply/addHoliday.action" method="post"
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
					name="holiday.dormitory" />
			</p>
			<p>
				申请原因：<select name="holiday.statement" id="statement">
				<option value="实习">实习</option>
				<option value="课题实验">课题实验</option>
				<option value="其他">其他</option>			
				</select>					
			</p>
			<p>
				<input class="button" type="submit" value="提交" /> <input
					class="button" type="reset" value="取消" />
			</p>
		</form>
	</div>
</body>
</html>