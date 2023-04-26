package com.flyaway.Dao;

public class user {
	
	private String name;
	private String pass;
	private int user_id ;
	private String email;
	public user() {
		super();
		// TODO Auto-generated constructor stub
	}
	public user(String name, String pass, int user_id, String email) {
		super();
		this.name = name;
		this.pass = pass;
		this.user_id = user_id;
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "user [name=" + name + ", pass=" + pass + ", user_id=" + user_id + ", email=" + email + "]";
	}
	
	
	
}
