package unp.student.work.manager.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import unp.student.work.manager.dao.DormBorrowApplyDao;
import unp.student.work.manager.domain.DormBorrowApply;
@Repository("dormborrowapplyDao")
public class DormBorrowApplyDaoImpl extends BaseDaoImpl<DormBorrowApply> implements DormBorrowApplyDao {
	public List findByPage(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return findByPage("from DormBorrowApply", pageNo, pageSize);
	}

}
