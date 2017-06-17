package unp.student.work.manager.dao.impl;


import java.util.List;

import org.springframework.stereotype.Repository;

import unp.student.work.manager.dao.DormRepairDao;
import unp.student.work.manager.domain.DormRepair;
@Repository("dormrepairDao")
public class DormRepairDaoImpl extends BaseDaoImpl<DormRepair> implements DormRepairDao {

	
	public List findByPage(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return findByPage("from DormRepair", pageNo, pageSize);
	}

}
