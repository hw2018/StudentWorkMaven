package unp.student.work.manager.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import unp.student.work.manager.domain.Goodsrbpall;
import unp.student.work.manager.domain.PersonPersonInfo;
import unp.student.work.manager.service.GoodsinfosearchService;
import unp.student.work.manager.service.GoodsrbpallService;

@Component
public class GoodsrbpallAction extends ActionSupport {
	private String id;
	private String name;
	private Double price;
	private String des;
	private String contact;
	private Date time;
	private String searchkey;
	private PersonPersonInfo personPersonInfo = new PersonPersonInfo();
	private Goodsrbpall goodsrbpall = new Goodsrbpall();
	private List<Goodsrbpall> list = null;

	public List<Goodsrbpall> getList() {
		return list;
	}

	public void setList(List<Goodsrbpall> list) {
		this.list = list;
	}

	@Resource
	private GoodsinfosearchService goodsinfosearchService = new GoodsinfosearchService();
	@Resource
	private GoodsrbpallService goodsrbpallService;

	public String add() throws Exception {

		Date d = new Date();
		@SuppressWarnings("unchecked")
		Map<String, Object> session = (Map) ActionContext.getContext().getSession(); // 得到session的Map形式
		String studentid = (String) session.get("studentid"); // 取出session中属性为studentid的值
		personPersonInfo.setStudentid(studentid); // 这里是获取当前session中的用户名的代码
		goodsrbpall.setName(name);
		goodsrbpall.setPrice(price);
		goodsrbpall.setDes(des);
		goodsrbpall.setContact(contact);
		goodsrbpall.setTime(d);
		goodsrbpall.setPersonPersonInfo(personPersonInfo);
		goodsrbpallService.save(goodsrbpall);

		return SUCCESS;
	}

	public String delete() throws Exception {
		// personFavorite.setId(id);
		goodsrbpallService.delete(id);

		return SUCCESS;
	}

	public String modify() throws Exception {

		Date d = new Date();
		goodsrbpall.setId(Integer.parseInt(id));
		goodsrbpall.setName(name);
		goodsrbpall.setPrice(price);
		goodsrbpall.setDes(des);
		goodsrbpall.setContact(contact);
		goodsrbpall.setTime(d);
		@SuppressWarnings("unchecked")
		Map<String, Object> session = (Map) ActionContext.getContext().getSession(); // 得到session的Map形式
		String studentid = (String) session.get("studentid"); // 取出session中属性为studentid的值
		personPersonInfo.setStudentid(studentid); // 这里是获取当前session中的用户名的代码
		goodsrbpall.setPersonPersonInfo(personPersonInfo);
		goodsrbpallService.modify(goodsrbpall);

		return SUCCESS;
	}

	public String search() throws Exception {
		// personFavorite.setId(id);
		// GoodsinfosearchPageDao goodsinfosearchPageDao = new
		// GoodsinfosearchPageDao();
		// goodsinfosearchPageDao.initialize(searchkey);
		// list = goodsinfosearchService.search(searchkey);
		Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
		request.put("key", searchkey);
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

	public String getSearchkey() {
		return searchkey;
	}

	public void setSearchkey(String searchkey) {
		this.searchkey = searchkey;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

}
