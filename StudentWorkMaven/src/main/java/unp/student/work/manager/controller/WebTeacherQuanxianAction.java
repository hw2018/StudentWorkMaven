package unp.student.work.manager.controller;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.stereotype.Controller;

import unp.student.work.manager.domain.StudentQuanxian;
import unp.student.work.manager.domain.TeacherQuanxian;
import unp.student.work.manager.service.WebTeacherQuanxianService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
@Controller("teacherquanxianAction")
public class WebTeacherQuanxianAction extends ActionSupport implements RequestAware,SessionAware,ModelDriven<TeacherQuanxian>{

	
	
	private Map request=null;
	private Map session=null;
	private TeacherQuanxian tq=new TeacherQuanxian();
	
	
	@Resource
	private WebTeacherQuanxianService webTeacherQuanxianService;
	
	
	private int page;
	private int rows;
	
	private Map<String, Object> pageMap=null;//json分页信息
	
	private String ids;//接受删除的id连接的字符串
	
	private InputStream inputStream;//返回删除结果
	
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public Map<String, Object> getPageMap() {
		return pageMap;
	}

	public void setPageMap(Map<String, Object> pageMap) {
		this.pageMap = pageMap;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	@Override
	public TeacherQuanxian getModel() {
		// TODO Auto-generated method stub
		return tq;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.session=arg0;
	}

	@Override
	public void setRequest(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.request=arg0;
	}

	//获取教师权限信息
	public String query(){
		pageMap=new HashMap<String, Object>();
		List<TeacherQuanxian> tqlist=webTeacherQuanxianService.query(tq.getPassname(), page, rows);
		pageMap.put("rows", tqlist);
		
		Long total=webTeacherQuanxianService.findCount();
		
		pageMap.put("total", total);
		
		return "jsonMap";//通过json传递数据
	}
	
	
	//保存学生权限
		public void save(){
	
		}
		
		//更新学生权限
		public void update(){
		
		}
		
		
		//删除学生权限
		public String deleteByIds() {
			return null;
		
		}

	
	
}
