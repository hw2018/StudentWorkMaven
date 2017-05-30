package unp.student.work.manager.service.impl;

import java.util.ArrayList;
import java.util.List;





import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import unp.student.work.manager.dao.WorkLateInfoDao;
import unp.student.work.manager.dao.WorkLatePersonDao;
import unp.student.work.manager.dao.UserDao;
import unp.student.work.manager.domain.late_info;
import unp.student.work.manager.domain.late_person;
import unp.student.work.manager.service.WorkLateInfoService;
import unp.student.work.manager.utils.PageBean;

@Service("lateInfoService")
public class WorkLateInfoServiceImpl implements WorkLateInfoService {
	
	@Resource
	private WorkLateInfoDao lateInfoDao;
	@Resource
	private UserDao userDao;
	@Resource
	private WorkLatePersonDao  latepersonDao;

	public PageBean findByPage(int pageno,String studentid) {//晚点信息分页
		// TODO Auto-generated method stub
		
		PageBean pageBean=new PageBean();
		pageBean.setData(lateInfoDao.findByPage(pageno,studentid));
		pageBean.setMaxPage((int)(lateInfoDao.findCountByPage(pageno,studentid)));
		pageBean.setCurPage(pageno);
		return pageBean;
	}

	public void add(late_info lateinfo,String id,String situation) {
		// TODO Auto-generated method stub
		//添加晚点信息时级联添加晚点具体信息记录
		lateinfo.setPersonInfo(userDao.get(id));
		String [] persons=situation.split(",");
		lateinfo.setNum(persons.length);
		int lid=(Integer)lateInfoDao.save(lateinfo);
		for(String studentid:persons){
			late_person latePerson=new late_person();
			latePerson.setPersonInfo(userDao.get(studentid));
			latePerson.setLate_info(lateInfoDao.get(late_info.class, lid));
			latePerson.setStatus(2);
			latepersonDao.save(latePerson);
		}
	}

	public void delete(late_info lateinfo) {
		// TODO Auto-generated method stub
		lateInfoDao.delete(late_info.class,lateinfo.getId());
	}

	public void update(late_info lateinfo ,String situation) {
		// TODO Auto-generated method stub
		if(situation==null){
			//删除bylateinfoid  所有的lateperson
		}
		
		
		String [] persons=situation.split(",");
		lateinfo.setNum(persons.length);
		lateInfoDao.update(lateinfo);
		lateinfo=lateInfoDao.get(late_info.class,lateinfo.getId() );
		//System.out.println(lateinfo.getTime());
		Set latePersons=lateinfo.getLate_persons();
		Object[] late_persons=latePersons.toArray();
		for(String studentid:persons){//判断是否已经有了  未实现没有的删除
			
			//System.out.println(studentid);
			int i=0;
			for(;i<late_persons.length;i++){
				if(((late_person) late_persons[i]).getPersonInfo().getStudentid().equals(studentid)){
					break;
				}
			}
			if(i==late_persons.length){//如果没有 添加
				late_person late_person1=new late_person();
				late_person1.setLate_info(lateinfo);
				late_person1.setPersonInfo(userDao.get(studentid));
			//	System.out.println(late_person1.getLate_info().getId()+late_person1.getPersonInfo().getStudentid());
				latepersonDao.save(late_person1);
			}
		}
		
		//hasSet实现
		
	}

	public List findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public Long findCount() {
		// TODO Auto-generated method stub
		return lateInfoDao.findCount(late_info.class);
	}

	public late_info get(int id) {
		// TODO Auto-generated method stub
		
		return lateInfoDao.get(late_info.class,id);
	}

	public void deleteinfo(int lateinfoid,int latepersonid) {
		// TODO Auto-generated method stub
		
		//删除晚点具体信息时级联更新晚点信息
		late_info late_info1=lateInfoDao.get(late_info.class, lateinfoid);
		late_info1.setNum(late_info1.getNum()-1);
		lateInfoDao.update(late_info1);
		latepersonDao.delete(late_person.class, latepersonid);
		
	}

	public void addinfo(int lateinfoid,String studentid) {
		
		//添加晚点具体信息时级联更新晚点信息
		late_info late_info1=lateInfoDao.get(late_info.class, lateinfoid);
		late_info1.setNum(late_info1.getNum()+1);
		lateInfoDao.update(late_info1);
		late_person latePerson=new late_person();
		latePerson.setLate_info(lateInfoDao.get(late_info.class, lateinfoid));
		latePerson.setPersonInfo(userDao.get(studentid));
		latePerson.setStatus(2);
		latepersonDao.save(latePerson);
		
		// TODO Auto-generated method stub
		
		
	}

