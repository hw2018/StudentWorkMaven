package unp.student.work.manager.dao;

import java.util.List;

import unp.student.work.manager.domain.DormItem;

public interface DormItemDao extends BaseDao<DormItem> {
	List findByPage(int pageNo, int pageSize);
}
