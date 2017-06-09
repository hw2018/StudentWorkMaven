package unp.student.work.manager.controller;

import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import unp.student.work.manager.domain.ClassLeave;

import unp.student.work.manager.domain.PersonInfo;
import unp.student.work.manager.service.ClassLeaveService;
import unp.student.work.manager.utils.PageBean;

@Scope("prototype")
@Controller("classLeaveAction")
public class ClassLeaveAction extends ActionSupport {
	private Integer id;
	private Integer pageNo=1;
	private PageBean pageBean;
	private ClassLeave classleave;
    //
	private String studentid;
	private Date leavedate;
	private String leavereason;
	private String agree;
	private Date backdate;
	private String instructor;

	// @ManyToOne(targetEntity=PersonInfo.class)
    //@JoinColumn(name="studentid",referencedColumnName="studentid",nullable=false)
   // private PersonInfo person;
	@Resource
	private ClassLeaveService classleaveService;
	
	
	
	

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public ClassLeave getClassleave() {
		return classleave;
	}
	public void setClassleave(ClassLeave classleave) {
		this.classleave = classleave;
	}
	public String getStudentid() {
		return studentid;
	}
	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}
	public Date getLeavedate() {
		return leavedate;
	}
	public void setLeavedate(Date leavedate) {
		this.leavedate = leavedate;
	}
	public String getLeavereason() {
		return leavereason;
	}
	public void setLeavereason(String leavereason) {
		this.leavereason = leavereason;
	}
	public String getAgree() {
		return agree;
	}
	public void setAgree(String agree) {
		this.agree = agree;
	}
	public Date getBackdate() {
		return backdate;
	}
	public void setBackdate(Date backdate) {
		this.backdate = backdate;
	}
	public String getInstructor() {
		return instructor;
	}
	public void setInstructor(String instructor) {
		this.instructor = instructor;
	}
	public String update(){
		classleave=classleaveService.findById(id);
		return "update";
	}
	public String add(){
		//Fund fund=new Fund(0, fundName, fundDes, fundPrice, fundStatus, new Date());
		classleaveService.save(classleave);
		return SUCCESS;
	}
	public String show(){
		pageBean=classleaveService.findByPage(pageNo, 10);
		Map<String ,Object> request=(Map<String, Object>) ActionContext.getContext().get("request");
		request.put("pageBean", pageBean);
		return "show";
	}
	public String show2(){
		pageBean=classleaveService.findByPage(pageNo, 10);
		Map<String ,Object> request=(Map<String, Object>) ActionContext.getContext().get("request");
		request.put("pageBean", pageBean);
		return "show2";
	}
	
	public String save(){
		classleaveService.update(classleave);
		return SUCCESS;
	}
	
	public String delete(){
		classleaveService.deleteById(id);
		return SUCCESS;
	}
	
	public String search(){
		pageBean=classleaveService.findById(id, 10);
		Map<String ,Object> request=(Map<String, Object>) ActionContext.getContext().get("request");
		request.put("pageBean", pageBean);
		return "show";
	}
	
}
