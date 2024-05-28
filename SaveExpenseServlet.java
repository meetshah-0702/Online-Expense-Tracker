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
import com.entity.Expense;
import com.entity.User;

@WebServlet("/addExpense")
public class SaveExpenseServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String item_name = req.getParameter("item_name");
		String date = req.getParameter("date");
		String expense_type = req.getParameter("expense_type");
		int price = Integer.parseInt(req.getParameter("price"));
		
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user_details");
		if(item_name == null && date == null && expense_type == null && price == 0) {
			
		}
		
		Expense new_expense = new Expense(item_name, date, expense_type, price, user);
		
		ExpenseDao dao = new ExpenseDao(HibernetUtil.getSessionFactory());
		boolean flag = dao.save_expense(new_expense);
		if(flag) {
			session.setAttribute("Expmsg","Expense Added Succefully...!");
			resp.sendRedirect("expense.jsp");
		}
		else {
			session.setAttribute("error","something went wronge...!");
			resp.sendRedirect("expense.jsp");
		}
	}

		
}
