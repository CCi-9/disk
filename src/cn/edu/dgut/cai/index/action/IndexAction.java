package cn.edu.dgut.cai.index.action;

import com.opensymphony.xwork2.ActionSupport;

public class IndexAction extends ActionSupport{
	public String login() {
		return "login";
	}
	public String menu(){
		return "menu";
	}
	
	public String left() {
		return "left";
	}
	
	public String right() {
		return "right";
	}
	
	public String upload() {
		return "upload";
	}
}	
