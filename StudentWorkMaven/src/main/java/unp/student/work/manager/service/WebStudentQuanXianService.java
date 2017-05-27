package unp.student.work.manager.service;

import java.util.List;

import org.springframework.stereotype.Service;

import unp.student.work.manager.dao.BaseDao;
import unp.student.work.manager.domain.StudentQuanxian;
import unp.student.work.manager.domain.student_counsellor;



public interface WebStudentQuanXianService {
	
	
	public StudentQuanxian getByStduent(String studentid);
	
	public List<StudentQuanxian> query(String studentid, int pageno,int size);

	public Long findCount();
	
	public void save(StudentQuanxian sq);
	
	public void update(StudentQuanxian sq);
	
	public void deleteByIds(String ids);
}
