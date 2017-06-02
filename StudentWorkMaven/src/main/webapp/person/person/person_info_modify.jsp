<%@ page language="java" import="
unp.student.work.manager.domain.PersonPersonInfo,
unp.student.work.manager.service.PersonInfoService,
org.springframework.context.ApplicationContext,
org.springframework.context.support.ClassPathXmlApplicationContext,
org.hibernate.Session" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<base href="<%=basePath%>">   <!--定义基准路径  -->

<link href="person/resources/css/datePicker.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="person/resources/scripts/jquery.min.js"></script>
<script type="text/javascript" src="person/resources/scripts/jquery.date_input.pack.js"></script> 

<style type="text/css">
td,th{
	line-height:30px;
	font-size:1.4em;
	margin-left:40px;
	list-style:none;
	border-width:1px;
	border-style:solid;
	border-color:black;
}
table{	border-collapse:collapse;}
select{background-color: transparent; border:none;width:180px;}
</style>

<style type="text/css">
html{overflow-x:hidden }
a{text-decoration:NONE;color:black;}
</style>


<script type="text/javascript">

function ini()
{
	<%!
	public PersonPersonInfo personPersonInfo = new PersonPersonInfo();
	%>
	
	<% //根据当前HttpSession里的studentid来得到PersonPersonInfo对象
	ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml"); 
	personPersonInfo = ((PersonInfoService)ctx.getBean("personInfoService")).getPersonInfo((String)session.getAttribute("studentid"));  //根据当前HttpSession里的studentid来得到PersonPersonInfo对象
	%>
	
	document.getElementById("studentid").value = "<%=personPersonInfo.getStudentid()%>";
	document.getElementById("name").value = "<%=personPersonInfo.getName()%>";
	document.getElementById("sex").value = "<%=personPersonInfo.getSex()%>";
	document.getElementById("nation").value = "<%=personPersonInfo.getNation()%>";
	document.getElementById("placeofbirth").value = "<%=personPersonInfo.getPlaceofbirth()%>";
	document.getElementById("birthday").value = "<fmt:formatDate value="<%=personPersonInfo.getBirthday()%>" pattern="yyyy-MM-dd"/>";
	document.getElementById("grade").value = "<%=personPersonInfo.getGrade()%>";
	document.getElementById("politicalstatus").value = "<%=personPersonInfo.getPoliticalstatus()%>";
	document.getElementById("college").value = "<%=personPersonInfo.getCollege()%>";
	document.getElementById("major").value = "<%=personPersonInfo.getMajor()%>";
	document.getElementById("tel").value = "<%=personPersonInfo.getTel()%>";
	document.getElementById("email").value = "<%=personPersonInfo.getEmail()%>";
	document.getElementById("build").value = "<%=personPersonInfo.getBuild()%>";
	document.getElementById("hostel").value = "<%=personPersonInfo.getHostel()%>";
	document.getElementById("idcard").value = "<%=personPersonInfo.getIdcard()%>";
	document.getElementById("status").value = "<%=personPersonInfo.getStatus()%>";
	document.getElementById("password").value = "<%=personPersonInfo.getPassword()%>";
	

}

