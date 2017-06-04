package unp.student.work.manager.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import unp.student.work.manager.dao.DormRepairDao;

import unp.student.work.manager.domain.DormRepair;
import unp.student.work.manager.service.DormRepairService;
import unp.student.work.manager.utils.PageBean;

@Service("dormrepairService")
public class DormRepairServiceImpl extends BaseServiceImpl<DormRepair> implements DormRepairService {

	@Autowired
	private DormRepairDao dormrepairDao;
	
	public DormRepairServiceImpl() {
		super(DormRepair.class);
		// TODO Auto-generated constructor stub
	}
	

	public PageBean findByPage(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		List dormrepairs=dormrepairDao.findByPage(pageNo, pageSize);
		PageBean pageBean=new PageBean();
		pageBean.curPage=pageNo;
		pageBean.data=dormrepairs;
		pageBean.maxRowCount=(int) dormrepairDao.findCount(DormRepair.class);
		pageBean.countMaxPage();
		return pageBean;
				
	}
	

	public void update(DormRepair dormrepair){
		DormRepair d=dormrepairDao.get(DormRepair.class, dormrepair.getId());
		d.setDormId(dormrepair.getDormId());
		d.setStudentId(dormrepair.getStudentId());
		d.setContent(dormrepair.getContent());
		d.setStatus(dormrepair.getStatus());
		d.setComment(dormrepair.getComment());
	}

}
