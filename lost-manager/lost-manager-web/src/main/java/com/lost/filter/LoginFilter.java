package com.lost.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import com.lost.common.utils.CookieUtils;

public class LoginFilter extends OncePerRequestFilter {

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		//判断用户是否登录
	    //从cookie中取token
		String token = CookieUtils.getCookieValue(request, "LF_TOKEN");
		
		System.out.println("token:过滤操作===========================" + token );
		
		//判断token值是否为空
		if(StringUtils.isEmpty(token)){
			response.sendRedirect("http://localhost:8080/login.html");
		}else{
			//取到用户信息，放行
			filterChain.doFilter(request, response);
		}
		
	}

}
