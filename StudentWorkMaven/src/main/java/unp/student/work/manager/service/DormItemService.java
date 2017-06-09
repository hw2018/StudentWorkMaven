package unp.student.work.manager.service;

import unp.student.work.manager.domain.DormItem;
import unp.student.work.manager.utils.PageBean;

public interface DormItemService extends BaseService<DormItem> {
	PageBean findByPage(int pageNo, int pageSize);
	public void update(DormItem dormitem);
}
