package unp.student.work.manager.dao;

import java.util.List;

import unp.student.work.manager.domain.DormRepair;

public interface DormRepairDao extends BaseDao<DormRepair> {
	List findByPage(int pageNo, int pageSize);
}
