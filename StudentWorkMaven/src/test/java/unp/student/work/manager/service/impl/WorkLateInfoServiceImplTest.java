package unp.student.work.manager.service.impl;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import unp.student.work.manager.service.WorkLateInfoService;
@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations="classpath:beans.xml")
public class WorkLateInfoServiceImplTest {

	
	@Resource
	private WorkLateInfoService workLateInfoService;
	@Test
	public void testShowapplyByManager() {
		workLateInfoService.showapplyByStudent("221400407", 1, 1);
	}

}
