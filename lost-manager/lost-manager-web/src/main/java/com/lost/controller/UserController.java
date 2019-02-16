package com.lost.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.lost.common.pojo.LostResult;
import com.lost.common.utils.ExceptionUtil;
import com.lost.service.UserService;

@RestController
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	//管理员登录
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public LostResult adminLogin(String username, String password, HttpServletRequest request,
			HttpServletResponse response){
		try {
			LostResult result = userService.userLogin(username, password, request, response);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return LostResult.build(500, ExceptionUtil.getStackTrace(e));
		}
	}
	
	//修改密码
	@RequestMapping(value="/changePwd",method=RequestMethod.POST)
	public LostResult updatePwd(String oldPwd,String newPwd){
		try {
			LostResult result = userService.changePwd(oldPwd, newPwd);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return LostResult.build(500, ExceptionUtil.getStackTrace(e));
		}
	}
	
}
