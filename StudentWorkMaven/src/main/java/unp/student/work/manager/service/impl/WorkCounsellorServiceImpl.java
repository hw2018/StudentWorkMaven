package unp.student.work.manager.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import unp.student.work.manager.dao.WorkCounsellorDao;
import unp.student.work.manager.dao.StudentCounsellorDao;
import unp.student.work.manager.dao.UserDao;
import unp.student.work.manager.domain.PersonInfo;
import unp.student.work.manager.domain.counsellor;
import unp.student.work.manager.domain.student_counsellor;
import unp.student.work.manager.service.WorkCounsellorService;
import unp.student.work.manager.utils.PageBean;

@Service("counsellorService")
public class WorkCounsellorServiceImpl implements WorkCounsellorService {

	
	@Resource
	private WorkCounsellorDao counsellorDao;
	@Resource
	private UserDao userDao;
	@Resource
	private StudentCounsellorDao studentCounsellorDao;
	public List findCounsellorByStudent(String studentid) {
		// TODO Auto-generated method stub
		PersonInfo p=userDao.get(studentid);
		String term=(new Date().getYear()+1900)+"";
		if(new Date().getMonth()<6){
			term=term+"01";
		}else{
			term=term+"02";
		}
		return counsellorDao.findByInfomation(p.getCollege(), term, p.getMajor(), p.getGrade());
	}
	public List findProblem() {
		// TODO Auto-generated method stub
		String urlString=getClass().getClassLoader().getResource("")+"problem.properties";
		String url=urlString.substring(6);
		List problemList=new ArrayList<String>();
		InputStream in = null;
		try {
			in = new FileInputStream(new File(url));
		} catch (FileNotFoundException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		Properties p=new Properties();
		try {
			p.load(in);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for(int i=1;i<=p.size();i++){
			problemList.add(p.get(""+i));
		}
		
		return problemList;
	}
	public List findResult(String studentid, int select) {
		// TODO Auto-generated method stub
		student_counsellor sc=studentCounsellorDao.getRecordByStudentAndTeacher(studentid, select);
		if(sc==null){
			
			List result=new ArrayList<Integer>();
			for(int i=0;i<25;i++){
				result.add(-1);
			}
			return result;
		}
		else{
			List result=new ArrayList<Integer>();
				String resultString=sc.getValue();
			String[] s=resultString.split(",");	
			for(int i=0;i<s.length;i++){
				System.out.println(s[i]);
				result.add(s[i]);
			}
			return result;
		}
	}
	public void addRecord(String studentid,float[] score, int select) {
		// TODO Auto-generated method stub
		float total=0;
		String scoresString="";
		for(int i=0;i<score.length;i++){
			total+=score[i];
			scoresString=scoresString+score[i]+",";
		}
		counsellor c=counsellorDao.get(counsellor.class, select);
		student_counsellor sc=new student_counsellor();
		
		sc.setPersonInfo(userDao.get(studentid));
		sc.setValue(scoresString);
		sc.setScore(total);
		
		//studentCounsellorDao.save(sc);
		//更新教师分数
		int num=(int)studentCounsellorDao.findByCounsellor(select);
		
		if(num==0){
			
			c.setScore(total);
		}else{
			
			float fscore=c.getScore()*num;
			fscore=(fscore+total)/(num+1);
			c.setScore(fscore);
		}
		
		
		
		
		counsellorDao.update(c);
		sc.setCounsellor(counsellorDao.get(counsellor.class, select));
		studentCounsellorDao.save(sc);
		
		
	}
	
	public PageBean getResult(String name,int pageno,int size) {
		// TODO Auto-generated method stub
		PageBean pageBean=new PageBean();
		pageBean.setCurPage(pageno);
		pageBean.setData(counsellorDao.getResultByPage(name, pageno, size));
		pageBean.setMaxPage((int)counsellorDao.getResultCountByPage(name)/size);
		
		return pageBean;
	}


}
