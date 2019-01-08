package com.lost.portal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

	//映射表单修正页面
	@RequestMapping("/changeForm")
	public String showChange(){
		return "changeForm";
	}
	
	//映射图片上传测试页面
	@RequestMapping("/file")
	public String showFond(){
		return "fileUpload";
	}
	
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
	
	//映射发布寻物页面
	@RequestMapping("/addLost")
	public String showAddLost(){
		return "addLost";
	}
	
	//映射发布招领物页面
	@RequestMapping("/addFound")
	public String showAddFound(){
		return "addFound";
	}
	
	//映射查询结果页面
	@RequestMapping("/searchResult")
	public String showSearchResult(){
		return "searchResult";
	}
		
}
