package unp.student.work.manager.dao.impl;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import unp.student.work.manager.dao.UserDao;
import unp.student.work.manager.domain.PersonInfo;
import unp.student.work.manager.domain.PersonPersonInfo;
@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations="classpath:beans.xml")
public class UserDaoImplTest {

	@Resource 
	private UserDao usedao;
	@Test
	public void testGet() {
		PersonInfo p=usedao.get("221400401");
		
		System.out.println(p.getName());
	}

}
