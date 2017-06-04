package unp.student.work.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

import unp.student.work.manager.domain.DormItem;
import unp.student.work.manager.service.DormItemService;
import unp.student.work.manager.utils.PageBean;
@Controller
@Scope("prototype")
public class DormItemManageAction extends ActionSupport {
	private Integer id;
	private Integer pageNo=1;
	private DormItem dormitem;
	private List dormitems;
	private PageBean pageBean;
	
	@Autowired
	private DormItemService dormitemService;
	
	public String add(){
		
		
		dormitemService.save(dormitem);
		return SUCCESS;
	}
	
	 /**
     * �����ҳ��ʾ��������
     */
	public String show(){
		pageBean=dormitemService.findByPage(pageNo, 10);
		return "showItems";
	}
	
	 /**
     * ������ʾ���»���ҳ������
     */
	public String update(){
		dormitem=dormitemService.findById(id);
		return "update";
	}

	/**
     * ��������»�����Ϣ����
     */
	public String save(){
		dormitemService.update(dormitem);
		return SUCCESS;
	}
	/**
     * ����ɾ������ҳ������
     */
	public String delete(){
		dormitemService.deleteById(id);
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
	public DormItem getDormitem() {
		return dormitem;
	}
	public void setDormitem(DormItem dormitem) {
		this.dormitem = dormitem;
	}
	public List getDormitems() {
		return dormitems;
	}
	public void setDormitems(List dormitems) {
		this.dormitems = dormitems;
	}
	public PageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

}
