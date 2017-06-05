package unp.student.work.manager.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import unp.student.work.manager.domain.StudentQuanxian;
import unp.student.work.manager.domain.comprehensive_record;
import unp.student.work.manager.service.WorkComprehensiveService;
import unp.student.work.manager.service.WebStudentQuanXianService;
import unp.student.work.manager.utils.PageBean;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller("comprehensiveAction")
@Scope("prototype")
public class WorkComprehensiveAction extends ActionSupport implements
ModelDriven<comprehensive_record>,RequestAware,SessionAware {

	@Resource
	private WorkComprehensiveService comprehensiveService;
	@Resource
	private WebStudentQuanXianService studentQuanXianService;
	private Map<String,Object> request=null;
	private  Map<String,Object> session=null;
	private comprehensive_record comprehensive_record=new comprehensive_record();
	
	private String record;
	
	private String studentid="";
	
    private String reason;
	
	private int cid;  //comprehensive id
	private int pageno=1;
	
	
	


	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getStudentid() {
		return studentid;
	}

	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}

	public int getPageno() {
		return pageno;
	}

	public void setPageno(int pageno) {
		this.pageno = pageno;
	}

	public String getRecord() {
		return record;
	}

	public void setRecord(String record) {
		this.record = record;
	}

	public void setRequest(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.request=arg0;
		
	}

	public comprehensive_record getModel() {
		// TODO Auto-generated method stub
		return this.comprehensive_record;
	}

	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.session=arg0;
		
	}
	
	//��ȡѧ���۲���Ϣ
	public String show(){
		PageBean pageBean=comprehensiveService.findByPage(pageno,10,studentid);
		request.put("pageBean", pageBean);
		request.put("student", studentid);
		return "show";
		
	}
	
	//����ǰ�Ȼ�ȡ����
	public String get(){
		comprehensive_record cRecord=comprehensiveService.get(comprehensive_record.getId());
		request.put("comprehensiverecord", cRecord);
		return "update";
	}
	
	//	���²���
	public String update(){

		String id=(String) session.get("studentid");
		//�ж��Ƿ���������ԱȨ��
		StudentQuanxian studentQuanxian=studentQuanXianService.getByStduent(id);
		if(studentQuanxian==null){
			return "error";
		}else{
			char[] s=studentQuanxian.getQuanxian().toCharArray();
			if(s[2]=='1'){
				//��ִ����Ӳ���
			
				 comprehensiveService.addRecord(comprehensive_record,record);
				 comprehensiveService.update(comprehensive_record);
				 PageBean pageBean=comprehensiveService.findByPage(pageno,10,studentid);
				 request.put("student", studentid);
				request.put("pageBean", pageBean);
				return "show";
			}else{
				return "error";
			}
		}
		 
	}
	//���߲�ѯ
	public String applyshow(){//
		String id=(String) session.get("studentid");
		//�ж��Ƿ���������ԱȨ��
		//����ֱ�ӻ�ȡsession��Ȩ���ж�   ʡ�����ݿ��ѯ
		//�´��޸�
		/**
		 * 
		 */
		StudentQuanxian studentQuanxian=studentQuanXianService.getByStduent(id);
		if(studentQuanxian==null){
			PageBean pageBean=comprehensiveService.showapplyByStudent(id, pageno);
			request.put("pageBean", pageBean);
			return "applyshow";
		}else{
			char[] s=studentQuanxian.getQuanxian().toCharArray();
			if(s[2]=='1'){
				//��ִ����Ӳ���
			
				 PageBean pageBean=comprehensiveService.showapplyByManager(pageno);
				 request.put("pageBean", pageBean);
				 
				 
				return "applyshow";
			}else{
				PageBean pageBean=comprehensiveService.showapplyByStudent(id, pageno);
				request.put("pageBean", pageBean);
				return "applyshow";
			}
		}
	}
	
	//��ѯ�޸ļ�¼
	public String record(){
		String quanxian=(String)session.get("quanxian");
		if(quanxian.charAt(3)!='1'){
			if(session.get("user").equals(studentid)){
				PageBean pageBean=comprehensiveService.showapplyByStudent(studentid, pageno);
				request.put("pageBean", pageBean);
				return "record";
			}else{
			return "error";
			}
		}else{
		PageBean pageBean=comprehensiveService.showapplyByStudent(studentid, pageno);
		request.put("pageBean", pageBean);
		return "record";
		}
	}
	
	//ɾ���޸ļ�¼���Ӧ���ĸı�Ҳ����ʧ
	public String deleterecord(){
		
		String id=(String)session.get("studentid");
		comprehensiveService.deleteRecord(cid,id);
		PageBean pageBean=comprehensiveService.showapplyByStudent(id, pageno);
		request.put("pageBean", pageBean);
		return "record";
		
	}
	
	
	//��ȡ���߼�¼
	public String getrecord(){
		
		request.put("record", comprehensiveService.getRecord(cid));
		return "addapply";
	}
	public String addapply(){//�������
		
		comprehensiveService.addapply(cid, reason);
		String id=(String)session.get("studentid");
		PageBean pageBean=comprehensiveService.showapplyByStudent(id, pageno);
		request.put("pageBean", pageBean);
		return "applyshow";
	}
	public String deleteapply(){//ɾ����������  ѧ�����Բ���
		
		comprehensiveService.deleteapply(cid);
		String id=(String)session.get("studentid");
		PageBean pageBean=comprehensiveService.showapplyByStudent(id, pageno);
		request.put("pageBean", pageBean);
		return "applyshow";
	}
	
	public String dealapply(){//������������   ����Ա���Բ���
		String quanxian=(String)session.get("quanxian");
		if(quanxian.charAt(3)=='1'){
			comprehensiveService.dealapply(cid);
			String id=(String)session.get("studentid");
			PageBean pageBean=comprehensiveService.showapplyByManager(pageno);
			request.put("pageBean", pageBean);
			return "applyshow";
		}else{
		
		return "error";
		}
		
	}
	
}
