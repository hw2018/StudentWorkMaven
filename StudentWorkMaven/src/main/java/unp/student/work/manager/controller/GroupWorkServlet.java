package unp.student.work.manager.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import unp.student.work.manager.domain.GroupWork;
import unp.student.work.manager.dao.GroupWorkDao;
import unp.student.work.manager.dao.impl.GroupWorkDaoImpl;

@WebServlet("/GroupWork")
public class GroupWorkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public GroupWorkServlet(){
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		GroupWorkDao groupWorkDao = new GroupWorkDaoImpl();
		String type = request.getParameter("type");
		switch (type) {
		case "1"://返回值班页面
			Integer id =Integer.valueOf(request.getParameter("id"));
			GroupWork groupWork11 = groupWorkDao.findByGIdAndTime(id, 11);
			GroupWork groupWork12 = groupWorkDao.findByGIdAndTime(id, 12);
			GroupWork groupWork13 = groupWorkDao.findByGIdAndTime(id, 13);
			GroupWork groupWork14 = groupWorkDao.findByGIdAndTime(id, 14);
			GroupWork groupWork15 = groupWorkDao.findByGIdAndTime(id, 15);
			GroupWork groupWork21 = groupWorkDao.findByGIdAndTime(id, 21);
			GroupWork groupWork22 = groupWorkDao.findByGIdAndTime(id, 22);
			GroupWork groupWork23 = groupWorkDao.findByGIdAndTime(id, 23);
			GroupWork groupWork24 = groupWorkDao.findByGIdAndTime(id, 24);
			GroupWork groupWork25 = groupWorkDao.findByGIdAndTime(id, 25);
			GroupWork groupWork31 = groupWorkDao.findByGIdAndTime(id, 31);
			GroupWork groupWork32 = groupWorkDao.findByGIdAndTime(id, 32);
			GroupWork groupWork33 = groupWorkDao.findByGIdAndTime(id, 33);
			GroupWork groupWork34 = groupWorkDao.findByGIdAndTime(id, 34);
			GroupWork groupWork35 = groupWorkDao.findByGIdAndTime(id, 35);
			GroupWork groupWork41 = groupWorkDao.findByGIdAndTime(id, 41);
			GroupWork groupWork42 = groupWorkDao.findByGIdAndTime(id, 42);
			GroupWork groupWork43 = groupWorkDao.findByGIdAndTime(id, 43);
			GroupWork groupWork44 = groupWorkDao.findByGIdAndTime(id, 44);
			GroupWork groupWork45 = groupWorkDao.findByGIdAndTime(id, 45);
			GroupWork groupWork51 = groupWorkDao.findByGIdAndTime(id, 51);
			GroupWork groupWork52 = groupWorkDao.findByGIdAndTime(id, 52);
			GroupWork groupWork53 = groupWorkDao.findByGIdAndTime(id, 53);
			GroupWork groupWork54 = groupWorkDao.findByGIdAndTime(id, 54);
			GroupWork groupWork55 = groupWorkDao.findByGIdAndTime(id, 55);
			GroupWork groupWork61 = groupWorkDao.findByGIdAndTime(id, 61);
			GroupWork groupWork62 = groupWorkDao.findByGIdAndTime(id, 62);
			GroupWork groupWork63 = groupWorkDao.findByGIdAndTime(id, 63);
			GroupWork groupWork64 = groupWorkDao.findByGIdAndTime(id, 64);
			GroupWork groupWork65 = groupWorkDao.findByGIdAndTime(id, 65);
			GroupWork groupWork71 = groupWorkDao.findByGIdAndTime(id, 71);
			GroupWork groupWork72 = groupWorkDao.findByGIdAndTime(id, 72);
			GroupWork groupWork73 = groupWorkDao.findByGIdAndTime(id, 73);
			GroupWork groupWork74 = groupWorkDao.findByGIdAndTime(id, 74);
			GroupWork groupWork75 = groupWorkDao.findByGIdAndTime(id, 75);
			request.setAttribute("groupWork11", groupWork11);
			request.setAttribute("groupWork12", groupWork12);
			request.setAttribute("groupWork13", groupWork13);
			request.setAttribute("groupWork14", groupWork14);
			request.setAttribute("groupWork15", groupWork15);
			request.setAttribute("groupWork21", groupWork21);
			request.setAttribute("groupWork22", groupWork22);
			request.setAttribute("groupWork23", groupWork23);
			request.setAttribute("groupWork24", groupWork24);
			request.setAttribute("groupWork25", groupWork25);
			request.setAttribute("groupWork31", groupWork31);
			request.setAttribute("groupWork32", groupWork32);
			request.setAttribute("groupWork33", groupWork33);
			request.setAttribute("groupWork34", groupWork34);
			request.setAttribute("groupWork35", groupWork35);			
			request.setAttribute("groupWork41", groupWork41);
			request.setAttribute("groupWork42", groupWork42);
			request.setAttribute("groupWork43", groupWork43);
			request.setAttribute("groupWork44", groupWork44);
			request.setAttribute("groupWork45", groupWork45);
			request.setAttribute("groupWork51", groupWork51);
			request.setAttribute("groupWork52", groupWork52);
			request.setAttribute("groupWork53", groupWork53);
			request.setAttribute("groupWork54", groupWork54);
			request.setAttribute("groupWork55", groupWork55);
			request.setAttribute("groupWork61", groupWork61);
			request.setAttribute("groupWork62", groupWork62);
			request.setAttribute("groupWork63", groupWork63);
			request.setAttribute("groupWork64", groupWork64);
			request.setAttribute("groupWork65", groupWork65);
			request.setAttribute("groupWork71", groupWork71);
			request.setAttribute("groupWork72", groupWork72);
			request.setAttribute("groupWork73", groupWork73);
			request.setAttribute("groupWork74", groupWork74);
			request.setAttribute("groupWork75", groupWork75);
			request.getRequestDispatcher("group/group/gw_list.jsp").forward(request, response);
			break;
		case "2"://返回社团值班编辑页面
			id =Integer.valueOf(request.getParameter("id"));
			groupWork11 = groupWorkDao.findByGIdAndTime(id, 11);
			groupWork12 = groupWorkDao.findByGIdAndTime(id, 12);
			groupWork13 = groupWorkDao.findByGIdAndTime(id, 13);
			groupWork14 = groupWorkDao.findByGIdAndTime(id, 14);
			groupWork15 = groupWorkDao.findByGIdAndTime(id, 15);
			groupWork21 = groupWorkDao.findByGIdAndTime(id, 21);
			groupWork22 = groupWorkDao.findByGIdAndTime(id, 22);
			groupWork23 = groupWorkDao.findByGIdAndTime(id, 23);
			groupWork24 = groupWorkDao.findByGIdAndTime(id, 24);
			groupWork25 = groupWorkDao.findByGIdAndTime(id, 25);
			groupWork31 = groupWorkDao.findByGIdAndTime(id, 31);
			groupWork32 = groupWorkDao.findByGIdAndTime(id, 32);
			groupWork33 = groupWorkDao.findByGIdAndTime(id, 33);
			groupWork34 = groupWorkDao.findByGIdAndTime(id, 34);
			groupWork35 = groupWorkDao.findByGIdAndTime(id, 35);
			groupWork41 = groupWorkDao.findByGIdAndTime(id, 41);
			groupWork42 = groupWorkDao.findByGIdAndTime(id, 42);
			groupWork43 = groupWorkDao.findByGIdAndTime(id, 43);
			groupWork44 = groupWorkDao.findByGIdAndTime(id, 44);
			groupWork45 = groupWorkDao.findByGIdAndTime(id, 45);
			groupWork51 = groupWorkDao.findByGIdAndTime(id, 51);
			groupWork52 = groupWorkDao.findByGIdAndTime(id, 52);
			groupWork53 = groupWorkDao.findByGIdAndTime(id, 53);
			groupWork54 = groupWorkDao.findByGIdAndTime(id, 54);
			groupWork55 = groupWorkDao.findByGIdAndTime(id, 55);
			groupWork61 = groupWorkDao.findByGIdAndTime(id, 61);
			groupWork62 = groupWorkDao.findByGIdAndTime(id, 62);
			groupWork63 = groupWorkDao.findByGIdAndTime(id, 63);
			groupWork64 = groupWorkDao.findByGIdAndTime(id, 64);
			groupWork65 = groupWorkDao.findByGIdAndTime(id, 65);
			groupWork71 = groupWorkDao.findByGIdAndTime(id, 71);
			groupWork72 = groupWorkDao.findByGIdAndTime(id, 72);
			groupWork73 = groupWorkDao.findByGIdAndTime(id, 73);
			groupWork74 = groupWorkDao.findByGIdAndTime(id, 74);
			groupWork75 = groupWorkDao.findByGIdAndTime(id, 75);
			request.setAttribute("groupWork11", groupWork11);
			request.setAttribute("groupWork12", groupWork12);
			request.setAttribute("groupWork13", groupWork13);
			request.setAttribute("groupWork14", groupWork14);
			request.setAttribute("groupWork15", groupWork15);
			request.setAttribute("groupWork21", groupWork21);
			request.setAttribute("groupWork22", groupWork22);
			request.setAttribute("groupWork23", groupWork23);
			request.setAttribute("groupWork24", groupWork24);
			request.setAttribute("groupWork25", groupWork25);
			request.setAttribute("groupWork31", groupWork31);
			request.setAttribute("groupWork32", groupWork32);
			request.setAttribute("groupWork33", groupWork33);
			request.setAttribute("groupWork34", groupWork34);
			request.setAttribute("groupWork35", groupWork35);			
			request.setAttribute("groupWork41", groupWork41);
			request.setAttribute("groupWork42", groupWork42);
			request.setAttribute("groupWork43", groupWork43);
			request.setAttribute("groupWork44", groupWork44);
			request.setAttribute("groupWork45", groupWork45);
			request.setAttribute("groupWork51", groupWork51);
			request.setAttribute("groupWork52", groupWork52);
			request.setAttribute("groupWork53", groupWork53);
			request.setAttribute("groupWork54", groupWork54);
			request.setAttribute("groupWork55", groupWork55);
			request.setAttribute("groupWork61", groupWork61);
			request.setAttribute("groupWork62", groupWork62);
			request.setAttribute("groupWork63", groupWork63);
			request.setAttribute("groupWork64", groupWork64);
			request.setAttribute("groupWork65", groupWork65);
			request.setAttribute("groupWork71", groupWork71);
			request.setAttribute("groupWork72", groupWork72);
			request.setAttribute("groupWork73", groupWork73);
			request.setAttribute("groupWork74", groupWork74);
			request.setAttribute("groupWork75", groupWork75);
			request.getRequestDispatcher("group/group/gw_update.jsp").forward(request, response);
			break;
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
