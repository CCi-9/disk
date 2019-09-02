package cn.edu.dgut.cai.User.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.edu.dgut.cai.User.vo.User;

public class UserDao extends HibernateDaoSupport{

	public User findByUsername(String userName) {
		String hql = "from User where userName = ?";
		List<User> list = this.getHibernateTemplate().find(hql, userName);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public void saveUser(User user) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(user);
	}

	public User findByCode(String code) {
		String hql = "from User where code = ?";
		List<User> list = this.getHibernateTemplate().find(hql, code);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public void update(User existUser) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(existUser);
	}

}
