package unp.student.work.manager.dao;

import java.util.List;

import unp.student.work.manager.domain.student_counsellor;

public interface StudentCounsellorDao extends BaseDao<student_counsellor> {
	
	public student_counsellor getRecordByStudentAndTeacher(String studentid,int cid);
	
	public long findByCounsellor(int cid);
	

}
