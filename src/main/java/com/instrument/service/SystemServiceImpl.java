package com.instrument.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.instrument.dao.UserDAO;
import com.instrument.domain.User;
@Service("systemService")
public class SystemServiceImpl implements SystemService {

	@Resource(name = "userDAO")
	private UserDAO userdao;

	@Override
	@Transactional
	public User checkLogin(String username, String password) {
		
		Thread t = Thread.currentThread();

		//检查入口参数!!!
		//String s = null;
		//s.charAt(0);
		User user=userdao.selectByPrimaryKey(username);
		if(user==null){
			throw new NameOrPasswordException(1, "木有人");
		}
		
		if(! username.equals(user.getUsername())){
			throw new NameOrPasswordException(1,"名字错误");
		}
		
		if(password.equals(user.getPassword())){
			//登录成功!!
			return user;
		}
		throw new NameOrPasswordException(2, "错误密码");
	}

	@Override
	public void changePassword(String username, String newpass) {
		
		userdao.updateByPrimaryKeySelective(username, newpass);
		
	}

	@Override
	public Boolean checkUsername(String username) {

		List<User> lists = userdao.getAll();
		for(User list : lists){

			if(username.equals(list.getUsername())){
				return false;
			}
		}
		
		return true;
	}

	@Override
	public void register(String username, String password) {	
		userdao.insert(username, password);
		
	}

	@Override
	public Boolean checkPassword(String username, String password) {
		User checkpassword = userdao.selectByPrimaryKey(username);
		if(password.equals(checkpassword.getPassword())){
			return true;
		}
		return false;
	}

}
