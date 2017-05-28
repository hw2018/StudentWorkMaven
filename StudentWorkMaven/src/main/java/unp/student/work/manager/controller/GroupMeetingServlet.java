package unp.student.work.manager.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import unp.student.work.manager.dao.GroupMeetingDao;
import unp.student.work.manager.dao.impl.GroupMeetingDaoImpl;
import unp.student.work.manager.domain.GroupMeeting;

@WebServlet("/GroupMeeting")
public class GroupMeetingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public GroupMeetingServlet(){
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		GroupMeetingDao groupMeetingDao= new GroupMeetingDaoImpl();
		String type = request.getParameter("type");
		switch(type){
		case "1"://返回查看社团会议页面
			Integer id = (Integer) session.getAttribute("curGroup");
			List<GroupMeeting> groupMeetings = groupMeetingDao.findByGid(id);
			request.setAttribute("gmList", groupMeetings);
			request.getRequestDispatcher("group/group/gm_list.jsp").forward(request, response);
			break;
		case "2"://返回查看社团会议详细页面
			id = Integer.valueOf(request.getParameter("gmid"));
			GroupMeeting groupMeeting=groupMeetingDao.findById(id);
			request.setAttribute("groupMeeting", groupMeeting);
			request.getRequestDispatcher("group/group/gm_detail.jsp").forward(request, response);
			break;
		case "3"://返回修改社团会议页面
			id = Integer.valueOf(request.getParameter("gmid"));
			groupMeeting = groupMeetingDao.findById(id);
			request.setAttribute("groupMeeting", groupMeeting);
			request.getRequestDispatcher("group/group/gm_update.jsp").forward(request, response);
			break;
		case "4"://处理删除社团会议请求
			id = Integer.valueOf(request.getParameter("gmid"));
			groupMeetingDao.delete(id);
			request.getRequestDispatcher("GroupMeeting?type=1").forward(request, response);
		case "5"://处理添加社团会议请求
			request.getRequestDispatcher("group/group/gm_add.jsp").forward(request, response);
			break;
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
