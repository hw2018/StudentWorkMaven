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
	
	//����ѧ�Ż�ȡѧ��Ȩ��
	public StudentQuanxian getByStduent(String studentid) {
		// TODO Auto-generated method stub
		return studentQuanXianDao.getByStudent(studentid);
	}
	//����ѧ�Ų�ѯѧ��Ȩ��
	public List<StudentQuanxian> query(String studentid, int pageno, int size) {
		// TODO Auto-generated method stub
		return studentQuanXianDao.query(studentid, pageno, size);
	}
	
	//��ȡѧ��Ȩ�޼�¼
	public Long findCount(){
		return studentQuanXianDao.findCount(StudentQuanxian.class);
	}
	
	//����ѧ��Ȩ��
	public void save(StudentQuanxian sq) {
		// TODO Auto-generated method stub
		studentQuanXianDao.save(sq);
		
	}
	
	//����ѧ��Ȩ��
	public void update(StudentQuanxian sq) {
		// TODO Auto-generated method stub
		studentQuanXianDao.update(sq);
	}
	
	//ɾ��ѧ��Ȩ��
	public void deleteByIds(String ids) {
		// TODO Auto-generated method stub
		studentQuanXianDao.deleteByIds(ids);
	}


}