function check()
{
	var date = new Date;
	var fullyear = date.getFullYear();
	
	var studentid = document.getElementById("studentid");
	var name = document.getElementById("name");
	var sex = document.getElementById("sex");
	var nation = document.getElementById("nation");
	var placeofbirth = document.getElementById("placeofbirth");
	var birthday = document.getElementById("birthday");
	var grade = document.getElementById("grade");
	var politicalstatus = document.getElementById("politicalstatus");
	var college = document.getElementById("college");
	var major = document.getElementById("major");
	var tel = document.getElementById("tel");
	var email = document.getElementById("email");
	var build = document.getElementById("build");
	var hostel = document.getElementById("hostel");
	var idcard = document.getElementById("idcard");
	var status = document.getElementById("status");
	
	var instituteNum1 = studentid.value.substring(0,2);  <!-- 获取学号的前两位 -->
	var year = studentid.value.substring(2,4);     <!-- 获取学号的两位数的年份信息 -->
	
	var instituteNum2;
	if(college.value == "无") instituteNum2="00";
	else if(college.value == "电气工程与自动化学院") instituteNum2="01";
	else if(college.value == "机械工程及自动化学院") instituteNum2="02";
	else if(college.value == "数学与计算机科学学院") instituteNum2="03";
	else if(college.value == "化学化工学院") instituteNum2="04";
	else if(college.value == "土木工程学院") instituteNum2="05";
	else if(college.value == "环境与资源学院") instituteNum2="06";
	else if(college.value == "管理学院") instituteNum2="07";
	else if(college.value == "生物科学与工程学院") instituteNum2="08";
	else if(college.value == "外国语学院") instituteNum2="09";
	else if(college.value == "物理与电信工程学院") instituteNum2="11";
	else if(college.value == "八方物流学院") instituteNum2="14";
	else if(college.value == "建筑学院") instituteNum2="15";
	else if(college.value == "紫金矿业学院") instituteNum2="16";
	else if(college.value == "工艺美术学院") instituteNum2="17";
	else if(college.value == "材料科学与工程学院") instituteNum2="18";
	else if(college.value == "法学院") instituteNum2="19";
	else if(college.value == "至诚学院") instituteNum2="21";
	else if(college.value == "软件学院") instituteNum2="22";
	else if(college.value == "公共管理学院") instituteNum2="23";
	else if(college.value == "阳光学院") instituteNum2="24";
	else if(college.value == "工程技术学院") instituteNum2="26";
	else if(college.value == "人文社会科学学院") instituteNum2="29";
	else if(college.value == "成人教育学院") instituteNum2="37";
	else if(college.value == "研究生院") instituteNum2="48";
	
	<!-- 身份证号合法性验证 -->
	var S = idcard.value.charAt(0)*7 + idcard.value.charAt(1)*9 + idcard.value.charAt(2)*10 + idcard.value.charAt(3)*5 + idcard.value.charAt(4)*8 + idcard.value.charAt(5)*4 + idcard.value.charAt(6)*2 + idcard.value.charAt(7)*1 + idcard.value.charAt(8)*6 + idcard.value.charAt(9)*3 + idcard.value.charAt(10)*7 + idcard.value.charAt(11)*9 + idcard.value.charAt(12)*10 + idcard.value.charAt(13)*5 + idcard.value.charAt(14)*8 + idcard.value.charAt(15)*4 + idcard.value.charAt(16)*2; 

	var y = S%11;
	var end1;
	if(y==0)end1=1;
	else if(y==1)end1=0;
	else if(y==2)end1=X;
	else if(y==3)end1=9;
	else if(y==4)end1=8;
	else if(y==5)end1=7;
	else if(y==6)end1=6;
	else if(y==7)end1=5;
	else if(y==8)end1=4;
	else if(y==9)end1=3;
	else if(y==10)end1=2;
	
	var end2 = idcard.value.charAt(17);
	
	<!-- 出生年月验证 -->
	var curDate;
	if(birthday.value!="")	curDate = birthday.value.split("-");
	
	
	if(studentid.value.replace(/^ +| +$/g,"")=="" || studentid.value.length!=9 || studentid.value.replace(/\d/g,"")!="")
		{alert("学号不符合规范!");return false;}
	else if(year > date.getYear().toString().substring(1,3))
		{alert("您的学号中的年份信息有误!");return false;}
	else if(name.value.replace(/^ +| +$/g,"")=="" || name.value.replace(/[\u4E00-\u9FA5]/g,"")!="" || name.value.length > 20 || name.value.length < 2)
		{alert("姓名不符合规范!");return false;}
	else if(sex.value!="男" && sex.value!="女")
		{alert("性别不符合规范！");return false;}
	else if(nation.value.replace(/^ +| +$/g,"")=="")
		{alert("民族不能为空!");return false;}
	else if(placeofbirth.value.replace(/^ +| +$/g,"")=="")
		{alert("籍贯不能为空!");return false;}
	else if(birthday.value.replace(/^ +| +$/g,"")=="")
		{alert("出生年月不能为空!");return false;}
	else if(parseInt(curDate[0])>parseInt(date.getFullYear()) || curDate[1]>date.getMonth()+1 || curDate[2]>date.getDate())
		{alert("您填写的出生年月表明您在未来出生,这不符合人类的逻辑!");return false;}
	else if(grade.value.replace(/^ +| +$/g,"")=="" || grade.value.length!=4 || parseInt(grade.value)>fullyear || grade.value.replace(/\d/g,"")!="")
		{alert("年级不符合规范!");return false;}
	else if(politicalstatus.value.replace(/^ +| +$/g,"")=="")
		{alert("政治状态不能为空!");return false;}
	else if(instituteNum2!=instituteNum1)
		{alert("学院与学号中的学院编号不一致!");return false;}
	else if(major.value.replace(/^ +| +$/g,"")=="")
		{alert("专业不符合规范!");return false;}
	else if(tel.value.replace(/^ +| +$/g,"")=="" || tel.value.replace(/[\d]/g,"")!="" || tel.value.length!=11)
		{alert("手机号码不符合规范!");return false;}
	else if(email.value.replace(/^ +| +$/g,"")=="" || email.value.match(/^(.+)@(.+)$/)==null )
		{alert("电子邮件不符合规范!");return false;}
	else if(build.value.replace(/^ +| +$/g,"")=="" || build.value.length > 2 || build.value.replace(/\d/g,"")!="")
		{alert("楼号不符合规范");return false;}
	else if(hostel.value.replace(/^ +| +$/g,"")=="" || hostel.value.length != 3 || hostel.value.replace(/\d/g,"")!="")
		{alert("宿舍号不符合规范");return false;}
	else if(idcard.value.replace(/^ +| +$/g,"")=="" || idcard.value.length != 18 || idcard.value.replace(/\d/g,"")!="" || end1!=end2)
		{alert("身份证号码不合法!");return false;}
	else if(status.value.replace(/^ +| +$/g,"")=="")
		{alert("在校状态不能为空!");return false;}
	
}

