package unp.student.work.manager.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Service;

import unp.student.work.manager.dao.WebTeacherQuanxianDao;
import unp.student.work.manager.domain.StudentQuanxian;
import unp.student.work.manager.domain.TeacherQuanxian;
import unp.student.work.manager.service.WebTeacherQuanxianService;

@Service("teacherquanxianService")
public class WebTeacherQuanxianServiceImpl implements WebTeacherQuanxianService {

	
	@Resource
	private WebTeacherQuanxianDao webTeacherQuanxianDao;
	@Override
	public TeacherQuanxian getByTeacher(int tid) {
		// TODO Auto-generated method stub
		return webTeacherQuanxianDao.getByTeacher(tid);
	}

	@Override
	public List<TeacherQuanxian> query(String  passname, int pageno, int size) {
		// TODO Auto-generated method stub
		return webTeacherQuanxianDao.query(passname, pageno, size);
	}

	@Override
	public Long findCount() {
		// TODO Auto-generated method stub
		return webTeacherQuanxianDao.findCount(TeacherQuanxian.class);
	}

	@Override
	public void save(TeacherQuanxian tq) {
		// TODO Auto-generated method stub
		webTeacherQuanxianDao.save(tq);
	}

	@Override
	public void update(TeacherQuanxian tq) {
		// TODO Auto-generated method stub
		webTeacherQuanxianDao.update(tq);
	}

	@Override
	public void deleteByIds(String ids) {
		// TODO Auto-generated method stub
		webTeacherQuanxianDao.deleteByIds(ids);
	}


}