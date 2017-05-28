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
						url: '${manager}/teacherquanxian/save_teacherquanxian.action',
						success: function(){
							//如果成功了，关闭当前窗口
							parent.$("#win").window("close");
							//刷新页面 :获取aindex-->iframe-->datagrid
							//这里有点难理解
							//var dg = parent.$("iframe[title='类别管理']").contains().find("#dg").datagrid("reload");
							parent.$("iframe[title='教师权限管理']").get(0).contentWindow.$("#dg").datagrid("reload");
							//alert(dg);
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
	    	<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>  
	    </div>  
	</form>  	
  </body>
</html>