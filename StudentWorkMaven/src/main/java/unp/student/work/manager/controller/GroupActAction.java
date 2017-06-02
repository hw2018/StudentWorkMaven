package unp.student.work.manager.controller;

import com.opensymphony.xwork2.ActionSupport;

import unp.student.work.manager.dao.GroupActDao;
import unp.student.work.manager.dao.impl.GroupActDaoImpl;
import unp.student.work.manager.domain.GroupAct;

public class GroupActAction extends ActionSupport {
	private GroupAct groupAct;
	private GroupActDao groupActDao =  new GroupActDaoImpl();
	
	public String add(){
		groupActDao.insert(groupAct);
		return SUCCESS;
	}
	public String update(){
		groupActDao.update(groupAct);
		return SUCCESS;
	}
	public GroupAct getGroupAct() {
		return groupAct;
	}

	public void setGroupAct(GroupAct groupAct) {
		this.groupAct = groupAct;
	}
}