</script>




</head>
<body onload="ini()" style="background-color:dee6f2">

<script type="text/javascript">   <!-- 必须写在body中 -->
$(function(){
	$('#birthday').date_input();
	})
</script>

<br/>


<h1 align="center">修改个人信息</h1>

<form name="info" method="post" onsubmit="return check()" action="person/modifyInfo.action">
<table align="center" style="table-layout:fixed">
<tr><td width="120">学号：</td><td><input readonly="true" name="personPersonInfoDto.studentid" id="studentid" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">姓名：</td><td><input name="personPersonInfoDto.name" id="name" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>

<tr><td width="120">性别：</td><td>
<select name="personPersonInfoDto.sex"  id="sex">
<option value="男">男</option>
<option value="女">女</option>
</select>
</td></tr>

<tr><td width="120">民族：</td><td>
<select name="personPersonInfoDto.nation"  id="nation">
<option value="汉族">汉族</option>		
<option value="蒙古族">蒙古族</option>
<option value="回族">回族</option>
<option value="藏族">藏族</option>
<option value="维吾尔族">维吾尔族</option>
<option value="苗族">苗族</option>
<option value="彝族">彝族</option>
<option value="壮族">壮族</option>
<option value="布依族">布依族</option>
<option value="朝鲜族">朝鲜族</option>
<option value="满族">满族</option>
<option value="侗族">侗族</option>
<option value="瑶族">瑶族</option>
<option value="白族">白族</option>
<option value="土家族">土家族</option>
<option value="哈尼族">哈尼族</option>
<option value="哈萨克族">哈萨克族</option>
<option value="傣族">傣族</option>
<option value="黎族">黎族</option>
<option value="僳僳族">僳僳族</option>
<option value="佤族">佤族</option>
<option value="畲族">畲族</option>
<option value="高山族">高山族</option>
<option value="拉祜族">拉祜族</option>
<option value="水族">水族</option>
<option value="东搜索乡族">东搜索乡族</option>
<option value="纳西族">纳西族</option>
<option value="景颇族">景颇族</option>
<option value="柯尔克孜族">柯尔克孜族</option>
<option value="土族">土族</option>
<option value="达斡尔族">达斡尔族</option>
<option value="仫佬族">仫佬族</option>
<option value="羌族">羌族</option>
<option value="布朗族">布朗族</option>
<option value="撒拉族">撒拉族</option>
<option value="毛南族">毛南族</option>
<option value="仡佬族">仡佬族</option>
<option value="锡伯族">锡伯族</option>
<option value="阿昌族">阿昌族</option>
<option value="普米族">普米族</option>
<option value="塔吉克族">塔吉克族</option>
<option value="怒族">怒族</option>
<option value="乌孜别克族">乌孜别克族</option>
<option value="俄罗斯族">俄罗斯族</option>
<option value="鄂温克族">鄂温克族</option>
<option value="德昂族">德昂族</option>
<option value="保安族">保安族</option>
<option value="裕固族">裕固族</option>
<option value="京族">京族</option>
<option value="塔塔尔族">塔塔尔族</option>
<option value="独龙族">独龙族</option>
<option value="鄂伦春族">鄂伦春族</option>
<option value="赫哲族">赫哲族</option>
<option value="门巴族">门巴族</option>
<option value="珞巴族">珞巴族</option>
<option value="基诺族">基诺族</option>
</select>
</td></tr>

