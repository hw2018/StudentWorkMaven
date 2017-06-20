package unp.student.work.manager.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Repository;

import unp.student.work.manager.dao.WebTeacherQuanxianDao;
import unp.student.work.manager.domain.StudentQuanxian;
import unp.student.work.manager.domain.TeacherQuanxian;

@Repository("teacherquanxianDao")
public class WebTeacherQuanxianDaoImpl extends BaseDaoImpl<TeacherQuanxian> implements
		WebTeacherQuanxianDao {


	public TeacherQuanxian getByTeacher(int tid) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		String hql="from TeacherQuanxian t where t.id=:tid";
		return (TeacherQuanxian)getSession().createQuery(hql).setInteger("tid",tid).uniqueResult();
	}


	public List<TeacherQuanxian> query(String  passname, int pageno, int size) {
		// TODO Auto-generated method stub
		String hql="from TeacherQuanxian t where t.passname like :passname";
		return getSession().createQuery(hql).setString("passname", "%"+ passname+"%")
				.setFirstResult((pageno-1)*size).setMaxResults(size).list();
	}


	public void deleteByIds(String ids) {
		// TODO Auto-generated method stub
		String hql="delete from TeacherQuanxian t where t.id in ("+ids+")";
		getSession().createQuery(hql).executeUpdate();
	}


	public TeacherQuanxian getByPassname(String passname) {
		// TODO Auto-generated method stub
		
		String hql="from TeacherQuanxian t where t.passname=:passname";
		return (TeacherQuanxian)getSession().createQuery(hql).setString("passname", passname).uniqueResult();
	}

	
}
