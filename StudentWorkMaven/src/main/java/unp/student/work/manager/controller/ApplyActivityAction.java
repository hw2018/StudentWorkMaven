 package unp.student.work.manager.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import unp.student.work.manager.domain.Activity;
import unp.student.work.manager.service.ApplyActivityService;
import unp.student.work.manager.utils.PageBean;

import com.opensymphony.xwork2.ActionSupport;

@Controller
@Scope("prototype")
public class ApplyActivityAction extends ActionSupport {
	private int id;
	private Integer pageNo=1;
	private Activity activity;
	private List activities;
	private PageBean pageBean;	
	
	@Autowired
	private ApplyActivityService activityService;
	public String add(){
		activity.setCreateTime(new Date());
		activityService.save(activity);
		return SUCCESS;
	}
	
	public String show(){
		//funds=fundDao.findAll();
		pageBean=activityService.findByPage(pageNo,10);
		return "showActivities";

	}
	public String show1(){
		//funds=fundDao.findAll();
		pageBean=activityService.findByPage(pageNo,10);
		return "show1Activities";
	}
	public String update(){
		//System.out.println("我到了这�?+type);
		activity=activityService.findById(id);
		return "update";
	}
	public String teacherupdate(){
		//System.out.println("我到了这�?+type);
		activity=activityService.findById(id);
		return "updateteacher";
	}	
	public String save(){
		activityService.update(activity);
		return 	SUCCESS;
	}
	public String save1(){
		activityService.update(activity);
		return "show2";
	}	
	public String delete(){
		activityService.deleteById(id);
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

	public Activity getActivity() {
		return activity;
	}

	public void setActivity(Activity activity) {
		this.activity = activity;
	}

	public List getActivities() {
		return activities;
	}

	public void setActivities(List activities) {
		this.activities = activities;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
}
