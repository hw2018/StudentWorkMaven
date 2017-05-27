package unp.student.work.manager.dao;

import java.util.List;

import unp.student.work.manager.domain.StudentQuanxian;

public interface WebStudentQuanXianDao extends BaseDao<StudentQuanxian>{

	
	public StudentQuanxian getByStudent(String studentid);
	
	public List<StudentQuanxian> query(String studentid, int pageno,int size);
	
	public void deleteByIds(String ids);
}
