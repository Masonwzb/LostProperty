package com.lost.portal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lost.common.pojo.PageResult;
import com.lost.portal.service.FoundService;

@RestController
@RequestMapping("/found")
public class FoundController {

	@Autowired
	private FoundService foundService;
	
	@RequestMapping("/newest")
	public PageResult getByTimeFound(int page,int size){
		PageResult result = foundService.getFoundByTime(page, size);
		return result;
	}
	
}
