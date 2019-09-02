package cn.edu.dgut.cai.User.service;

import java.io.IOException;
import java.util.UUID;

import org.springframework.transaction.annotation.Transactional;

import cn.edu.dgut.cai.User.dao.UserDao;
import cn.edu.dgut.cai.User.vo.User;
import cn.edu.dgut.cai.utils.FileUtil;
import cn.edu.dgut.cai.utils.MailUtils;

@Transactional
public class UserService {
	private UserDao userDao;

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public User findByUsername(String userName) {
		
		return userDao.findByUsername(userName);
	}

	public void saveUser(User user) {
		// TODO Auto-generated method stub
		user.setState(0);
		String code = UUID.randomUUID().toString();
		user.setCode(code);
		userDao.saveUser(user);
		MailUtils.sendMail(user.getEmail(), code);
	}

	public User findByCode(String code) {
		
		return userDao.findByCode(code);
	}

	public void update(User existUser) throws IOException {
		userDao.update(existUser) ;
		FileUtil.createUserDisk(existUser);
	} 
}
