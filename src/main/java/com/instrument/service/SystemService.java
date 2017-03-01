package com.instrument.service;

import com.instrument.domain.User;


public interface SystemService {
	/*验证用户登录*/
	User checkLogin(String username, String password);
	
	/*修改用户登录密码*/
	public void changePassword(String username, String newpass); 
	
	/*确认是否存在想同账号*/
	Boolean checkUsername(String username);

	/*注册*/
	public void register(String username, String password);
	
	/*确认老密码是否正确*/
	Boolean checkPassword(String username,String password);
}
