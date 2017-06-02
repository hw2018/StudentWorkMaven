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
	public int totalRecord = 0; // ��ѯ���ļ�¼����
	public int pageSize = 18; // һҳ�ļ�¼����
	public int pageCount = 0; // �ܵ�ҳ��

	@Resource
	private SessionFactory sessionFactory;

	public GoodsrbpallPageDao() {
		// getCurrentSession���ܷŵ����췽���У�
	}

	public void initialize() // ��ɳ�Ա�����ĳ�ʼ������
	{
		Session s = sessionFactory.getCurrentSession();
		Query q = s.createQuery("select count(*) from Goodsrbpall");
		Number number = (Number) q.uniqueResult(); // uniqueResult���ص���object���͡���һ��ʵ���˵õ���ѯ����ļ�¼���������÷��ز�ѯ���
		totalRecord = number.intValue(); // Number��Long��Integer�ĸ���
		pageCount = (totalRecord % pageSize == 0 ? totalRecord / pageSize : totalRecord / pageSize + 1);

		// System.out.println(totalRecord+"����"+pageSize+"sshi"+pageCount);
	}

	public List<Goodsrbpall> getPageResult(int curPage) {
		if (curPage == 0)
			return null;
		else {
			Session s = sessionFactory.getCurrentSession();
			@SuppressWarnings("unchecked") // ���߱���������ָ���ľ��棬���û����һ�䣬�������ᾯ��funds��unchecked��
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