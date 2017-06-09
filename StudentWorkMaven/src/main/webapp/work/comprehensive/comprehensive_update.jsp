<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="unp.student.work.manager.domain.late_info" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<!--定义基准路径  -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<%@ include file="../common/cssjs.inc"%>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>
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
	</div>
	<div class="content-box-content">
		<form id="update" name="form1" action="comprehensive/update_comprehensive.action?id=${comprehensiverecord.id}" method="post">
			
				学生综测分：
				<input id="score" type="text" name="score" value="${comprehensiverecord.score}"/>
				<br>
				综测原因:<br>
				<textarea class="text-input textarea" rows="16" cols="50"
					name="record" ></textarea>
			</p>
			<p>
				
			</p>
			<p>
				<input class="button" type="submit" value="新增" /> <input
					class="button" type="reset" value="取消" />
			</p>
		</form>
	</div>
	<script>
		$(function () {
				
			$( "#update" ).validate( {   
				rules: {
					score: {
						number:true
					}
				},
				messages:{
					score :"只能为数字"
				},
				
			} );
		});
	</script>

</body>
</html>