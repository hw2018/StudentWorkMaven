package unp.student.work.manager.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import unp.student.work.manager.dao.WorkComprehensiveDao;
import unp.student.work.manager.dao.WorkComprehensiveRecordDao;
import unp.student.work.manager.domain.comprehensive;
import unp.student.work.manager.domain.comprehensive_record;
import unp.student.work.manager.domain.late_info;
import unp.student.work.manager.service.WorkComprehensiveService;
import unp.student.work.manager.utils.PageBean;


@Service("comprehensiveService")
public class WorkComprehensiveServiceImpl implements WorkComprehensiveService {

	@Resource
	private WorkComprehensiveRecordDao comprehensiveRecordDao;
	@Resource
	private WorkComprehensiveDao comprehensiveDao;
	public PageBean findByPage(int pageno,int size,String studentid) {
		// TODO Auto-generated method stub

		PageBean pageBean=new PageBean();
		pageBean.setData(comprehensiveRecordDao.findByPageByStudent(pageno,size,studentid));
		pageBean.setMaxRowCount((int)comprehensiveRecordDao.findCountByPageByStudent(studentid));
		pageBean.setMaxPage((int)(comprehensiveRecordDao.findCountByPageByStudent(studentid)/10)+1);
		pageBean.setCurPage(pageno);
		return pageBean;
	}

	public void update(comprehensive_record c) {
		// TODO Auto-generated method stub
		float score=c.getScore();
		c=comprehensiveRecordDao.get(comprehensive_record.class, c.getId());
		c.setScore(score);
		comprehensiveRecordDao.update(c);
	}

	public comprehensive_record get(int cid) {//查询综测
		// TODO Auto-generated method stub
		
		return comprehensiveRecordDao.get(comprehensive_record.class, cid);
	}

	//增加综测记录
	public void addRecord(comprehensive_record c, String record) {
		// TODO Auto-generated method stub
		comprehensive comprehensive1=new comprehensive();
		comprehensive1.setFinal_(c.getScore());
		comprehensive1.setLast(comprehensiveRecordDao.get(comprehensive_record.class, c.getId()).getScore());
		comprehensive1.setPersonInfo(comprehensiveRecordDao.get(comprehensive_record.class, c.getId()).getPersonInfo());
		comprehensive1.setRecord(record);
		comprehensive1.setStatus(2);
		comprehensiveDao.save(comprehensive1);
		
	}

	//学生查询申诉
	public PageBean showapplyByStudent(String studentid, int pageno) {
		// TODO Auto-generated method stub
		
		PageBean pageBean=new PageBean();
		pageBean.setData(comprehensiveDao.findPageByStudent(studentid, pageno));
		pageBean.setMaxRowCount((int)comprehensiveDao.findCountByStudent(studentid));
		pageBean.setMaxPage(((int)comprehensiveDao.findCountByStudent(studentid)/10)+1);
		pageBean.setCurPage(pageno);
		return pageBean;
	}
	//管理员查询申诉
	public PageBean showapplyByManager( int pageno) {
		// TODO Auto-generated method stub
		PageBean pageBean=new PageBean();
		pageBean.setData(comprehensiveDao.findPageByManager(pageno));
		pageBean.setMaxRowCount((int)comprehensiveDao.findCountByManager());
		pageBean.setMaxPage((int)(comprehensiveDao.findCountByManager()/10)+1);
		pageBean.setCurPage(pageno);
		return pageBean;
	}

	public void deleteRecord(int cid,String studentid) {
		// TODO Auto-generated method stub
		comprehensive c=comprehensiveDao.get(comprehensive.class, cid);
		float cha=c.getFinal_()-c.getLast();
		
		comprehensive_record cRecord=comprehensiveRecordDao.findByStudent(studentid);
		cRecord.setScore(cRecord.getScore()-cha);
		comprehensiveRecordDao.update(cRecord);
		
		comprehensiveDao.delete(comprehensive.class,cid);
	}

	public comprehensive getRecord(int cid) {//查询综测记录
		// TODO Auto-generated method stub

		return comprehensiveDao.get(comprehensive.class, cid);	
		}

	public void addapply(int cid,String reason) {
		// TODO Auto-generated method stub
		comprehensive c=comprehensiveDao.get(comprehensive.class, cid);
		c.setStatus(0);
		c.setReason(reason);
		comprehensiveDao.update(c);
		
	}

	public void deleteapply(int cid) {
		// TODO Auto-generated method stub
		comprehensive c=comprehensiveDao.get(comprehensive.class, cid);
		c.setReason("");
		c.setStatus(2);
		comprehensiveDao.update(c);
		
	}

	public void dealapply(int cid) {
		// TODO Auto-generated method stub
		comprehensive c=comprehensiveDao.get(comprehensive.class, cid);
		float cha=c.getFinal_()-c.getLast();
		comprehensive_record cRecord=comprehensiveRecordDao.findByStudent(c.getPersonInfo().getStudentid());
		cRecord.setScore(cRecord.getScore()-cha);
		comprehensiveRecordDao.update(cRecord);
		
		c.setStatus(1);
		comprehensiveDao.update(c);
	}

}
