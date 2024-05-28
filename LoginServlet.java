package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.HibernetUtil;
import com.entity.User;

@WebServlet("/login")
public class LoginServlet  extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String user_email = req.getParameter("user_email");
		String user_password = req.getParameter("user_password");
		System.out.println(user_email + user_password);
		User user = null;
		UserDao dao = new UserDao(HibernetUtil.getSessionFactory());
		
		user = dao.login(user_email, user_password);
		System.out.println(user);
		HttpSession session = req.getSession();
		if(user != null) {
			session.setAttribute("user_details", user);
			session.setAttribute("msg", "user Logind Successfully");
			resp.sendRedirect("index.jsp");
		}
		else {
			session.setAttribute("error", "Invalid e-mail and password");
			resp.sendRedirect("login.jsp");
		}
	}

	
}
