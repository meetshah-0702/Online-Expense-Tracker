package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="expense")
public class Expense {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@Column(name="item_name")
	private String item_name;
	@Column(name="date")
	private String date;
	@Column(name="expense_type")
	private String expense_type;
	@Column(name="price")
	private int price;
	
	@ManyToOne
	private User user;

	public Expense(String item_name, String date, String expense_type, int price, User user) {
		super();
		this.item_name = item_name;
		this.date = date;
		this.expense_type = expense_type;
		this.price = price;
		this.user = user;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getExpense_type() {
		return expense_type;
	}

	public void setExpense_type(String expense_type) {
		this.expense_type = expense_type;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public User getUser() {
		return user;
	}

	public Expense() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
}
