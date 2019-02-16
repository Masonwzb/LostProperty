package com.lost.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.lost.common.utils.CookieUtils;

public class LoginInterceptor implements HandlerInterceptor {

	/*
	 * 在Handler执行之前处理
	 * 返回值决定handler是否执行，true:执行，false:不执行
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	    //判断用户是否登录
	    //从cookie中取token
		String token = CookieUtils.getCookieValue(request, "LF_TOKEN");
		
		System.out.println("token:===========================" + token );
		
		//判断token值是否为空
		if(StringUtils.isEmpty(token)){
			response.sendRedirect("http://localhost:8080/login.html");
			return false;
		}
		
		//取到用户信息，放行
		return true;
	}
	
	
	/*
	 * handler执行之后，返回ModelAndView之前 
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
	
	
	/*
	 *  返回ModelAndView之后
	 *  响应用户之后
	 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	
	}
}
