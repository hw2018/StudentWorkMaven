package unp.student.work.manager.service;

import unp.student.work.manager.domain.comprehensive;
import unp.student.work.manager.domain.comprehensive_record;
import unp.student.work.manager.domain.late_info;
import unp.student.work.manager.utils.PageBean;

public interface WorkComprehensiveService {
	
	
	public PageBean findByPage(int pageno,int size,String studnetid);//按页查询
	public void update(comprehensive_record c);//更新
	
	public comprehensive_record get(int cid);//获取综测
	
	public void addRecord(comprehensive_record c,String reason);//添加综测记录
	
	//分权限分页的申诉查询
	PageBean showapplyByStudent(String studentid,int pageno);
	PageBean showapplyByManager(int pageno);
	
	public void deleteRecord(int cid,String studentid);//删除综测记录并更新综测分
	
	
	public comprehensive getRecord(int cid);
	
	public void addapply(int cid,String reason);//添加申诉
	
	public void deleteapply(int cid);//删除申诉
	
	public void dealapply(int cid);//处理申诉

}
