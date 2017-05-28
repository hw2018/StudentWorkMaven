package unp.student.work.manager.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import unp.student.work.manager.dao.GroupActDao;
import unp.student.work.manager.dao.impl.GroupActDaoImpl;
import unp.student.work.manager.domain.Group;
import unp.student.work.manager.domain.GroupAct;

@WebServlet("/GroupAct")
public class GroupActServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	public GroupActServlet(){
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		GroupActDao groupActDao = new GroupActDaoImpl();
		String type = request.getParameter("type");
		switch (type) {
		case "1"://处理查看社团会议请求
			Integer id = (Integer) session.getAttribute("curGroup");
			List<GroupAct> groupActs = groupActDao.findByGid(id);
			request.setAttribute("gaList", groupActs);
			request.getRequestDispatcher("group/group/ga_list.jsp").forward(request, response);
			break;
		case "2"://返回查看社团活动详细页面
			id = Integer.valueOf(request.getParameter("gaid"));
			GroupAct groupAct = groupActDao.findById(id);
			request.setAttribute("groupAct", groupAct);
			request.getRequestDispatcher("group/group/ga_detail.jsp").forward(request, response);
			break;
		case "3"://返回修改社团活动页面
			id = Integer.valueOf(request.getParameter("gaid"));
			groupAct = groupActDao.findById(id);
			request.setAttribute("groupAct", groupAct);
			request.getRequestDispatcher("group/group/ga_update.jsp").forward(request, response);
			break;
		case "4"://处理删除社团活动请求
			id = Integer.valueOf(request.getParameter("gaid"));
			groupActDao.delete(id);
			request.getRequestDispatcher("GroupAct?type=1").forward(request, response);
			break;
		case "5"://处理添加社团活动请求
			request.getRequestDispatcher("group/group/ga_add.jsp").forward(request, response);
			break;
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
