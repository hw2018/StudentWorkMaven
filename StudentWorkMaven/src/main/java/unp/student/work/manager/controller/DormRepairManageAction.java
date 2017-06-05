package unp.student.work.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;


import unp.student.work.manager.domain.DormRepair;
import unp.student.work.manager.service.DormInfoService;
import unp.student.work.manager.service.DormRepairService;
import unp.student.work.manager.utils.PageBean;
@Controller
@Scope("prototype")
public class DormRepairManageAction extends ActionSupport {
	private Integer id;
	private Integer pageNo=1;
	private DormRepair dormrepair;
	private List dromrepairs;
	private PageBean pageBean;
	
	@Autowired
	private DormRepairService  dormrepairService;
	
	public String add(){
		//Fund fund=new Fund(0, fundName, fundDes, fundPrice, fundStatus, new Date());
		
		dormrepairService.save(dormrepair);
		return SUCCESS;
	}
	
	 /**
     * 处理分页显示基金请求
     */
	public String show(){
		pageBean=dormrepairService.findByPage(pageNo, 10);
		return "showRepairs";
	}
	
	 /**
     * 处理显示更新基金页面请求
     */
	public String update(){
		dormrepair=dormrepairService.findById(id);
		return "update";
	}

	/**
     * 处理保存更新基金信息请求
     */
	public String save(){
		dormrepairService.update(dormrepair);
		return SUCCESS;
	}
	/**
     * 处理删除基金页面请求
     */
	public String delete(){
		dormrepairService.deleteById(id);
		return SUCCESS;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}

	public DormRepair getDormrepair() {
		return dormrepair;
	}

	public void setDormrepair(DormRepair dormrepair) {
		this.dormrepair = dormrepair;
	}

	public List getDromrepairs() {
		return dromrepairs;
	}

	public void setDromrepairs(List dromrepairs) {
		this.dromrepairs = dromrepairs;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	
	
}
