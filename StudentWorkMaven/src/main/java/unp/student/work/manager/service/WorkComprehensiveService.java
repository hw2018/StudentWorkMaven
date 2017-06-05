package unp.student.work.manager.service;

import unp.student.work.manager.domain.comprehensive;
import unp.student.work.manager.domain.comprehensive_record;
import unp.student.work.manager.domain.late_info;
import unp.student.work.manager.utils.PageBean;

public interface WorkComprehensiveService {
	
	
	public PageBean findByPage(int pageno,int size,String studnetid);//��ҳ��ѯ
	public void update(comprehensive_record c);//����
	
	public comprehensive_record get(int cid);//��ȡ�۲�
	
	public void addRecord(comprehensive_record c,String reason);//����۲��¼
	
	//��Ȩ�޷�ҳ�����߲�ѯ
	PageBean showapplyByStudent(String studentid,int pageno);
	PageBean showapplyByManager(int pageno);
	
	public void deleteRecord(int cid,String studentid);//ɾ���۲��¼�������۲��
	
	
	public comprehensive getRecord(int cid);
	
	public void addapply(int cid,String reason);//�������
	
	public void deleteapply(int cid);//ɾ������
	
	public void dealapply(int cid);//��������

}
