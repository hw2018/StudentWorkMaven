package unp.student.work.manager.controller;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 后台权限管理转发 带权限验证
 * @author huangwei
 *
 */
@Controller("sendAction")
public class SendAction extends ActionSupport implements SessionAware {
	private Map<String,Object> session=null;
	
	
	public String execute() {
		//是否为教师
		if(session.get("webteacher")==null){
			return "error";
		}
		//是否为管理员
		if(!session.get("teacherquanxian").equals("00000")){
			return "error";
		}
		return "send";
	}

	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.session=arg0;
	}
}
