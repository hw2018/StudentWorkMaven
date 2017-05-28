package unp.student.work.manager.controller;

import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import unp.student.work.manager.domain.Goodsinfomy;
import unp.student.work.manager.domain.PersonPersonInfo;
import unp.student.work.manager.service.GoodsinfomyService;

@Component
public class GoodsInfomyAction extends ActionSupport {
	private String id;
	private String name;
	private Double price;
	private String des;
	private String contact;
	private Date time;
	private PersonPersonInfo personPersonInfo = new PersonPersonInfo();
	private Goodsinfomy goodsinfomy = new Goodsinfomy();

	@Resource
	private GoodsinfomyService goodsinfomyService;

	public String add() throws Exception {

		Date d = new Date();
		@SuppressWarnings("unchecked")
		Map<String, Object> session = (Map) ActionContext.getContext().getSession(); // �õ�session��Map��ʽ
		String studentid = (String) session.get("studentid"); // ȡ��session������Ϊstudentid��ֵ
		personPersonInfo.setStudentid(studentid); // �����ǻ�ȡ��ǰsession�е��û����Ĵ���
		goodsinfomy.setName(name);
		goodsinfomy.setPrice(price);
		goodsinfomy.setDes(des);
		goodsinfomy.setContact(contact);
		goodsinfomy.setTime(d);
		goodsinfomy.setPersonPersonInfo(personPersonInfo);
		goodsinfomyService.save(goodsinfomy);

		return SUCCESS;
	}

	public String delete() throws Exception {
		// personFavorite.setId(id);
		goodsinfomyService.delete(id);

		return SUCCESS;
	}

	public String modify() throws Exception {

		Date d = new Date();
		goodsinfomy.setId(Integer.parseInt(id));
		goodsinfomy.setName(name);
		goodsinfomy.setPrice(price);
		goodsinfomy.setDes(des);
		goodsinfomy.setContact(contact);
		goodsinfomy.setTime(d);
		@SuppressWarnings("unchecked")
		Map<String, Object> session = (Map) ActionContext.getContext().getSession(); // �õ�session��Map��ʽ
		String studentid = (String) session.get("studentid"); // ȡ��session������Ϊstudentid��ֵ
		personPersonInfo.setStudentid(studentid); // �����ǻ�ȡ��ǰsession�е��û����Ĵ���
		goodsinfomy.setPersonPersonInfo(personPersonInfo);
		goodsinfomyService.modify(goodsinfomy);

		return SUCCESS;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

}
