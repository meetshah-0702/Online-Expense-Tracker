package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ExpenseDao;
import com.db.HibernetUtil;

@WebServlet("/deleteExpense")
public class DeleteExpenseServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		
		ExpenseDao dao = new ExpenseDao(HibernetUtil.getSessionFactory());
		boolean flag = dao.deleteExpense(id);
		HttpSession session = req.getSession();
		if(flag) {
			session.setAttribute("deleteSuccessMsg", "Expense Deleted Successfully");
			resp.sendRedirect("expense_list.jsp");
		}
		else {
			session.setAttribute("deleteErrorMsg", "Something Went Wrong");
			resp.sendRedirect("expense_list.jsp");
		}
		
	}

	
}
