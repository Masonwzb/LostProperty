package com.lost.rest.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.lost.common.pojo.LostResult;
import com.lost.common.pojo.PageResult;
import com.lost.customPojo.DetLost;
import com.lost.pojo.TbLost;
import com.lost.rest.service.LostService;

@RestController
@RequestMapping("/lost")
public class LostController {

	@Autowired
	private LostService lostService;
	
	/*
	 * 根据时间查询失物
	 */
	@RequestMapping("/time")
	public LostResult getLostByTime(int page,int size){
		return lostService.getLostByTime(page,size);
	}
	
	/*
	 * 根据条件查询失物
	 */
	@RequestMapping("/search")
	public LostResult getLostByCondition(@RequestBody DetLost detLost, int page, int size){
		return lostService.getLostByCondition(detLost, page, size);
	}
	
	/*
	 * 添加失物信息
	 */
	@RequestMapping("/add")
	public LostResult addLostInfo(@RequestBody TbLost tbLost){
		return lostService.addLost(tbLost);
	}
	
	/*
	 * 根据ID查询失物信息
	 */
	@RequestMapping("/findOne/{lostId}")
	public LostResult findLostById(@PathVariable Long lostId){
		return lostService.getLostById(lostId);
	}
	
}
