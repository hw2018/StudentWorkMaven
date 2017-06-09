package unp.student.work.manager.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Repository;

import unp.student.work.manager.dao.WorkCounsellorDao;
import unp.student.work.manager.domain.counsellor;


@Repository("counsellorDao")
public class WorkCounsellorDaoImpl extends BaseDaoImpl<counsellor> implements WorkCounsellorDao {

	
	public List findByInfomation(String college, String term, String major,
			String grade) {
		// TODO Auto-generated method stub
		String hql="from counsellor c where c.college=:college and c.term=:term and c.major=:major and c.grade=:grade";
		return getSession().createQuery(hql).setString("college", college)
				.setString("term", term).setString("grade", grade)
				.setString("major", major).list();
	}

	
	public List getResultByPage(String name,int pageno, int size) {
		// TODO Auto-generated method stub
		String hql="from counsellor c where c.name like:name";
		return getSession().createQuery(hql).setString("name", "%"+name+"%").setFirstResult((pageno-1)*size)
				.setMaxResults(size).list();
	}




	public long getResultCountByPage(String name) {
		// TODO Auto-generated method stub
		String hql="select count(*) from counsellor c where c.name like:name";
		return (Long)getSession().createQuery(hql).setString("name", "%"+name+"%").uniqueResult();
	}

	

}
