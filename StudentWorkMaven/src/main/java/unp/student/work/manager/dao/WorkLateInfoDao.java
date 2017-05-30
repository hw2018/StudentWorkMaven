package unp.student.work.manager.dao;

import java.util.List;

import unp.student.work.manager.domain.late_info;
import unp.student.work.manager.utils.PageBean;

public interface WorkLateInfoDao extends BaseDao<late_info> {
	
	public List findByPage(int pageno,String studentid);

	public long findCountByPage(int pageno,String studentid);
	
	
}
