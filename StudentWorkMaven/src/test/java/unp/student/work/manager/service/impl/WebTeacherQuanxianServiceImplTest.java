package unp.student.work.manager.service.impl;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import unp.student.work.manager.service.WebStudentQuanXianService;
import unp.student.work.manager.service.WebTeacherQuanxianService;
@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations="classpath:beans.xml")
public class WebTeacherQuanxianServiceImplTest {

	@Resource
	private WebTeacherQuanxianService webTeacherQuanxianService;

	@Test
	public void testGetByTeacher() {
		webTeacherQuanxianService.getByTeacher(1);
	}

	@Test
	public void testQuery() {
		webTeacherQuanxianService.query("", 1, 5);
	}

	@Test
	public void testFindCount() {
		webTeacherQuanxianService.findCount();
	}

}
