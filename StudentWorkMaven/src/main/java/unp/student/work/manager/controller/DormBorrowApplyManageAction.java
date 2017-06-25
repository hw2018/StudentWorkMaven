package unp.student.work.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

import unp.student.work.manager.domain.DormBorrowApply;
import unp.student.work.manager.service.DormBorrowApplyService;
import unp.student.work.manager.utils.PageBean;
@Controller
@Scope("prototype")
public class DormBorrowApplyManageAction extends ActionSupport {

	private Integer id;
	private Integer pageNo=1;
	private DormBorrowApply dormborrowapply;
	private List dromborrowapplys;
	private PageBean pageBean;
	@Autowired
	private DormBorrowApplyService  dormborrowapplyService;
	
	public String add(){
		
		dormborrowapplyService.save(dormborrowapply);
		return SUCCESS;
	}
	
	 /**
     * �����ҳ��ʾ��������
     */
	public String show1(){
		pageBean=dormborrowapplyService.findByPage(pageNo, 10);
		return "show1Applys";
	}
	public String show(){
		pageBean=dormborrowapplyService.findByPage(pageNo, 10);
		return "showApplys";
	}
	
	 /**
     * ������ʾ���»���ҳ������
     */
	public String update(){
			dormborrowapply=dormborrowapplyService.findById(id);
		return "update";
	}

	/**
     * ��������»�����Ϣ����
     */
	public String save(){
		dormborrowapplyService.update(dormborrowapply);
		return SUCCESS;
	}
	/**
     * ����ɾ������ҳ������
     */
	public String delete(){
		dormborrowapplyService.deleteById(id);
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

	public DormBorrowApply getDormborrowapply() {
		return dormborrowapply;
	}

	public void setDormborrowapply(DormBorrowApply dormborrowapply) {
		this.dormborrowapply = dormborrowapply;
	}

	public List getDromborrowapplys() {
		return dromborrowapplys;
	}

	public void setDromborrowapplys(List dromborrowapplys) {
		this.dromborrowapplys = dromborrowapplys;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	
}
