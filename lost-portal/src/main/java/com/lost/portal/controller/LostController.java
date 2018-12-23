package com.lost.portal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lost.common.pojo.PageResult;
import com.lost.portal.service.LostService;

@RestController
@RequestMapping("/lost")
public class LostController {

	@Autowired
	private LostService lostService;
	
	@RequestMapping("/search")
	public PageResult getByTimeLost(int page,int size){
		PageResult result = lostService.getLostByTime(page, size);
		return result;
	}
	
}
