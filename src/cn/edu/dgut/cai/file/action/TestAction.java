package cn.edu.dgut.cai.file.action;

import com.opensymphony.xwork2.ActionSupport;

public class TestAction extends ActionSupport{
	private String username;
	private String password;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String justTest() {
		System.out.println(username+":"+password);
		return null;
	}
}
