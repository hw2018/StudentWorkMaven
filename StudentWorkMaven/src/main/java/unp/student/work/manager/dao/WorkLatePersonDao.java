package unp.student.work.manager.dao;

import java.util.List;

import unp.student.work.manager.domain.late_person;

public interface WorkLatePersonDao extends BaseDao<late_person> {
	
	//分页分权限查找
	public List findPageByStudent(String studentid,int pageno);//学生所有申诉记录
	public List findPageByManager(String studentid,int pageno);//管理员所有被申诉未被处理的记录
	
	//分页分晚点信息查询学号
	public List findPageByLateInfoByStudent(int lateinfoid,int pageno,String studentid);//所有未被同意处理的记录
	//分页分晚点信息
	public List findPageByLateInfo(int lateinfoid,int pageno);//所有未被同意处理的记录
	//分页分权限分状态查找
	public List findPageByStudentByStatus(String studentid,int pageno,int status);//学生所有申诉记录
	public List findPageByManagerByStatus(String studentid,int pageno,int status);//管理员所有被申诉未被处理的记录
	
	//记录数
	//分页分权限查找
		public long findCountByStudent(String studentid);//学生所有申诉记录
		public long findCountByManager(String studentid);//管理员所有被申诉未被处理的记录
		
		//分页分晚点信息查询学号
		public long findCountByLateInfoByStudent(int lateinfoid,String studentid);//所有未被同意处理的记录
		
		
		//分页分权限分状态查找
		public long findCountByStudentByStatus(String studentid,int status);//学生所有申诉记录
		public long findCountByManagerByStatus(String studentid,int status);//管理员所有被申诉未被处理的记录
		
		//分页分晚点信息
		public long findCountByLateInfo(int lateinfoid);//所有未被同意处理的记录
	
}
