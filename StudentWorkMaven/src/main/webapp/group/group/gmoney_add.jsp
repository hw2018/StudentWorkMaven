<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>社团资金流动添加页面</title>
<%@ include file="../common/cssjs.inc"%>
<script language="javascript">
	function checkNull() {
		/*判断是否有空内容*/
		for (i = 0; i < form1.length; i++) {
			if(i==0){
				if(form1.elements[i].value <= 0){
					alert(form1.elements[i].title + "金额必须为正数！");
					form1.elements[i].focus();
					return false;
				}
			}
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
		<h3>新增资金记录</h3>
	</div>
	<div class="content-box-content">
		<form name="form1" action="group/addGroupMoney.action?type=1" method="post"
			onSubmit="return checkNull()">
			<p>
				金额：<input class="text-input medium-input" type="text"
					name="groupMoney.money" />
			</p>
			<p>
				出入帐： <input type="radio" name="groupMoney.moneyIn" value="true" checked />进账
				<input type="radio" name="groupMoney.moneyIn" value="false" />支出
			</p>
			<p>
				备注：
				<textarea class="text-input textarea" rows="16" cols="50"
					name="groupMoney.text"></textarea>
			</p>
			<input type="hidden" name="groupMoney.groupId" value="<%=request.getParameter("id") %>"/>
			<input type="hidden" name="groupMoney.moneyOut" value="false"/>
			<p>
				<input class="button" type="submit" value="新增" /> <input
					class="button" type="reset" value="取消" />
			</p>
		</form>
	</div>

</body>
</html>