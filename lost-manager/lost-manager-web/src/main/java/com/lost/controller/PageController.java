package com.lost.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

	//打开首页
	@RequestMapping("/")
	public String showIndex(){
		return "index";
	}
	
	@RequestMapping("category")
	public String showCategory(){
		return "category";
	}
}
