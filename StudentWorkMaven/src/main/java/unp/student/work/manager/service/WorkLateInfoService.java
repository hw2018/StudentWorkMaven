package unp.student.work.manager.service;

import java.util.List;



import unp.student.work.manager.domain.late_info;
import unp.student.work.manager.utils.PageBean;

public interface WorkLateInfoService {

	//�����Ϣ����
	public PageBean findByPage(int pageno,String studentid);//��ҳ��ѯ
	void add(late_info lateinfo,String id,String situation);//���������Ϣ
	void delete(late_info lateinfo);
	void update(late_info lateinfo,String situation);
	late_info get(int id);
	List findAll();
	Long findCount();
	
	//��������Ϣ ȱ����Ϣ����
	void deleteinfo(int lateinfoid,int latepersonid);
	void addinfo(int lateinfoid,String studentid);
	
	//������߲���
	void updateinfo(int latepersonid,String reason );
	void dealinfo(int lateinfoid,int latepersonid);
	void deleteapply(int latepersonid);
	
	
	PageBean showInfo(int pageno,int lateinfoid,String studentid);
	PageBean showapplyByStudent(String studentid,int pageno,int status);
	PageBean showapplyByManager(String studentid,int pageno,int status);
}
