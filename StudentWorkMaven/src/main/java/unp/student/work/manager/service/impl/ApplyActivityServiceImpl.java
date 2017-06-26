
package unp.student.work.manager.service.impl;
import java.util.List;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;




import unp.student.work.manager.dao.ApplyActivityDao;
import unp.student.work.manager.domain.*;
import unp.student.work.manager.service.ApplyActivityService;
import unp.student.work.manager.utils.PageBean;

@Service("activityService")
public class ApplyActivityServiceImpl extends BaseServiceImpl<Activity> implements ApplyActivityService {

	@Autowired
	private ApplyActivityDao activityDao;
	
	public ApplyActivityServiceImpl() {
		super(Activity.class);
		// TODO 鑷姩鐢熸垚鐨勬瀯閫犲嚱鏁板瓨鏍�
	}
	
	
	public PageBean findByPage(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		List activities=activityDao.findByPage(pageNo, pageSize);
		PageBean pageBean=new PageBean();
		pageBean.curPage=pageNo;
		pageBean.data=activities;
		pageBean.maxRowCount=(int) activityDao.findCount(Activity.class);
		pageBean.countMaxPage();
		return pageBean;		
	}
	
	public void update(Activity activity){
		Activity f=activityDao.get(Activity.class, activity.getId());
		f.setPeoplenumber(activity.getPeoplenumber());
		f.setCarnumber(activity.getCarnumber());
		f.setLeadteacher(activity.getLeadteacher());
		f.setPrincipal(activity.getPrincipal());
	}
	
}
