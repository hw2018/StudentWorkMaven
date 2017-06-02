package unp.student.work.manager.dao.impl;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import unp.student.work.manager.dao.WorkLatePersonDao;
import unp.student.work.manager.domain.late_person;
@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations="classpath:beans.xml")
public class WorkLatePersonDaoImplTest {

	@Resource
	private WorkLatePersonDao workLatePersonDao;
	@Test
	public void testFindPageByStudentByStatus() {
		List l=workLatePersonDao.findPageByStudentByStatus("221400407", 1, 1);
		for(int i=0;i<l.size();i++){
			late_person person=(late_person)l.get(i);
			System.out.println(person.getId());
		}
	}

}
