package unp.student.work.manager.dao;

import java.util.List;

import unp.student.work.manager.domain.comprehensive;
import unp.student.work.manager.domain.comprehensive_record;

public interface WorkComprehensiveRecordDao extends BaseDao<comprehensive_record> {
	//ͨ��ѧ�Ų�ѯ�۲�
	public List findByPageByStudent(int pageno,int size,String studentid);

	
	//��ȡѧ���۲���Ϣ
	public long findCountByPageByStudent(String studentid);
	
	
	//ͨ��ѧ�Ų�ѯ�۲� ��¼��
	public comprehensive_record findByStudent(String studentid); 
}
