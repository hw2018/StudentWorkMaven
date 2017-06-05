package unp.student.work.manager.dao.impl;


import java.util.List;

import org.springframework.stereotype.Repository;

import unp.student.work.manager.dao.DormItemDao;
import unp.student.work.manager.domain.DormItem;
@Repository("dormitemDao")
public class DormItemDaoImpl extends BaseDaoImpl<DormItem> implements DormItemDao {
	
	public List findByPage(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return findByPage("from DormItem", pageNo, pageSize);
	}


}
