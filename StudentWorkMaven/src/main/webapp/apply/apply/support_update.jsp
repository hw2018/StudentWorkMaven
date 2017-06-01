<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="unp.student.work.manager.domain.Support"%>
<%@ include file="../common/head.jsp"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<!--定义基准路径  -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更新活动信息</title>
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
	<%
		Support support = (Support)request.getAttribute("support");
	%>
	<div class="content-box-header">
		<h3>更新申请信息</h3>
	</div>
	<div class="content-box-content">
		<s:form name="form1" action="apply/apply/saveSupport.action" method="post"
			onSubmit="return checkNull()">
<P>
				学期：<select name="support.term" id="terms">
				<option value="2014-2015第一学期">2014-2015第一学期</option>
				<option value="2014-2015第二学期">2014-2015第二学期</option>
				<option value="2015-2016第一学期">2015-2016第一学期</option>
				<option value="2015-2016第二学期">2015-2016第二学期</option>
				<option value="2016-2017第一学期">2016-2017第一学期</option>
				<option value="2016-2017第二学期">2016-2017第二学期</option>
				<option value="2017-2018第一学期">2017-2018第一学期</option>
				<option value="2017-2018第二学期">2017-2018第二学期</option>				
				</select> 
			</P>
			<p>
				专业：<select name="support.profession" id="professions">
				<option value="计算机科学技术">计算机科学技术</option>
				<option value="德语">德语</option>
				<option value="市场营销">市场营销</option>
				<option value="应用物理学">高分子材料与工程</option>				
				<option value="应用物理学">应用物理学</option>
				<option value="国际经济与贸易">国际经济与贸易</option>
				<option value="财政学">财政学</option>
				<option value="食品科学与工程">食品科学与工程</option>
				<option value="经济学">经济学</option>
				<option value="地质工程">地质工程</option>
				<option value="电子商务">电子商务</option>
				<option value="制药工程">制药工程</option>								
				</select>
			</p>
			<p>
				资助类型：<select name="support.supsort" id="supsorts">
				<option value="学费减免">学费减免</option>
				<option value="困难补助">困难补助</option>
				<option value="助学贷款">助学贷款</option>																				
				</select>	
			</p>
			<p>
				申请对象：<select name="support.level" id="levels">
				<option value="本一">本一</option>
				<option value="硕士研究生">硕士研究生</option>
				<option value="博士研究生">博士研究生</option>																				
				</select>	
			</p>
			<p>
				学号：<input class="text-input small-input" type="text"
					name="support.studentID"  id="a" 
					onkeyup="value=value.replace(/[^(\d)]/g,'')" />
			</p>
			<p>
				<input class="button" type="submit" value="修改" /> <input
					class="button" type="reset" value="取消" />
			</p>
		</s:form>
	</div>

</body>
</html>