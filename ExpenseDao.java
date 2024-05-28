package com.dao;

import java.math.BigDecimal;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.NativeQuery;

import com.entity.Expense;
import com.entity.User;

import antlr.collections.List;
import java.math.BigDecimal;
public class ExpenseDao {
	private SessionFactory factory = null;
	private Session session = null;
	private Transaction tx=null;
	
	public ExpenseDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public boolean save_expense(Expense ex) {
		boolean flag = false;
		
		try {
			session = factory.openSession();
			tx= session.beginTransaction();
			session.save(ex);
			tx.commit();
			flag = true;
		}
		
		catch(Exception e) {
			if(tx != null) {
				flag = false;
				e.printStackTrace();
			}
			
		}
		return flag;
	}
	
	public java.util.List<Expense> getAllExpenseByUser(User user){
		
		System.out.println("userid" + user.getUser_id());
		java.util.List<Expense> list = new ArrayList<Expense>();
		
		try {
			session = factory.openSession();
			Query q = session.createQuery("from Expense where user=:usr");
			q.setParameter("usr", user);
			list = q.list();
			System.out.println(list.size());
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean deleteExpense(int id) {
		boolean flag = false;

		try {
			session = factory.openSession();
			tx = session.beginTransaction();
			
			Expense ex = session.get(Expense.class,id);
			
			session.delete(ex);
			tx.commit();
			flag = true;
		}
		catch(Exception e) {
			
		}
		return flag;
	}
	
	public java.util.List<BigDecimal>  getCurrentDayExpense(User user) {
		
		java.util.List<BigDecimal> result = new ArrayList<BigDecimal>();
		System.out.print("user-id" + user.getUser_id());
		try {
			String sql = " SELECT SUM(price) AS total_price FROM expense WHERE STR_TO_DATE(date, '%m/%d/%Y') = CURDATE() and user_user_id=:usr and expense_type=:str";
			session = factory.openSession();
			tx = session.beginTransaction();
			
			NativeQuery query = session.createNativeQuery(sql);
			query.setParameter("usr", user);
			query.setParameter("str", "debit");
			result= query.list();
			
			tx.commit();
			System.out.println("size" + result.size());
			System.out.println(result.get(0));
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public java.util.List<BigDecimal> getYesterdayExpense(User user){
		java.util.List<BigDecimal> result = new ArrayList<BigDecimal>();
		
		try {
			String sql = "  SELECT SUM(price) AS total_price FROM expense WHERE STR_TO_DATE(date, '%m/%d/%Y') = DATE_SUB(CURDATE(), INTERVAL 1 DAY) and user_user_id=:usr and expense_type=:str";
			session = factory.openSession();
			tx = session.beginTransaction();
			NativeQuery query = session.createNativeQuery(sql);
			query.setParameter("usr", user);
			query.setParameter("str", "debit");
			result= query.list();
			tx.commit();
			System.out.println("size" + result.size());
			System.out.println(result.get(0));
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public java.util.List<BigDecimal> getLast7dayExpense(User user){
		java.util.List<BigDecimal> result = new ArrayList<BigDecimal>();
		
		try {
			String sql = "SELECT SUM(price) AS total_price FROM expense WHERE STR_TO_DATE(date, '%m/%d/%Y') >= DATE_SUB(CURDATE(), INTERVAL 7 DAY) AND STR_TO_DATE(date, '%m/%d/%Y') <= CURDATE() and user_user_id=:usr and expense_type=:str";
			session = factory.openSession();
			tx = session.beginTransaction();
			NativeQuery query = session.createNativeQuery(sql);
			query.setParameter("usr", user);
			query.setParameter("str", "debit");
			result= query.list();
			tx.commit();
			System.out.println("size" + result.size());
			System.out.println(result.get(0));
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public java.util.List<BigDecimal> getCurrentYearExpense(User user){
		java.util.List<BigDecimal> result = new ArrayList<BigDecimal>();
		
		try {
			String sql = "SELECT SUM(price) AS total_price FROM expense WHERE YEAR(STR_TO_DATE(date, '%m/%d/%Y')) = YEAR(CURDATE()) and user_user_id=:usr and expense_type=:str";
			session = factory.openSession();
			tx = session.beginTransaction();
			NativeQuery query = session.createNativeQuery(sql);
			query.setParameter("usr", user);
			query.setParameter("str", "debit");
			result= query.list();
			tx.commit();
			System.out.println("size" + result.size());
			System.out.println(result.get(0));
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public java.util.List<BigDecimal> getTotalExpense(User user){
		java.util.List<BigDecimal> result = new ArrayList<BigDecimal>();
		
		try {
			String sql = "SELECT SUM(price) AS total_price FROM expense WHERE user_user_id=:usr and expense_type=:str";
			session = factory.openSession();
			tx = session.beginTransaction();
			NativeQuery query = session.createNativeQuery(sql);
			query.setParameter("usr", user);
			query.setParameter("str", "debit");
			result= query.list();
			tx.commit();
			System.out.println("size" + result.size());
			System.out.println(result.get(0));
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public java.util.List<BigDecimal> getMonthExpense(User user){
		java.util.List<BigDecimal> result = new ArrayList<BigDecimal>();
		
		try {
			String sql = "SELECT SUM(price) AS total_price FROM expense WHERE STR_TO_DATE(date, '%m/%d/%Y') >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AND STR_TO_DATE(date, '%m/%d/%Y') < CURDATE() and user_user_id=:usr and expense_type=:str";
			session = factory.openSession();
			tx = session.beginTransaction();
			NativeQuery query = session.createNativeQuery(sql);
			query.setParameter("usr", user);
			query.setParameter("str", "debit");
			result= query.list();
			tx.commit();
			System.out.println("size" + result.size());
			System.out.println(result.get(0));
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public java.util.List<Expense> getReport(User user, String start_date, String end_date) {
	    java.util.List<Expense> list = new ArrayList<Expense>();
	    String hql = "FROM Expense WHERE date >= :start_date AND date <= :end_date and user=:usr";

	    try {
	        session = factory.openSession();
	        Query<Expense> query = session.createQuery(hql, Expense.class);
	        query.setParameter("start_date", start_date);
	        query.setParameter("end_date", end_date);
	        query.setParameter("usr", user);
	        list = query.list();
	        System.out.println(list.size());
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        if (session != null) {
	            session.close();
	        }
	    }

	    return list;
	}


	
	public java.util.List<BigDecimal> getRreportCredit(User user, String start_date, String end_date){
	    java.util.List<BigDecimal> result = new ArrayList<BigDecimal>();
	    
	    try {
	    	String sql = "SELECT SUM(price) AS total_price FROM expense WHERE STR_TO_DATE(date, '%m/%d/%Y') >= STR_TO_DATE(:start_date, '%m/%d/%Y') AND STR_TO_DATE(date, '%m/%d/%Y') <= STR_TO_DATE(:end_date, '%m/%d/%Y') AND user_user_id = :usr AND expense_type = :str";
	        session = factory.openSession();
	        tx = session.beginTransaction();
	        NativeQuery query = session.createNativeQuery(sql);
	        query.setParameter("start_date", start_date);
	        query.setParameter("end_date", end_date);
	        query.setParameter("usr", user.getUser_id()); // Assuming getUserId() returns the user ID
	        query.setParameter("str", "Credit"); // Assuming 'Credit' is the correct expense type
	        result = query.list();
	        tx.commit();
	        System.out.println("size: " + result.size());
	        System.out.println("sum" + result.get(0));
	    } catch(Exception e) {
	        if (tx != null) {
	            tx.rollback();
	        }
	        e.printStackTrace();
	    } finally {
	        if (session != null) {
	            session.close();
	        }
	    }
	    return result;
	}


	public java.util.List<BigDecimal> getReportDebit(User user,String start_date,String end_date){
java.util.List<BigDecimal> result = new ArrayList<BigDecimal>();
	    
	    try {
	    	String sql = "SELECT SUM(price) AS total_price FROM expense WHERE STR_TO_DATE(date, '%m/%d/%Y') >= STR_TO_DATE(:start_date, '%m/%d/%Y') AND STR_TO_DATE(date, '%m/%d/%Y') <= STR_TO_DATE(:end_date, '%m/%d/%Y') AND user_user_id = :usr AND expense_type = :str";
	        session = factory.openSession();
	        tx = session.beginTransaction();
	        NativeQuery query = session.createNativeQuery(sql);
	        query.setParameter("start_date", start_date);
	        query.setParameter("end_date", end_date);
	        query.setParameter("usr", user.getUser_id()); // Assuming getUserId() returns the user ID
	        query.setParameter("str", "Debit"); // Assuming 'Credit' is the correct expense type
	        result = query.list();
	        tx.commit();
	        System.out.println("size: " + result.size());
	        System.out.println("sum" + result.get(0));
	    } catch(Exception e) {
	        if (tx != null) {
	            tx.rollback();
	        }
	        e.printStackTrace();
	    } finally {
	        if (session != null) {
	            session.close();
	        }
	    }
	    return result;
	}
	private Date parseDate(String dateString) {
	    try {
	        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
	        return dateFormat.parse(dateString);
	    } catch (ParseException e) {
	        // Handle parsing exception
	        return null;
	    }
	}
	
	
	public java.util.List<Expense> getChartData(User user){
		java.util.List<Expense> result = new ArrayList<Expense>();
		
		try {
			String sql = "SELECT MONTH(STR_TO_DATE(date, '%m/%d/%Y')) AS month, SUM(price) AS total_price " +
		             "FROM expense " +
		             "WHERE user_user_id = :usr AND expense_type = :str " +
		             "GROUP BY MONTH(STR_TO_DATE(date, '%m/%d/%Y'))";

			session = factory.openSession();
			tx = session.beginTransaction();
			Query query = session.createNativeQuery(sql);
			query.setParameter("usr", user.getUser_id());
			query.setParameter("str", "credit");
	        result = query.list();
	        System.out.println("size = " + result.size());
	        return result;
		}
		catch(Exception e) {	
			e.printStackTrace();
		}
		
		return result;
	}
	public java.util.List<Expense> getChartDataDebit(User user){
		java.util.List<Expense> result = new ArrayList<Expense>();
		
		try {
			String sql = "SELECT MONTH(STR_TO_DATE(date, '%m/%d/%Y')) AS month, SUM(price) AS total_price " +
		             "FROM expense " +
		             "WHERE user_user_id = :usr AND expense_type = :str " +
		             "GROUP BY MONTH(STR_TO_DATE(date, '%m/%d/%Y'))";

			session = factory.openSession();
			tx = session.beginTransaction();
			Query query = session.createNativeQuery(sql);
			query.setParameter("usr", user.getUser_id());
			query.setParameter("str", "debit");
	        result = query.list();
	        System.out.println("size = " + result.size());
	        return result;
		}
		catch(Exception e) {	
			e.printStackTrace();
		}
		
		return result;
	}
}