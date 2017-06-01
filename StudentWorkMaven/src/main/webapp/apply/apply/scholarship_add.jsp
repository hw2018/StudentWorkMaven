<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<%@ page import="unp.student.work.manager.domain.Scholarship"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<!--定义基准路径  -->
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
<script type="text/javascript">
	function checkLength(){
		if(form1.a.length>9||form1.a.length<9)
			alert(form1.a.title+"请输入合法学号");
		form1.a.focus();
		return false;
	}
</script>
</head>
<body>
	<div class="content-box-header">
		<h3>新建申请</h3>
	</div>
	<div class="content-box-content">
		<form name="form1" action="apply/apply/addScholarship.action" method="post"
			onSubmit="return checkNull()">
			<P>
				学期：<select name="scholarship.term" id="terms">
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
				专业：<select name="scholarship.profession" id="professions">
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
				奖学金种类：<select name="scholarship.schsort" id="schsorts">
				<option value="单科奖学金">单科</option>
				<option value="国家奖学金">国家</option>
				<option value="励志奖学金">励志</option>
				<option value="国家助学金">国家</option>
				<option value="文化科技奖学金">文化科技</option>																					
				</select>	
			</p>
			<p>
				学号：<input class="text-input small-input" type="text"
					name="scholarship.studentID"  id="a" 
					onkeyup="value=value.replace(/[^(\d)]/g,'')" />
			</p>
			<p>
				<input class="button" type="submit" value="提交" /> <input
					class="button" type="reset" value="取消" />
			</p>
		</form>
	</div>

</body>
</html>