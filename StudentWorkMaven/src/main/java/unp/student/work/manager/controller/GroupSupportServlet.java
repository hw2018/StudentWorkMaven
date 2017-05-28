package unp.student.work.manager.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import unp.student.work.manager.dao.GroupSupportDao;
import unp.student.work.manager.dao.impl.GroupSupportDaoImpl;
import unp.student.work.manager.domain.GroupSupport;

@WebServlet("/GroupSupport")
public class GroupSupportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public GroupSupportServlet(){
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		GroupSupportDao groupSupportDao = new GroupSupportDaoImpl();
		String type = request.getParameter("type");
		switch(type){
		case "1"://返回查看社团赞助页面
			Integer id = (Integer) session.getAttribute("curGroup");
			List<GroupSupport> groupSupports = groupSupportDao.findByGid(id);
			request.setAttribute("gsupportList", groupSupports);
			request.getRequestDispatcher("group/group/gsupport_list.jsp").forward(request, response);
			break;
		case "2"://返回修改社团赞助页面
			id = Integer.valueOf(request.getParameter("gsupportid"));
			GroupSupport groupSupport = groupSupportDao.findById(id);
			request.setAttribute("groupSupport", groupSupport);
			request.getRequestDispatcher("group/group/gsupport_update.jsp").forward(request, response);
			break;
		case "3"://返回添加社团赞助页面
			request.getRequestDispatcher("group/group/gsupport_add.jsp").forward(request, response);
			break;
		case "4":
			id = Integer.valueOf(request.getParameter("gsupportid"));
			groupSupport = groupSupportDao.findById(id);
			request.setAttribute("groupSupport", groupSupport);
			request.getRequestDispatcher("group/group/gsupport_detail.jsp").forward(request, response);
			break;
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
