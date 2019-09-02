package cn.edu.dgut.cai.User.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.edu.dgut.cai.User.service.UserService;
import cn.edu.dgut.cai.User.vo.User;

public class UserAction extends ActionSupport implements ModelDriven<User>{
	private User user = new User();
	private UserService userService;


	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}

	public String findByUsername() throws IOException {
		String userName = user.getUserName();
		User exitUser = userService.findByUsername(userName);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		if(exitUser != null) {
			response.getWriter().println("用户名已经存在");
		}else {
			response.getWriter().println("用户名可用");
		}
		return NONE;
	}
	
	public String registUser() {
		userService.saveUser(user);
		this.addActionMessage("注册成功!请去邮箱激活!");
		return "msg";
	}
	
	public String active() throws IOException {
		User existUser = userService.findByCode(user.getCode());
		if(existUser == null) {
			this.addActionMessage("激活错误！请重新激活");

		}else {
			existUser.setState(1);
			existUser.setCode(null);
			userService.update(existUser);
			this.addActionMessage("激活成功");
		}
		
		return "msg";
	}

	public String login() {
		System.out.println("user.getUserName()="+user.getUserName());
		User existUser = userService.findByUsername(user.getUserName());
		if(existUser == null) {
			this.addActionMessage("用户名不存在");
			return "msg";
		}
		if(!existUser.getPassword().equals(user.getPassword())) {
			this.addActionMessage("用户名或密码错误");
			return "msg";
		}
		if(existUser.getState() == 0) {
			this.addActionMessage("用户名尚未激活");
			return "msg";
		}
		ServletActionContext.getRequest().getSession().setAttribute("existUser", existUser);
		
		return "loginSuccess";
	}
}
