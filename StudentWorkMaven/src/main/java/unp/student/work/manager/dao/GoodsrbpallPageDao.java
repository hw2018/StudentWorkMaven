package unp.student.work.manager.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Controller;

import unp.student.work.manager.domain.Goodsrbpall;

@Controller
public class GoodsrbpallPageDao {
	public int totalRecord = 0; // 查询到的记录数量
	public int pageSize = 18; // 一页的记录数量
	public int pageCount = 0; // 总的页数

	@Resource
	private SessionFactory sessionFactory;

	public GoodsrbpallPageDao() {
		// getCurrentSession不能放到构造方法中？
	}

	public void initialize() // 完成成员变量的初始化工作
	{
		Session s = sessionFactory.getCurrentSession();
		Query q = s.createQuery("select count(*) from Goodsrbpall");
		Number number = (Number) q.uniqueResult(); // uniqueResult返回的是object类型。这一句实现了得到查询结果的记录数量而不用返回查询结果
		totalRecord = number.intValue(); // Number是Long和Integer的父类
		pageCount = (totalRecord % pageSize == 0 ? totalRecord / pageSize : totalRecord / pageSize + 1);

		// System.out.println(totalRecord+"测试"+pageSize+"sshi"+pageCount);
	}

	public List<Goodsrbpall> getPageResult(int curPage) {
		if (curPage == 0)
			return null;
		else {
			Session s = sessionFactory.getCurrentSession();
			@SuppressWarnings("unchecked") // 告诉编译器忽略指定的警告，如果没有这一句，编译器会警告funds是unchecked的
			List<Goodsrbpall> favorites = s.createQuery("from Goodsrbpall").setFirstResult((curPage - 1) * pageSize)
					.setMaxResults(pageSize).list();
			return favorites;
		}

	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

}