package unp.student.work.manager.controller;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import unp.student.work.manager.domain.TeacherQuanxian;

@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations="classpath:beans.xml")
public class WebTeacherQuanxianActionTest {

	@Resource
	private WebTeacherQuanxianAction webTeacherQuanxianAction;
	@Test
	public void testSave() {
		TeacherQuanxian tq=new TeacherQuanxian();
		tq.setPassname("111111");
		tq.setPassword("111111");
		tq.setQuanxian("11111");
		//webTeacherQuanxianAction.save();
	}

	@Test
	public void testUpdate() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeleteByIds() {
		fail("Not yet implemented");
	}

}
