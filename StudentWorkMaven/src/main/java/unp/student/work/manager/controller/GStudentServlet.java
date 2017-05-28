package unp.student.work.manager.controller;

import java.io.IOException;

import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import unp.student.work.manager.dao.GStudentDao;
import unp.student.work.manager.dao.impl.GStudentDaoImpl;
import unp.student.work.manager.domain.GStudent;

@WebServlet("/GStudent")
public class GStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public  GStudentServlet() {
		// TODO Auto-generated constructor stub
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		GStudentDao gStudentDao = new GStudentDaoImpl();
		String type = request.getParameter("type");
		switch(type){
		case "1"://返回查看社团成员页面
			Integer id = (Integer) session.getAttribute("curGroup");
			List<GStudent> gStudnets = gStudentDao.findByGid(id); 
			request.setAttribute("gsList", gStudnets);
			request.getRequestDispatcher("group/group/gs_list.jsp").forward(request, response);
			break;
		case "2"://返回社团成员修改页面
			Integer curGroup = (Integer) session.getAttribute("curGroup");
			id =Integer.valueOf(request.getParameter("gsid"));
			GStudent gStudent = gStudentDao.findById(id);
			request.setAttribute("gStudent", gStudent);
			request.getRequestDispatcher("group/group/gs_update.jsp").forward(request, response);
			break;
		case "3"://返回社团成员增加页面
			id = Integer.valueOf(request.getParameter("id"));
			request.setAttribute("id", id);
			request.getRequestDispatcher("group/group/gs_add.jsp").forward(request, response);
			break;
		case "4"://处理删除社团成员请求
			id = Integer.valueOf(request.getParameter("gsid"));
			gStudentDao.delete(id);
			request.getRequestDispatcher("GStudent?type=1").forward(request, response);
			break;
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
