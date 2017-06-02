package unp.student.work.manager.controller;

import java.util.Date;

import javax.print.attribute.standard.PrinterMessageFromOperator;

import org.apache.commons.lang3.ObjectUtils.Null;

import com.opensymphony.xwork2.ActionSupport;

import aj.org.objectweb.asm.Type;
import unp.student.work.manager.dao.GroupDao;
import unp.student.work.manager.dao.impl.GroupDaoImpl;
import unp.student.work.manager.domain.Group;

public class GroupAction extends ActionSupport {
	private Group group;
	private GroupDao groupDao = new GroupDaoImpl();
	
	public String add(){
		group.setCreateTime(new Date());
		groupDao.insert(group);
		return SUCCESS;
	}
	
	public String update(){
		groupDao.update(group);
		return SUCCESS;
	}
	
	public Group getGroup() {
		return group;
	}

	public void setGroup(Group group) {
		this.group = group;
	}

}
