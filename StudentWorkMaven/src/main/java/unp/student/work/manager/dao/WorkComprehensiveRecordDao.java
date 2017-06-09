package unp.student.work.manager.dao;

import java.util.List;

import unp.student.work.manager.domain.comprehensive;
import unp.student.work.manager.domain.comprehensive_record;

public interface WorkComprehensiveRecordDao extends BaseDao<comprehensive_record> {
	//通过学号查询综测
	public List findByPageByStudent(int pageno,int size,String studentid);

	
	//获取学生综测信息
	public long findCountByPageByStudent(String studentid);
	
	
	//通过学号查询综测 记录数
	public comprehensive_record findByStudent(String studentid); 
}
