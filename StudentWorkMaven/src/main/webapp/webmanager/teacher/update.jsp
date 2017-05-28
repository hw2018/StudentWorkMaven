<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<%@ include file="/public/head.jspf" %>
	<style type="text/css">
		form div {
			margin:5px;
		}
	</style>
	<script type="text/javascript">
		$(function(){
			//iframe中的datagrid对象
			var dg = parent.$("iframe[title='教师权限管理']").get(0).contentWindow.$("#dg");
			
			//对管理员的下拉列表框进行远程加载
			
			
			// 完成数据的回显，更新时，用户肯定先选择了要更新的那一行，首先我们得拿到那一行
			var rows = dg.datagrid("getSelections");
			//将拿到的那一行对应的数据字段加载到表单里，实现回显
			$("#ff").form('load',{
				id:rows[0].id,
				passname:rows[0].passname,
				password:rows[0].password,
				quanxian:rows[0].quanxian,
				
			});
			var quanxian=$("input[name=quanxian]").val();
			if(quanxian.charAt(0)=='0'){
				$("input[name=dorm][value=0]").attr("checked",true);
			}
			if(quanxian.charAt(1)=='0'){
				$("input[name=classes][value=0]").attr("checked",true);
			}
			if(quanxian.charAt(2)=='0'){
				$("input[name=group]][value=0]").attr("checked",true);
			}
			if(quanxian.charAt(3)=='0'){
				$("input[name=apply][value=0]").attr("checked",true);
			}
			if(quanxian.charAt(4)=='0'){
				$("input[name=counsellor][value=0]").attr("checked",true);
			}
			$("input[name=quanxian]")[0].style.display='none';
			//回显完了数据后，设置一下验证功能
			$("input[name=passname]").validatebox({
				required:true,
				missingMessage:'请输入账号'
			});		
			$("input[name=password]").validatebox({
				required:true,
				missingMessage:'请输入密码'
			});	
			//窗体弹出默认时禁用验证
			$("#ff").form("disableValidation");
			//注册button的事件
			$("#btn").click(function(){
				//开启验证
				$("#ff").form("enableValidation");
				//如果验证成功，则提交数据
				if($("#ff").form("validate")) {
					//调用submit方法提交数据
					$("#ff").form('submit', {
						url: '${manager}/teacherquanxian/update_teacherquanxian.action', //提交时将请求传给categoryAction的update方法执行
						success: function(){
							//如果成功了，关闭当前窗口，并刷新页面
							parent.$("#win").window("close");
							dg.datagrid("reload");
						}
					});
				}
			});
		});
	</script>
  </head>
  
  <body>
  		<form id="ff" method="post">   
	    <div>   
	        <label for="passname">账号:</label> <input type="text" name="passname" />   
	    </div>   
	    <div>    <input type="text" name="quanxian"/>   
	    </div> 
	    <div>   
	        <label for="password">密码:</label> <input type="text" name="password" />   
	    </div>   
	    <div>   
	        <label for="宿舍管理权限">宿舍管理权限:</label>   
	        	是<input type="radio" name="dorm" value="1"  checked="checked"/>&nbsp;
	        	否 <input type="radio" name="dorm" value="0" />
	    </div>  
	    <div>   
	        <label for="班级管理权限">班级管理权限:</label>   
	        	是<input type="radio" name="classes" value="1"  checked="checked"/>&nbsp;
	        	否 <input type="radio" name="classes" value="0" />
	    </div>  
	    <div>   
	        <label for="社团管理权限">社团管理权限:</label>   
	        	是<input type="radio" name="group" value="1"  checked="checked"/>&nbsp;
	        	否 <input type="radio" name="group" value="0" />
	    </div>  
	      <div>   
	        <label for="申请管理权限">申请管理权限:</label>   
	        	是<input type="radio" name="apply" value="1"  checked="checked" />&nbsp;
	        	否 <input type="radio" name="apply" value="0" />
	    </div>  
	    <div>   
	        <label for="辅导员考核权限">辅导员考核权限:</label>   
	        	是<input type="radio" name="counsellor" value="1"  checked="checked" />&nbsp;
	        	否 <input type="radio" name="counsellor" value="0" />
	    </div>  
	    <div>
	    	<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">更新</a>  
	    	<input type="hidden" name="id"/>
	    </div>  
	    
	</form>  		
  </body>
</html>