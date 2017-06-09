<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
		<h3>新增晚点信息</h3>
	</div>
	<div class="content-box-content">
		<form name="form1" action="lateinfo/add_lateinfo.action" method="post"
			onSubmit="return checkNull()">
			
				晚点缺勤情况：
				<textarea class="text-input textarea" rows="16" cols="50"
					name="situation" onKeyDown="textdown(event)"
    onKeyUp="textup()" onfocus="if(value=='输入为学号,学号........如111111111,222222222'){value=''}"
    onblur="if (value ==''){value='输入为学号,学号........如111111111,222222222'}">输入为学号,学号........如111111111,222222222</textarea>
			</p>
			<p>
				 晚点时间：<p>Date: <input type="text" id="datepicker" name="date"></p>
				
			</p>
			<p>
				<input class="button" type="submit" value="新增" /> <input
					class="button" type="reset" value="取消" />
			</p>
		</form>
	</div>

</body>
<script>

	jQuery.validator.addMethod("lateinfo", function(value, element) {
// allow any non-whitespace characters as the host part
		returnthis.optional( element ) || /[0-9]/.test( value );
	}	, '请输入正确的格式');
	$(function () {
				
			$( "#select" ).validate( {   
				rules: {
					studentid: {
						required:true,
						number:true
					}
				},
				messages:{
					studentid:"输出正确的学号"
				},
				
			} );
		});

</script>
</html>