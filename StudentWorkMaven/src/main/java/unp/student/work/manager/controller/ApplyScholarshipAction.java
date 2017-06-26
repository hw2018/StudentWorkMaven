package unp.student.work.manager.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import unp.student.work.manager.domain.Scholarship;
import unp.student.work.manager.service.ApplyScholarshipService;
import unp.student.work.manager.utils.PageBean;

import com.opensymphony.xwork2.ActionSupport;

@Controller
@Scope("prototype")
public class ApplyScholarshipAction extends ActionSupport{
	private int id;
	private Integer pageNo=1;
	private PageBean pageBean;	
	private Scholarship scholarship;
	private List scholarships;
	
	@Autowired
	private ApplyScholarshipService scholarshipService;
	public String add(){
		scholarship.setCreatetime(new Date());
		scholarshipService.save(scholarship);
		return SUCCESS;
	}
	
	public String show(){
		//funds=fundDao.findAll();
		pageBean=scholarshipService.findByPage(pageNo,10);
		return "showScholarships";

	}
	public String show1(){
		//funds=fundDao.findAll();
		pageBean=scholarshipService.findByPage(pageNo,10);
		return "show1Scholarships";
	}	
	
	public String update(){
		//System.out.println("我到了这�?+type);
		scholarship=scholarshipService.findById(id);
		return "update";
	}
	public String teacherupdate(){
		//System.out.println("我到了这�?+type);
		scholarship=scholarshipService.findById(id);
		return "updateteacher";
	}

	public String save(){
		scholarshipService.update(scholarship);
		return SUCCESS;
	}
	public String save1(){
		scholarshipService.update(scholarship);
		return "show2";
	}	
	public String delete(){
		scholarshipService.deleteById(id);
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
	public Scholarship getScholarship() {
		return scholarship;
	}
	public void setScholarship(Scholarship scholarship) {
		this.scholarship = scholarship;
	}
	public List getScholarships() {
		return scholarships;
	}
	public void setScholarships(List scholarships) {
		this.scholarships = scholarships;
	}
	
}
