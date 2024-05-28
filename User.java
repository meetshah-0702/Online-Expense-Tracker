package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user_details")
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int user_id;
	
	@Column(name="user_name")
	private String user_name;
	@Column(name="user_email")
	private String user_email;
	@Column(name="user_contact")
	private String user_contact;
	@Column(name="user_password")
	private String password;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String user_name, String user_email, String user_contact, String password) {
		super();
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_contact = user_contact;
		this.password = password;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_contact() {
		return user_contact;
	}
	public void setUser_contact(String user_contact) {
		this.user_contact = user_contact;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_name=" + user_name + ", user_email=" + user_email
				+ ", user_contact=" + user_contact + ", password=" + password + "]";
	}
	
	
}
