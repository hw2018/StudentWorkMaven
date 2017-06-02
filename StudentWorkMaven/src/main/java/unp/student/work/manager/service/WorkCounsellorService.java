package unp.student.work.manager.service;

import java.util.List;

import unp.student.work.manager.domain.counsellor;
import unp.student.work.manager.domain.student_counsellor;
import unp.student.work.manager.service.impl.CounsellorServiceImplTest;
import unp.student.work.manager.utils.PageBean;

public interface WorkCounsellorService {
	
	public List findCounsellorByStudent(String studentid);
	
	
	public List findProblem();
	
	public List findResult(String studentid,int select);
	
	
	public void addRecord(String studentid,float[] score,int select);
	
	public PageBean getResult(int pageno,int size);

}
