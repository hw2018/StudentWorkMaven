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
			$("input[name=studentid]").validatebox({
				required:true,
				missingMessage:'请输入学号'
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
						url: '${manager}/studentquanxian/save_studentquanxian.action',
						success: function(){
							//如果成功了，关闭当前窗口
							parent.$("#win").window("close");
							//刷新页面 :获取aindex-->iframe-->datagrid
							//这里有点难理解
							//var dg = parent.$("iframe[title='类别管理']").contains().find("#dg").datagrid("reload");
							parent.$("iframe[title='学生权限管理']").get(0).contentWindow.$("#dg").datagrid("reload");
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
	        <label for="studentid">学号:</label> <input type="text" name="studentid" />   
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
	        <label for="晚点管理权限">晚点管理权限:</label>   
	        	是<input type="radio" name="late" value="1"  checked="checked"/>&nbsp;
	        	否 <input type="radio" name="late" value="0" />
	    </div>  
	      <div>   
	        <label for="综测管理权限">综测管理权限:</label>   
	        	是<input type="radio" name="comprehensive" value="1"  checked="checked" />&nbsp;
	        	否 <input type="radio" name="comprehensive" value="0" />
	    </div>  
	    <div>
	    	<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>  
	    </div>  
	</form>  	
  </body>
</html>