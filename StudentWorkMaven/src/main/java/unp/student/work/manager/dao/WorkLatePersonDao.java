package unp.student.work.manager.dao;

import java.util.List;

import unp.student.work.manager.domain.late_person;

public interface WorkLatePersonDao extends BaseDao<late_person> {
	
	//��ҳ��Ȩ�޲���
	public List findPageByStudent(String studentid,int pageno);//ѧ���������߼�¼
	public List findPageByManager(String studentid,int pageno);//����Ա���б�����δ������ļ�¼
	
	//��ҳ�������Ϣ��ѯѧ��
	public List findPageByLateInfoByStudent(int lateinfoid,int pageno,String studentid);//����δ��ͬ�⴦��ļ�¼
	//��ҳ�������Ϣ
	public List findPageByLateInfo(int lateinfoid,int pageno);//����δ��ͬ�⴦��ļ�¼
	//��ҳ��Ȩ�޷�״̬����
	public List findPageByStudentByStatus(String studentid,int pageno,int status);//ѧ���������߼�¼
	public List findPageByManagerByStatus(String studentid,int pageno,int status);//����Ա���б�����δ������ļ�¼
	
	//��¼��
	//��ҳ��Ȩ�޲���
		public long findCountByStudent(String studentid);//ѧ���������߼�¼
		public long findCountByManager(String studentid);//����Ա���б�����δ������ļ�¼
		
		//��ҳ�������Ϣ��ѯѧ��
		public long findCountByLateInfoByStudent(int lateinfoid,String studentid);//����δ��ͬ�⴦��ļ�¼
		
		
		//��ҳ��Ȩ�޷�״̬����
		public long findCountByStudentByStatus(String studentid,int status);//ѧ���������߼�¼
		public long findCountByManagerByStatus(String studentid,int status);//����Ա���б�����δ������ļ�¼
		
		//��ҳ�������Ϣ
		public long findCountByLateInfo(int lateinfoid);//����δ��ͬ�⴦��ļ�¼
	
}
