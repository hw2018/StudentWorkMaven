package unp.student.work.manager.service;

import unp.student.work.manager.domain.DormBorrowApply;

import unp.student.work.manager.utils.PageBean;

public interface DormBorrowApplyService extends BaseService<DormBorrowApply> {
	PageBean findByPage(int pageNo, int pageSize);
	public void update(DormBorrowApply dormborrowapply);
}
