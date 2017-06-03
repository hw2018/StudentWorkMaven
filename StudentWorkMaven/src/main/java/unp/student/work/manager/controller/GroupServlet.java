package unp.student.work.manager.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import unp.student.work.manager.dao.GroupDao;
import unp.student.work.manager.dao.impl.GroupDaoImpl;
import unp.student.work.manager.domain.Group;

@WebServlet("/Group")
public class GroupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public GroupServlet() {
		// TODO Auto-generated constructor stub
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		GroupDao groupDao = new GroupDaoImpl();
		String type = request.getParameter("type"); // step1
		HttpSession session = request.getSession();
		switch (type) {
		case "1": // 返回新增社团页面
			request.getRequestDispatcher("group/group/group_add.jsp").forward(request, response);
			break;
		case "2": // 返回新增社团页面
			request.getRequestDispatcher("group/group/group_update.jsp").forward(request, response);
			break;
		/*case "2": // 显示基金列表
			int pageNo=1;
			if(request.getParameter("pageNo")!=null)
				pageNo=Integer.parseInt(request.getParameter("pageNo"));
			//List<Fund> funds = fundDao.findAll(); // step 2
			PageBean pageBean = fundService.getFunds(pageNo); // step 2
			request.setAttribute("fundList", pageBean);// step 3
			request.getRequestDispatcher("fund/fund_list.jsp").forward(request, response); // step																		// 4
			break;*/
		case "3":// 返回更新基金页面
			Integer id = Integer.valueOf(request.getParameter("id"));
			Group group = groupDao.findById(id);
			request.setAttribute("group", group);
			request.getRequestDispatcher("group/group/group_update.jsp").forward(request, response); // step																					// 4
			break;
		case "4": // 处理删除基金请求
			id = Integer.valueOf(request.getParameter("id"));
			groupDao.delete(id);
			request.getRequestDispatcher("group/group/group_show.jsp").forward(request, response); // step
			break;
		case "5": // 处理查看社团详细信息请求
			id =  Integer.valueOf(request.getParameter("id"));
			System.out.println(id);
			session.setAttribute("curGroup", id);
			group = groupDao.findById(id);
			request.setAttribute("group", group);
			request.getRequestDispatcher("group/group/group_detail.jsp").forward(request, response); // step																					// 4
			break;
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
