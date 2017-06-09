package unp.student.work.manager.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Repository;

import unp.student.work.manager.dao.WorkComprehensiveDao;
import unp.student.work.manager.dao.WorkComprehensiveRecordDao;
import unp.student.work.manager.domain.comprehensive;
import unp.student.work.manager.domain.comprehensive_record;


@Repository("comprehensiveRecordDao")
public class WorkComprehensiveRecordDaoImpl extends BaseDaoImpl<comprehensive_record> implements
		WorkComprehensiveRecordDao{
	//ͨ��ѧ�Ų�ѯ�۲�
	public List findByPageByStudent(int pageno,int size,String studentid) {
		String hql="from comprehensive_record li where li.personInfo.studentid like :studentid";
		return getSession().createQuery(hql).setString("studentid", "%"+studentid+"%").setFirstResult((pageno-1)*10)
				.setMaxResults(size).list();
	}

	//��ȡѧ���۲���Ϣ
	public comprehensive_record findByStudent(String studentid) {
		// TODO Auto-generated method stub
		String hql="from comprehensive_record cr where cr.personInfo.studentid=:studentid";
		return (comprehensive_record)getSession().createQuery(hql).setString("studentid", studentid).uniqueResult();
	}
	
	
	//ͨ��ѧ�Ų�ѯ�۲�  ��¼��
	public long findCountByPageByStudent(String studentid) {
		// TODO Auto-generated method stub
		String hql="select count(*)from comprehensive_record li where li.personInfo.studentid like :studentid";
		return (Long)getSession().createQuery(hql).setString("studentid", "%"+studentid+"%").uniqueResult();
	}

	

}
