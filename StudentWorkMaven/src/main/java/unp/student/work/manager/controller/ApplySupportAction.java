package unp.student.work.manager.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import unp.student.work.manager.domain.Support;
import unp.student.work.manager.service.ApplySupportService;
import unp.student.work.manager.utils.PageBean;

import com.opensymphony.xwork2.ActionSupport;

@Controller
@Scope("prototype")
public class ApplySupportAction extends ActionSupport {
	private int id;
	private Integer pageNo=1;
	private PageBean pageBean;	
	private Support support;
	private List supports;
	
	@Autowired
	private ApplySupportService supportService;
	public String add(){
		support.setCreatetime(new Date());
		supportService.save(support);
		return SUCCESS;
	}
	
	public String show(){
		//funds=fundDao.findAll();
		pageBean=supportService.findByPage(pageNo,10);
		return "showSupports";

	}
	public String show1(){
		//funds=fundDao.findAll();
		pageBean=supportService.findByPage(pageNo,10);
		return "show1Supports";
	}
	
	public String update(){
		//System.out.println("我到了这�?+type);
		support=supportService.findById(id);
		return "update";
	}
	public String teacherupdate(){
		//System.out.println("我到了这�?+type);
		support=supportService.findById(id);
		return "updateteacher";
	}	

	public String save(){
		supportService.update(support);
		return SUCCESS;
	}
	public String save1(){
		supportService.update(support);
		return "show2";
	}	
	
	public String delete(){
		supportService.deleteById(id);
		return SUCCESS;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public Support getSupport() {
		return support;
	}

	public void setSupport(Support support) {
		this.support = support;
	}

	public List getSupports() {
		return supports;
	}
	public void setSupports(List supports) {
		this.supports = supports;
	}
}
