package unp.student.work.manager.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import unp.student.work.manager.dao.DormBorrowApplyDao;

import unp.student.work.manager.domain.DormBorrowApply;
import unp.student.work.manager.service.DormBorrowApplyService;
import unp.student.work.manager.utils.PageBean;

@Service("dormborrowapplyService")
public class DormBorrowApplyServiceImpl extends BaseServiceImpl<DormBorrowApply> implements DormBorrowApplyService {

	@Autowired
	private DormBorrowApplyDao dormborrowapplyDao;
	
	public DormBorrowApplyServiceImpl() {
		super(DormBorrowApply.class);
		// TODO Auto-generated constructor stub
	}
	

	public PageBean findByPage(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		List dormborrowapplys=dormborrowapplyDao.findByPage(pageNo, pageSize);
		PageBean pageBean=new PageBean();
		pageBean.curPage=pageNo;
		pageBean.data=dormborrowapplys;
		pageBean.maxRowCount=(int) dormborrowapplyDao.findCount(DormBorrowApply.class);
		pageBean.countMaxPage();
		return pageBean;
				
	}
	

	public void update(DormBorrowApply dormborrowapply){
		DormBorrowApply d=dormborrowapplyDao.get(DormBorrowApply.class, dormborrowapply.getId());
		d.setItemId(dormborrowapply.getItemId());
		d.setStudentId(dormborrowapply.getStudentId());
		d.setStatus(dormborrowapply.getStatus());
		
	}

}
