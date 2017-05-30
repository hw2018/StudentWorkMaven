package unp.student.work.manager.controller;


import java.util.Date;
import java.util.Iterator;
import java.util.Map;
















import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.annotations.Sort;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import unp.student.work.manager.domain.StudentQuanxian;
import unp.student.work.manager.domain.late_info;
import unp.student.work.manager.domain.late_person;
import unp.student.work.manager.service.WorkLateInfoService;
import unp.student.work.manager.service.WebStudentQuanXianService;
import unp.student.work.manager.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import javax.annotation.Resource;
import javax.persistence.Id;

@Controller("lateinfoAction")
@Scope("prototype")
public class WorkLateInfoAction extends ActionSupport implements ModelDriven<late_info>,RequestAware,SessionAware{
	
	private Map<String, Object> request;
	private Map<String, Object> session;
	public late_info lateInfo=new late_info();
	private int latepersonid;//�����Ϣ id
	private String reason;//��������
	private String studentid="";
	private String situation;//���ȱ����Աѧ��
	private String date;
	private int pageno=1;

	private int status=-1;
	
	@Resource
	private WebStudentQuanXianService studentQuanXianService;
	
	@Resource
	private WorkLateInfoService lateInfoService;
	
	
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
		
	
	public String getStudentid() {
		return studentid;
	}

	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}

	public int getLatepersonid() {
		return latepersonid;
	}

	public void setLatepersonid(int latepersonid) {
		this.latepersonid = latepersonid;
	}

	public String getSituation() {
		return situation;
	}

	public void setSituation(String situation) {
		this.situation = situation;
	}


	
	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public int getPageno() {
		return pageno;
	}

	public void setPageno(int pageno) {
		this.pageno = pageno;
	}


	public String add(){  //��������Ϣ
		
		String id=(String) session.get("studentid");
		//�ж��Ƿ���������ԱȨ��
		StudentQuanxian studentQuanxian=studentQuanXianService.getByStduent(id);
		if(studentQuanxian==null){
			return "error";
		}else{
			char[] s=studentQuanxian.getQuanxian().toCharArray();
			if(s[3]=='1'){
				//��ִ����Ӳ���
				lateInfo.setTime(new Date(date));
				lateInfoService.add(lateInfo,id,situation);
				PageBean pageBean=lateInfoService.findByPage(pageno,studentid);
				request.put("pageBean", pageBean);
				return "show";
			}else{
				return "error";
			}
		}
		
	}
	
	public String delete(){   //ɾ�������Ϣ
		String id=(String) session.get("studentid");
		//�ж��Ƿ���������ԱȨ��
		StudentQuanxian studentQuanxian=studentQuanXianService.getByStduent(id);
		if(studentQuanxian==null){
			return "error";
		}else{
			char[] s=studentQuanxian.getQuanxian().toCharArray();
			if(s[3]=='1'){
				//��ִ��ɾ������
				lateInfoService.delete(lateInfo);
				PageBean pageBean=lateInfoService.findByPage(pageno,studentid);
				request.put("pageBean", pageBean);
				return "show";
			}else{
				return "error";
			}
		}
		
	}

	public String update(){  //���������Ϣ
		
		String id=(String) session.get("studentid");
		//�ж��Ƿ���������ԱȨ��
		StudentQuanxian studentQuanxian=studentQuanXianService.getByStduent(id);
		if(studentQuanxian==null){
			return "error";
		}else{
			char[] s=studentQuanxian.getQuanxian().toCharArray();
			if(s[3]=='1'){
				//��ִ����Ӳ���
				lateInfoService.update(lateInfo,situation);
				PageBean pageBean=lateInfoService.findByPage(pageno,studentid);
				request.put("pageBean", pageBean);
				return "show";
			}else{
				return "error";
			}
		}
		
	}
	
	public String show(){  //�鿴�����Ϣ
		
		
		PageBean pageBean=lateInfoService.findByPage(pageno,studentid);
		request.put("pageBean", pageBean);
		request.put("studentid", studentid);
		return "show";
	}

	public String get(){  //��ȡ�����Ϣ
		lateInfo=lateInfoService.get(lateInfo.getId());
		request.put("lateinfo", lateInfo);
		return "update";
	}
	public String info(){   //�鿴��������Ϣ
		PageBean pageBean=lateInfoService.showInfo(pageno, lateInfo.getId(),studentid);
		lateInfo=lateInfoService.get(lateInfo.getId());
		request.put("pageBean", pageBean);
		request.put("lateinfo", lateInfo);
		return "info";
	}
	public String addinfo(){  //����ȱ����Ա
		
		String id=(String) session.get("studentid");
		//�ж��Ƿ���������ԱȨ��
		StudentQuanxian studentQuanxian=studentQuanXianService.getByStduent(id);
		if(studentQuanxian==null){
			return "error";
		}else{
			char[] s=studentQuanxian.getQuanxian().toCharArray();
			if(s[3]=='1'){
				//��ִ����Ӳ���
				lateInfoService.addinfo(lateInfo.getId(), studentid);
				//δ����lateinfo.lateperson
				PageBean pageBean=lateInfoService.showInfo(pageno, lateInfo.getId(),"");
				lateInfo=lateInfoService.get(lateInfo.getId());
				request.put("pageBean", pageBean);
				request.put("lateinfo", lateInfo);
				return "info";
			}else{
				return "error";
			}
		}
		
		
		
	}
	public String deleteinfo(){  //ɾ��ȱ����Ա
		
		
		String id=(String) session.get("studentid");
		//�ж��Ƿ���������ԱȨ��
		StudentQuanxian studentQuanxian=studentQuanXianService.getByStduent(id);
		if(studentQuanxian==null){
			return "error";
		}else{
			char[] s=studentQuanxian.getQuanxian().toCharArray();
			if(s[3]=='1'){
				//��ִ����Ӳ���
				lateInfoService.deleteinfo(lateInfo.getId(),latepersonid);
				
				PageBean pageBean=lateInfoService.showInfo(pageno, lateInfo.getId(),"");
				lateInfo=lateInfoService.get(lateInfo.getId());
				request.put("pageBean", pageBean);
				request.put("lateinfo", lateInfo);
				return "info";
			}else{
				return "error";
			}
		}
		
		
	}
	
	public String applyinfo(){  //���ȱ������
		
		if(session.get("studentid").equals(studentid)){
			lateInfoService.updateinfo(latepersonid, reason);
			request.put("pageBean",lateInfoService.showapplyByStudent(studentid, pageno,-1) );
			request.put("status", status);
			return "applyinfo";
		}else{
			return "error";
		}
		
	}
	
	public String dealinfo(){  //����ȱ������
		
		String id=(String) session.get("studentid");
		//�ж��Ƿ���������ԱȨ��
		StudentQuanxian studentQuanxian=studentQuanXianService.getByStduent(id);
		if(studentQuanxian==null){
			return "error";
		}else{
			char[] s=studentQuanxian.getQuanxian().toCharArray();
			if(s[3]=='1'){
				//��ִ����Ӳ���
				lateInfoService.dealinfo(lateInfo.getId(), latepersonid);
				request.put("lateinfo", lateInfoService.get(lateInfo.getId()));
				request.put("pageBean",lateInfoService.showapplyByManager(id, pageno,-1) );
				request.put("status", status);
				return "applyinfo";
			}else{
				return "error";
			}
		}
		
		
	}
	
	public String showapply(){
		
		String id=(String) session.get("studentid");
		//�ж��Ƿ���������ԱȨ��
		StudentQuanxian studentQuanxian=studentQuanXianService.getByStduent(id);
		if(studentQuanxian==null){
			request.put("pageBean",lateInfoService.showapplyByStudent(id, pageno,status) );
			request.put("status", status);
			return "applyinfo";
		}else{
			char[] s=studentQuanxian.getQuanxian().toCharArray();
			if(s[3]=='1'){
				//��ִ����Ӳ���
				request.put("pageBean",lateInfoService.showapplyByManager(id, pageno,status) );
				request.put("status", status);
				return "applyinfo";
			}else{
				
				request.put("pageBean",lateInfoService.showapplyByStudent(id, pageno,status) );
				request.put("status", status);
				return "applyinfo";
			}
		}
		
	}
	public String deleteapply(){//ɾ������
		String id=(String) session.get("studentid");
		lateInfoService.deleteapply(latepersonid);
		request.put("pageBean",lateInfoService.showapplyByStudent(id, pageno,-1) );
		request.put("status", status);
		return "applyinfo";
	}
	public late_info getModel() {
		// TODO Auto-generated method stub
		
		return lateInfo;
	}
	public void setRequest(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.request=arg0;
	}

	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.session=arg0;
		
	}
	

	
}
