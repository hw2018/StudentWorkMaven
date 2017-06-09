package unp.student.work.manager.controller;

import java.util.Date;


import com.opensymphony.xwork2.ActionSupport;

import unp.student.work.manager.dao.CampusEquityprotectDao;
import unp.student.work.manager.domain.Equityprotect;
import unp.student.work.manager.service.CampusEquityprotectService;
import unp.student.work.manager.service.impl.CampusEquityprotectServiceImpl;
import unp.student.work.manager.utils.PageBean;
import unp.student.work.manager.controller.SessionCounter;
import unp.student.work.manager.controller.UserServlet;
import unp.student.work.manager.controller.PersonUserAction;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
@Controller
@Scope("prototype")
public class CampusEquityprotectAction extends ActionSupport {
	private Integer id;
	private Integer pageNo=1;
	private Equityprotect equityprotect;
	private List equityprotects;
	private PageBean pageBean;
	//Ĭ��װ�䷽ʽΪbyType, Ҫȷ�������͵�beanΨһ
	@Autowired
	private CampusEquityprotectService  equityprotectService;
    /**
     * �����������ύ����
     */
	public String add(){
		
		equityprotect.setStarttime(new Date());
		//equityprotect.setSchoolId(LOGIN);
		System.out.println(equityprotect.toString());
		equityprotectService.save(equityprotect);
		return SUCCESS;
	}
	
	 /**
     * �����ҳ��ʾ��������
     */
	public String show(){
		pageBean=equityprotectService.findByPage(pageNo, 10);
		return "showEquityprotects";
	}
	
	 /**
     * ������ʾ����ҳ������
     */
	public String update(){
		equityprotect=equityprotectService.findById(id);
		return "update";
	}

	/**
     * �����������Ϣ����
     */
	public String save(){
		equityprotectService.update(equityprotect);
		return SUCCESS;
	}
	/**
     * ����ɾ��ҳ������
     */
	public String delete(){
		equityprotectService.deleteById(id);
		return SUCCESS;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Equityprotect getEquityprotect() {
		return equityprotect;
	}

	public void setEquityprotect(Equityprotect equityprotect) {
		this.equityprotect = equityprotect;
	}

	public List getEquityprotects() {
		return equityprotects;
	}

	public void setEquityprotects(List equityprotects) {
		this.equityprotects = equityprotects;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
}

