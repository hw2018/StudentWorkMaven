package unp.student.work.manager.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import unp.student.work.manager.dao.DormItemDao;

import unp.student.work.manager.domain.DormItem;
import unp.student.work.manager.service.DormItemService;
import unp.student.work.manager.utils.PageBean;

@Service("dormitemService")
public class DormItemServiceImpl extends BaseServiceImpl<DormItem> implements DormItemService {

	@Autowired
	private DormItemDao dormitemDao;
	
	public DormItemServiceImpl(){
		super(DormItem.class);
	}
	

	public PageBean findByPage(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		List dormitems=dormitemDao.findByPage(pageNo, pageSize);
		PageBean pageBean=new PageBean();
		pageBean.curPage=pageNo;
		pageBean.data=dormitems;
		pageBean.maxRowCount=(int) dormitemDao.findCount(DormItem.class);
		pageBean.countMaxPage();
		return pageBean;
				
	}
	

	public void update(DormItem dormitem){
		DormItem d=dormitemDao.get(DormItem.class, dormitem.getId());
		d.setDormId(dormitem.getDormId());
		d.setName(dormitem.getName());
		d.setStatus(dormitem.getStatus());
		d.setInformation(dormitem.getInformation());
		
	}
	
}
