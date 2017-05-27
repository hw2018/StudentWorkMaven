package unp.student.work.manager.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import unp.student.work.manager.dao.WebStudentQuanXianDao;
import unp.student.work.manager.domain.StudentQuanxian;
import unp.student.work.manager.service.WebStudentQuanXianService;

@Service("studentQuanXianService")
public class WebStudentQuanXianServiceImpl implements WebStudentQuanXianService {

	@Resource
	private WebStudentQuanXianDao studentQuanXianDao;
	
	//根据学号获取学生权限
	public StudentQuanxian getByStduent(String studentid) {
		// TODO Auto-generated method stub
		return studentQuanXianDao.getByStudent(studentid);
	}
	//根据学号查询学生权限
	public List<StudentQuanxian> query(String studentid, int pageno, int size) {
		// TODO Auto-generated method stub
		return studentQuanXianDao.query(studentid, pageno, size);
	}
	
	//获取学生权限记录
	public Long findCount(){
		return studentQuanXianDao.findCount(StudentQuanxian.class);
	}
	
	//保存学生权限
	public void save(StudentQuanxian sq) {
		// TODO Auto-generated method stub
		studentQuanXianDao.save(sq);
		
	}
	
	//更新学生权限
	public void update(StudentQuanxian sq) {
		// TODO Auto-generated method stub
		studentQuanXianDao.update(sq);
	}
	
	//删除学生权限
	public void deleteByIds(String ids) {
		// TODO Auto-generated method stub
		studentQuanXianDao.deleteByIds(ids);
	}


}
