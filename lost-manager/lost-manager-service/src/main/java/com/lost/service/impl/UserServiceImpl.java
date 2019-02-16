package com.lost.service.impl;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lost.common.pojo.LostResult;
import com.lost.common.utils.CookieUtils;
import com.lost.mapper.TbUsersMapper;
import com.lost.pojo.TbUsers;
import com.lost.pojo.TbUsersExample;
import com.lost.pojo.TbUsersExample.Criteria;
import com.lost.service.UserService;
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private TbUsersMapper userMapper;
	
	//管理员登录
	@Override
	public LostResult userLogin(String username, String password, HttpServletRequest request,
			HttpServletResponse response) {
		
		//校验
		if(username.equals("admin")){
			
			TbUsersExample example = new TbUsersExample();
			Criteria createCriteria = example.createCriteria();
			createCriteria.andUsernameEqualTo("admin");
			List<TbUsers> list = userMapper.selectByExample(example);
			
			//获取管理员
			TbUsers admin = list.get(0);
			
			if(admin.getPassword().equals(password)){
				//生成唯一标识符token
				String token = UUID.randomUUID().toString();
				//添加写cookie的逻辑,cookie的有效期关闭浏览器就失效
				CookieUtils.setCookie(request, response, "LF_TOKEN", token);
				
				return LostResult.ok(token);	
			}
			
		}
		
		return LostResult.build(400, "用户名或密码错误!");
	}

	@Override
	public LostResult changePwd(String oldPwd, String newPwd) {
		
		//获取管理员
		TbUsersExample example = new TbUsersExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andUsernameEqualTo("admin");
		List<TbUsers> list = userMapper.selectByExample(example);
		TbUsers admin = list.get(0);
		
		if(!admin.getPassword().equals(oldPwd)){
			return LostResult.build(400, "原密码输入错误!");
		}
		
		//否则更新密码
		admin.setPassword(newPwd);
		admin.setUpdated(new Date());
		userMapper.updateByPrimaryKeySelective(admin);
		return LostResult.ok();
	}

}