<tr><td width="120">籍贯：</td><td><input name="personPersonInfoDto.placeofbirth" id="placeofbirth" type="text" size="30" style="background-color: transparent;border:none;"/></td>	</tr>
<tr><td width="120">出生年月：</td><td><input name="personPersonInfoDto.birthday" id="birthday" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">年级：</td><td><input name="personPersonInfoDto.grade" id="grade" type="text" size="30" style="background-color: transparent;border:none;"/></td>		</tr>

<tr><td width="120">政治状态：</td><td>
<select name="personPersonInfoDto.politicalstatus" id="politicalstatus">
<option value="共青团员">共青团员</option>
<option value="中共党员">中共党员</option>
<option value="群众">群众</option>
</select>
</td></tr>

<tr><td width="120">学院：</td><td>
<select name="personPersonInfoDto.college" id="college">
<option value="无">无</option>	
<option value="电气工程与自动化学院">电气工程与自动化学院</option>	
<option value="机械工程及自动化学院">机械工程及自动化学院</option>
<option value="数学与计算机科学学院">数学与计算机科学学院</option>
<option value="化学化工学院">化学化工学院</option>
<option value="土木工程学院">土木工程学院</option>
<option value="环境与资源学院">环境与资源学院</option>
<option value="管理学院">管理学院</option>
<option value="生物科学与工程学院">生物科学与工程学院</option>
<option value="外国语学院">外国语学院</option>
<option value="物理与电信工程学院">物理与电信工程学院</option>
<option value="八方物流学院">八方物流学院</option>
<option value="建筑学院">建筑学院</option>
<option value="紫金矿业学院">紫金矿业学院</option>
<option value="工艺美术学院">工艺美术学院</option>
<option value="材料科学与工程学院">材料科学与工程学院</option>
<option value="法学院">法学院</option>
<option value="至诚学院">至诚学院</option>
<option value="软件学院">软件学院</option>
<option value="公共管理学院">公共管理学院</option>
<option value="阳光学院">阳光学院</option>
<option value="工程技术学院">工程技术学院</option>
<option value="人文社会科学学院">人文社会科学学院</option>
<option value="成人教育学院">成人教育学院</option>
<option value="研究生院">研究生院</option>
</select>
</td></tr>

