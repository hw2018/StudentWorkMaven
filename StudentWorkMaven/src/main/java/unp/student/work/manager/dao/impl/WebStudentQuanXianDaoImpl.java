package unp.student.work.manager.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Repository;

import unp.student.work.manager.dao.WebStudentQuanXianDao;
import unp.student.work.manager.domain.StudentQuanxian;


@Repository("studentQuanXianDao")
public class WebStudentQuanXianDaoImpl extends BaseDaoImpl<StudentQuanxian> implements
		WebStudentQuanXianDao {

	public StudentQuanxian getByStudent(String studentid) {
		// TODO Auto-generated method stub
		String hql="from StudentQuanxian s where s.studentid=:studentid";
		return (StudentQuanxian)getSession().createQuery(hql).setString("studentid",studentid).uniqueResult();
	}

	public List<StudentQuanxian> query(String studentid, int pageno, int size) {
		String hql="from StudentQuanxian sq where sq.studentid like :studentid";
		return getSession().createQuery(hql).setString("studentid", "%"+ studentid+"%")
				.setFirstResult((pageno-1)*size).setMaxResults(size).list();
	}

	public void deleteByIds(String ids) {
		// TODO Auto-generated method stub
		String hql="delete from StudentQuanxian sq where sq.id in ("+ids+")";
		getSession().createQuery(hql).executeUpdate();
	}
	

	
}
