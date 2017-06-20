package unp.student.work.manager.dao;

import java.util.List;

import unp.student.work.manager.domain.TeacherQuanxian;

public interface WebTeacherQuanxianDao extends BaseDao<TeacherQuanxian> {

public TeacherQuanxian getByTeacher(int tid);
	
	public List<TeacherQuanxian> query(String passname, int pageno,int size);
	
	public void deleteByIds(String ids);
	
	
	public TeacherQuanxian getByPassname(String passname);
}
