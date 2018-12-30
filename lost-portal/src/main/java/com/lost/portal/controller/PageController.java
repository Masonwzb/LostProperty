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
	
	//映射招领物页面
	@RequestMapping("/found")
	public String showFound(){
		return "found";
	}
	
	//映射招领物页面
	@RequestMapping("/file")
	public String showFond(){
		return "fileUpload";
	}
	
	//映射发布寻物页面
	@RequestMapping("/addLost")
	public String showAddLost(){
		return "addLost";
	}
		
}
