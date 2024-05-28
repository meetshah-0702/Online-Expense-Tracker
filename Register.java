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

@WebServlet("/userRegister")
public class Register extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String user_name = req.getParameter("user_name");
		String user_email = req.getParameter("user_email");
		String user_contact = req.getParameter("user_contact");
		String user_password = req.getParameter("user_password");
		String user_confirm_password = req.getParameter("user_confirm_password");
		System.out.println(user_name + user_email + user_contact + user_password + user_confirm_password);
		if(user_name == null && user_email == null && user_contact == null && user_password == null && user_confirm_password== null ) {
			
		}
		if(!user_password.equals(user_confirm_password)) {
				
		}
		User new_user = new User(user_name,user_email,user_contact,user_password);
		// System.out.println(new_user);
		
		UserDao dao = new UserDao(HibernetUtil.getSessionFactory());
		boolean flag = dao.save_user(new_user);
		
		HttpSession session = req.getSession();
		if(flag) {
			session.setAttribute("Regmsg", "user has successfully registered");
			System.out.println("user has successfully registered");
			resp.sendRedirect("register.jsp");
		}
		else {
			session.setAttribute("errmsg", "something went Wrong");
			System.out.println("something went Wrong");
		}
	}
	
}
