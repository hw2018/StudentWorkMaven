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

import unp.student.work.manager.domain.ClassActivity;
import unp.student.work.manager.domain.PersonInfo;
import unp.student.work.manager.service.ClassActivityService;
import unp.student.work.manager.utils.PageBean;

@Scope("prototype")
@Controller("classActivityAction")
public class ClassActivityAction extends ActionSupport {
	private Integer id;
	private Integer pageNo=1;
	private PageBean pageBean;
	private ClassActivity classactivity;
	private String name;
    //
	private String studentid;
   // @ManyToOne(targetEntity=PersonInfo.class)
   // @JoinColumn(name="studentid",nullable=false)
    //private PersonInfo person;
	private String place;
	private String content;
	private Date date;
    private String number;
    private String master;

	@Resource
	private ClassActivityService classactivityService;
    public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public ClassActivity getClassactivity() {
		return classactivity;
	}

	public void setClassactivity(ClassActivity classactivity) {
		this.classactivity = classactivity;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	//public PersonInfo getPerson() {
	//	return person;
	//}

	//public void setPerson(PersonInfo person) {
		//this.person = person;
	//}

	public String getStudentid() {
		return studentid;
	}

	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}



	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getMaster() {
		return master;
	}

	public void setMaster(String master) {
		this.master = master;
	}

	

	public String update(){
		classactivity=classactivityService.findById(id);
		return "update";
	}
	public String add(){
		//Fund fund=new Fund(0, fundName, fundDes, fundPrice, fundStatus, new Date());
		classactivityService.save(classactivity);
		return SUCCESS;
	}
	public String show(){
		pageBean=classactivityService.findByPage(pageNo, 10);
		Map<String ,Object> request=(Map<String, Object>) ActionContext.getContext().get("request");
		request.put("pageBean", pageBean);
		return "show";
	}
	
	public String save(){
		classactivityService.update(classactivity);
		return SUCCESS;
	}
	
	public String delete(){
		classactivityService.deleteById(id);
		return SUCCESS;
	}
	
	public String search(){
		pageBean=classactivityService.findById(id, 10);
		Map<String ,Object> request=(Map<String, Object>) ActionContext.getContext().get("request");
		request.put("pageBean", pageBean);
		return "show";
	}
	
}
