package unp.student.work.manager.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import unp.student.work.manager.dao.DormRecordDao;
import unp.student.work.manager.domain.DormRecord;
import unp.student.work.manager.service.DormRecordService;
import unp.student.work.manager.utils.PageBean;

@Service("dormrecordService")
public class DormRecordServiceImpl extends BaseServiceImpl<DormRecord> implements DormRecordService {

	@Autowired
	private DormRecordDao dormrecordDao;
	
	public DormRecordServiceImpl() {
		super(DormRecord.class);
		// TODO Auto-generated constructor stub
	}
	
	public PageBean findByPage(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		List dormrecords=dormrecordDao.findByPage(pageNo, pageSize);
		PageBean pageBean=new PageBean();
		pageBean.curPage=pageNo;
		pageBean.data=dormrecords;
		pageBean.maxRowCount=(int) dormrecordDao.findCount(DormRecord.class);
		pageBean.countMaxPage();
		return pageBean;
				
	}
	
	public void update(DormRecord dormrecord){
		DormRecord d=dormrecordDao.get(DormRecord.class, dormrecord.getId());
		d.setDormId(dormrecord.getDormId());
		d.setSort(dormrecord.getSort());
		d.setContent(dormrecord.getContent());
	}

}
