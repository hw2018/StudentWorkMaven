package unp.student.work.manager.service;

import java.util.List;

import unp.student.work.manager.domain.StudentQuanxian;
import unp.student.work.manager.domain.TeacherQuanxian;

public interface WebTeacherQuanxianService {

	
	public TeacherQuanxian getByTeacher(int tid);
	
	public TeacherQuanxian getByTeacherByPassname(String passname);
	
	public List<TeacherQuanxian> query(String passname, int pageno,int size);

	public Long findCount();
	
	public void save(TeacherQuanxian tq);
	
	public void update(TeacherQuanxian tq);
	
	public void deleteByIds(String ids);
}
