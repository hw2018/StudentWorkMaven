package unp.student.work.manager.dao;

import java.util.List;

import unp.student.work.manager.domain.DormBorrowApply;

public interface DormBorrowApplyDao extends BaseDao<DormBorrowApply> {
	List findByPage(int pageNo, int pageSize);

}
