package unp.student.work.manager.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import unp.student.work.manager.domain.Holiday;
import unp.student.work.manager.service.ApplyHolidayService;
import unp.student.work.manager.utils.PageBean;

import com.opensymphony.xwork2.ActionSupport;

@Controller
@Scope("prototype")
public class ApplyHolidayAction extends ActionSupport {
	
	private int id;
	private Integer pageNo=1;
	private Holiday holiday;
	private List holidaies;
	private PageBean pageBean;	
	@Autowired
	private ApplyHolidayService holidayService;
	public String add(){
		holiday.setCreatetime(new Date());
		holidayService.save(holiday);
		return SUCCESS;
	}
	
	public String show(){
		pageBean=holidayService.findByPage(pageNo,10);
		return "showHolidaies";

	}
	public String show1(){
		//funds=fundDao.findAll();
		pageBean=holidayService.findByPage(pageNo,10);
		return "show1Holidaies";
	}
	public String update(){
		holiday=holidayService.findById(id);
		return "update";
	}
	public String teacherupdate(){
		//System.out.println("我到了这�?+type);
		holiday=holidayService.findById(id);
		return "updateteacher";
	}	
	public String save(){
		holidayService.update(holiday);
		return SUCCESS;
	}
	public String save1(){
		holidayService.update(holiday);
		return "show2";
	}
	public String delete(){
		holidayService.deleteById(id);
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

	public Holiday getHoliday() {
		return holiday;
	}

	public void setHoliday(Holiday holiday) {
		this.holiday = holiday;
	}

	public List getHolidaies() {
		return holidaies;
	}

	public void setHolidaies(List holidaies) {
		this.holidaies = holidaies;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	
}
