package com.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entity.User;


public class UserDao {
	private SessionFactory factory = null;
	private Session session = null;
	private Transaction tx=null;
	public UserDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	
	public boolean save_user(User user) {
		boolean f=false;
		
		try {
			session = factory.openSession();
			tx = session.beginTransaction();
			
			session.save(user);
			tx.commit();
			f=true;
		}
		catch(Exception e) {
			if(tx != null) {
				f = false;
				e.printStackTrace();
			}
		}
		return f;
	}
	
	public User login(String user_email,String user_password) {
			User user = null;
			
			try {
				session = factory.openSession();
				org.hibernate.Query q  =session.createQuery("from User where user_email=:em and user_password=:pass");
				q.setParameter("em", user_email);
				q.setParameter("pass",user_password);
				
				user = (User)q.uniqueResult();
				System.out.println(user);
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return user;
	}
}
