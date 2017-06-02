package unp.student.work.manager.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import unp.student.work.manager.domain.Goodsinfoall;
import unp.student.work.manager.domain.PersonPersonInfo;
import unp.student.work.manager.service.GoodsinfoallService;
import unp.student.work.manager.service.GoodsinfosearchService;

@Component
public class GoodsInfoallAction extends ActionSupport {
	private String id;
	private String name;
	private Double price;
	private String des;
	private String contact;
	private Date time;
	private String searchkey;
	private PersonPersonInfo personPersonInfo = new PersonPersonInfo();
	private Goodsinfoall goodsinfoall = new Goodsinfoall();
	private List<Goodsinfoall> list = null;

	public List<Goodsinfoall> getList() {
		return list;
	}

	public void setList(List<Goodsinfoall> list) {
		this.list = list;
	}

	@Resource
	private GoodsinfosearchService goodsinfosearchService = new GoodsinfosearchService();
	@Resource
	private GoodsinfoallService goodsinfoallService;

	public String add() throws Exception {
		@SuppressWarnings("unchecked")
		Map<String, Object> session = (Map) ActionContext.getContext().getSession(); // 得到session的Map形式
		String studentid = (String) session.get("studentid"); // 取出session中属性为studentid的值
		Date d = new Date();
		personPersonInfo.setStudentid(studentid); // 这里是获取当前session中的用户名的代码
		goodsinfoall.setName(name);
		goodsinfoall.setPrice(price);
		goodsinfoall.setDes(des);
		goodsinfoall.setContact(contact);
		goodsinfoall.setTime(d);
		goodsinfoall.setPersonPersonInfo(personPersonInfo);
		goodsinfoallService.save(goodsinfoall);

		return SUCCESS;
	}

	public String delete() throws Exception {
		// personFavorite.setId(id);
		goodsinfoallService.delete(id);

		return SUCCESS;
	}

	public String modify() throws Exception {

		Date d = new Date();
		goodsinfoall.setId(Integer.parseInt(id));
		goodsinfoall.setName(name);
		goodsinfoall.setPrice(price);
		goodsinfoall.setDes(des);
		goodsinfoall.setContact(contact);
		goodsinfoall.setTime(d);
		@SuppressWarnings("unchecked")
		Map<String, Object> session = (Map) ActionContext.getContext().getSession(); // 得到session的Map形式
		String studentid = (String) session.get("studentid"); // 取出session中属性为studentid的值
		personPersonInfo.setStudentid(studentid); // 这里是获取当前session中的用户名的代码
		goodsinfoall.setPersonPersonInfo(personPersonInfo);
		goodsinfoallService.modify(goodsinfoall);

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
