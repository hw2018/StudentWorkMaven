package unp.student.work.manager.controller;

import static org.junit.Assert.*;

import java.util.Date;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations="classpath:beans.xml")
public class LateInfoActionTest {

	@Resource
	private WorkLateInfoAction lateInfoAction;
	@Test
	public void testShow() {
		lateInfoAction.show();
	}

	@Test
	public void testdate() {
		;
	}
}