<tr><td width="120" >专业：</td><td>
<select name="personPersonInfoDto.major" id="major">
<option value="无">无</option>	
<option value="电气工程及其自动化专业">电气工程及其自动化专业</option>			
<option value="自动化专业">自动化专业</option>
<option value="建筑电气与智能化专业">建筑电气与智能化专业</option>
<option value="机械设计制造及其自动化">机械设计制造及其自动化</option>专业专业
<option value="车辆工程专业">车辆工程专业</option>
<option value="材料成型及控制工程专业">材料成型及控制工程专业</option>
<option value="计算机科学与技术专业">计算机科学与技术专业</option>
<option value="网络工程专业">网络工程专业</option>
<option value="信息安全专业">信息安全专业</option>
<option value="信息与计算科学专业">信息与计算科学专业</option>
<option value="数学与应用数学专业">数学与应用数学专业</option>
<option value="软件工程专业">软件工程专业</option>
<option value="过程装备与控制工程专业">过程装备与控制工程专业</option>
<option value="化学工程与工艺专业">化学工程与工艺专业</option>
<option value="化学专业">化学专业</option>
<option value="制药工程专业">制药工程专业</option>
<option value="土木工程专业">土木工程专业</option>
<option value="水利水电工程专业">水利水电工程专业</option>
<option value="给排水科学与工程专业">给排水科学与工程专业</option>
<option value="工程管理专业">工程管理专业</option>
<option value="交通工程专业">交通工程专业</option>
<option value="交通运输专业">交通运输专业</option>
<option value="环境工程专业">环境工程专业</option>
<option value="安全工程专业">安全工程专业</option>
<option value="地质工程专业">地质工程专业</option>
<option value="人文地理与城乡规划专业">人文地理与城乡规划专业</option>
<option value="资源循环科学与工程专业">资源循环科学与工程专业</option>
<option value="工商管理专业">工商管理专业</option>
<option value="市场营销专业">市场营销专业</option>
<option value="会计学专业">会计学专业</option>
<option value="财务管理专业">财务管理专业</option>
<option value="财政学专业">财政学专业</option>
<option value="金融学专业">金融学专业</option>
<option value="经济学专业">经济学专业</option>
<option value="国际经济与贸易专业">国际经济与贸易专业</option>
<option value="信息管理与信息系统专业">信息管理与信息系统专业</option>
<option value="电子商务专业">电子商务专业</option>
<option value="工业工程专业">工业工程专业</option>
<option value="经济统计学专业">经济统计学专业</option>
<option value="物流管理专业">物流管理专业</option>
<option value="物流工程专业">物流工程专业</option>
<option value="行政管理专业">行政管理专业</option>
<option value="公共事业管理专业">公共事业管理专业</option>
<option value="生物工程专业">生物工程专业</option>
<option value="生物技术专业">生物技术专业</option>
<option value="食品科学与工程专业">食品科学与工程专业</option>
<option value="英语专业">英语专业</option>
<option value="日语专业">日语专业</option>
<option value="德语专业">德语专业</option>
<option value="通信工程专业">通信工程专业</option>
<option value="电子信息工程专业">电子信息工程专业</option>
<option value="电子科学与技术专业">电子科学与技术专业</option>
<option value="微电子科学与工程专业">微电子科学与工程专业</option>
<option value="光电信息科学与工程专业">光电信息科学与工程专业</option>
<option value="应用物理学专业">应用物理学专业</option>
<option value="数字媒体技术专业">数字媒体技术专业</option>
<option value="物联网工程专业">物联网工程专业</option>
<option value="建筑学专业">建筑学专业</option>
<option value="城乡规划专业">城乡规划专业</option>
<option value="风景园林专业">风景园林专业</option>
<option value="资源勘查工程专业">资源勘查工程专业</option>
<option value="采矿工程专业">采矿工程专业</option>
<option value="矿物加工工程专业">矿物加工工程专业</option>
<option value="绘画专业">绘画专业</option>
<option value="雕塑专业">雕塑专业</option>
<option value="视觉传达设计专业">视觉传达设计专业</option>
<option value="环境设计专业">环境设计专业</option>
<option value="产品设计专业">产品设计专业</option>
<option value="服装与服饰设计专业">服装与服饰设计专业</option>
<option value="工艺美术专业">工艺美术专业</option>
<option value="数字媒体艺术专业">数字媒体艺术专业</option>
<option value="工业设计专业">工业设计专业</option>
<option value="材料科学与工程专业">材料科学与工程专业</option>
<option value="高分子材料与工程专业">高分子材料与工程专业</option>
<option value="法学专业">法学专业</option>
<option value="社会学专业">社会学专业</option>
<option value="汉语言文学专业">汉语言文学专业</option>
<option value="应用心理学专业">应用心理学专业</option>
<option value="音乐学专业">音乐学专业</option>
</td></tr>
<tr><td width="120">手机：</td><td><input name="personPersonInfoDto.tel" id="tel" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">电子邮箱：</td><td><input name="personPersonInfoDto.email" id="email" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">楼号：</td><td><input name="personPersonInfoDto.build" id="build" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">宿舍号：</td><td><input name="personPersonInfoDto.hostel" id="hostel" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">身份证号：</td><td><input name="personPersonInfoDto.idcard" id="idcard" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">在校状态：</td><td><input name="personPersonInfoDto.status" id="status" type="text" size="30" style="background-color: transparent;border:none;"/></td></tr>
<tr><td width="120">密码：</td><td><input name="personPersonInfoDto.password" id="password" type="text" maxlength="30" size="30" style="background-color: transparent;border:none;"/></td>	</tr>
</table>
<br/>
<center><input type="submit" value="提交"/><a href="person/person/person_info.jsp">&#12288;&#12288;<input type="button" value="取消"/></a></center>
</form>


</body>
</html>












