package unp.student.work.manager.dao.impl;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import unp.student.work.manager.service.WebStudentQuanXianService;
@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations="classpath:beans.xml")
public class StudentQuanXianDaoImplTest {

	@Resource
	private WebStudentQuanXianService service;
	@Test
	public void testDeleteByIds() {
		service.deleteByIds("4");
	}

}
