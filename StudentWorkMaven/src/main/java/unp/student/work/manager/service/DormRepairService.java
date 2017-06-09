package unp.student.work.manager.service;


import unp.student.work.manager.domain.DormRepair;
import unp.student.work.manager.utils.PageBean;

public interface DormRepairService extends BaseService<DormRepair> {
	PageBean findByPage(int pageNo, int pageSize);
	public void update(DormRepair dormrepair);
}
