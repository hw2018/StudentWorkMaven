package unp.student.work.manager.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import unp.student.work.manager.dao.GroupMoneyDao;
import unp.student.work.manager.dao.impl.GroupMoneyDaoImpl;
import unp.student.work.manager.domain.GroupMoney;

@WebServlet("/GroupMoney")
public class GroupMoneyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public GroupMoneyServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		GroupMoneyDao groupMoneyDao = new GroupMoneyDaoImpl();
		String type = request.getParameter("type");
		switch (type) {
		case "1"://返回显示社团资金流动页面
			Integer id = Integer.valueOf(request.getParameter("id"));
			List<GroupMoney> groupMoneys =groupMoneyDao.findByGid(id);
			Integer totalmoney = groupMoneyDao.totalOfGroup(id);
			request.setAttribute("groupMoneys", groupMoneys);
			request.setAttribute("totalmoney", totalmoney);
			request.getRequestDispatcher("group/group/gmoney_list.jsp").forward(request, response);
			break;
		case "2"://返回新增社团资金流动页面
			request.getRequestDispatcher("group/group/gmoney_add.jsp").forward(request, response);
			break;
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
