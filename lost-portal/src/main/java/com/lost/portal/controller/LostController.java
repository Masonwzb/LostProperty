package com.lost.portal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lost.common.pojo.PageResult;
import com.lost.customPojo.DetLost;
import com.lost.portal.service.LostService;

@RestController
@RequestMapping("/lost")
public class LostController {

	@Autowired
	private LostService lostService;
	
	/*
	 * 根据时间查询数据
	 */
	@RequestMapping("/newest")
	public PageResult getByTimeLost(int page,int size){
		PageResult result = lostService.getLostByTime(page, size);
		return result;
	}
	
	/*
	 * 根据条件查询数据
	 */
	@RequestMapping("/search")
	public PageResult getByConditionLost(@RequestBody DetLost detLost,int page,int size){
		PageResult result = lostService.getLostByCondition(detLost, page, size);
		return result;
	}
	
}
