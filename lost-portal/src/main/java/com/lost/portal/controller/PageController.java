package com.lost.portal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

	//映射首页
	@RequestMapping("/index")
	public String showIndex(){
		return "index";
	}
	
	//映射寻物页面
	@RequestMapping("/lost")
	public String showLost(){
		return "lost";
	}
		
}