	public void updateinfo(int latepersonid, String reason) {
		// TODO Auto-generated method stub
		
		late_person late_person1=latepersonDao.get(late_person.class, latepersonid);
		late_person1.setReason(reason);
		late_person1.setStatus(0);
		latepersonDao.update(late_person1);
		
	}

	public void dealinfo(int lateinfoid, int latepersonid) {
		// TODO Auto-generated method stub
		//处理晚点具体信息时级联更新晚点信息
		late_info late_info1=lateInfoDao.get(late_info.class, lateinfoid);
		late_info1.setNum(late_info1.getNum()-1);
		lateInfoDao.update(late_info1);
		
		late_person late_person1=latepersonDao.get(late_person.class, latepersonid);
		late_person1.setStatus(1);
		latepersonDao.update(late_person1);
		
	}

	
	//分页显示info

	public PageBean showInfo(int pageno,int lateinfoid,String studentid) {
		// TODO Auto-generated method stub
		if(studentid==null){
			List iList=latepersonDao.findPageByLateInfo(lateinfoid, pageno);
			PageBean pageBean=new PageBean();
			pageBean.setMaxRowCount((int)latepersonDao.findCountByLateInfo(lateinfoid));
			pageBean.setMaxPage(((int)latepersonDao.findCountByLateInfo(lateinfoid)/10)+1);
			pageBean.setCurPage(pageno);
		
			pageBean.setData(iList);
			return pageBean;	
		}else{
		List iList=latepersonDao.findPageByLateInfoByStudent(lateinfoid, pageno,studentid);
		PageBean pageBean=new PageBean();
		pageBean.setMaxRowCount((int)latepersonDao.findCountByLateInfoByStudent(lateinfoid,studentid));
		pageBean.setMaxPage(((int)latepersonDao.findCountByLateInfoByStudent(lateinfoid,studentid)/10)+1);
		pageBean.setCurPage(pageno);
	
		pageBean.setData(iList);
		return pageBean;
		}
	}

	
	//根据学生查找该学生申诉总记录
	public PageBean showapplyByStudent(String studentid, int pageno,int status) {
		// TODO Auto-generated method stub
		if(status==-1){
		List late_persons=latepersonDao.findPageByStudent(studentid, pageno);
		PageBean pageBean=new PageBean();
		pageBean.setMaxRowCount((int)latepersonDao.findCountByStudent(studentid));
		pageBean.setMaxPage((int)(latepersonDao.findCountByStudent(studentid)/10)+1);
		pageBean.setCurPage(pageno);
	
		pageBean.setData(late_persons);
		return pageBean;
		}
		else{
			List late_persons=latepersonDao.findPageByStudentByStatus(studentid, pageno,status);
			PageBean pageBean=new PageBean();
			pageBean.setMaxRowCount((int)latepersonDao.findCountByStudentByStatus(studentid,status));
			pageBean.setMaxPage((int)(latepersonDao.findCountByStudentByStatus(studentid,status)/10)+1);
			pageBean.setCurPage(pageno);
		
			pageBean.setData(late_persons);
			return pageBean;
		}
	}

	
	//根据管理员查找该管理员被申诉总记录
	public PageBean showapplyByManager(String studentid, int pageno,int status) {
		// TODO Auto-generated method stub
		if(status==-1){
		List late_persons=latepersonDao.findPageByManager(studentid, pageno);
		PageBean pageBean=new PageBean();
		pageBean.setMaxRowCount((int)latepersonDao.findCountByManager(studentid));
		pageBean.setMaxPage((int)(latepersonDao.findCountByManager(studentid)/10)+1);
		pageBean.setCurPage(pageno);
	
		pageBean.setData(late_persons);
		return pageBean;
		}else{
			List late_persons=latepersonDao.findPageByManagerByStatus(studentid, pageno,status);
			PageBean pageBean=new PageBean();
			pageBean.setMaxRowCount((int)latepersonDao.findCountByManagerByStatus(studentid,status));
			pageBean.setMaxPage((int)(latepersonDao.findCountByManagerByStatus(studentid,status)/10)+1);
			pageBean.setCurPage(pageno);
		
			pageBean.setData(late_persons);
			return pageBean;
		}
		
	}

	
	//删除申诉
	public void deleteapply(int latepersonid) {
		// TODO Auto-generated method stub
		late_person late_person=latepersonDao.get(late_person.class,latepersonid);
		late_person.setReason("");
		late_person.setStatus(2);
		latepersonDao.update(late_person);
		
	}


}
