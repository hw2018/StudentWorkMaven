package unp.student.work.manager.dao;

import java.util.List;

import unp.student.work.manager.domain.counsellor;

public interface WorkCounsellorDao extends BaseDao<counsellor> {

	
	public List findByInfomation(String college,String term,String major,String grade);
	
	public List getResultByPage(String name,int pageno,int size);
	
	public long getResultCountByPage(String name);
}
