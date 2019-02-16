package com.lost.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lost.common.pojo.LostResult;

public interface UserService {
	//管理员登录
	public LostResult userLogin(String username, String password,
			HttpServletRequest request, HttpServletResponse response);

	//密码修改
	public LostResult changePwd(String oldPwd,String newPwd);

}
