package com.servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

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

@WebServlet("/report")
public class ReportServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String start_date = req.getParameter("start");
		String end_date = req.getParameter("end");
		System.out.println(start_date + end_date);
		
		HttpSession session = req.getSession();
		
		User user = (User) session.getAttribute("user_details");
		
		ExpenseDao dao = new ExpenseDao(HibernetUtil.getSessionFactory());
		
		List<Expense> list = dao.getReport(user, start_date, end_date);
		List<BigDecimal> credit = dao.getRreportCredit(user, start_date, end_date);
		List<BigDecimal> debit = dao.getReportDebit(user, start_date, end_date);
		
		System.out.println(list.size());
		System.out.println(credit.size());
		System.out.println(debit.get(0));
		
		if(list != null) {
			session.setAttribute("report", list);
			session.setAttribute("credit", credit);
			session.setAttribute("debit", debit);
			resp.sendRedirect("reports.jsp");
		}
		else {
			resp.sendRedirect("reports.jsp");
		}
	
	}

}
