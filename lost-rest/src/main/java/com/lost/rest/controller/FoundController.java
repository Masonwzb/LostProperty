package com.lost.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.lost.common.pojo.LostResult;
import com.lost.common.pojo.PageResult;
import com.lost.customPojo.DetFound;
import com.lost.customPojo.DetLost;
import com.lost.pojo.TbLost;
import com.lost.rest.service.FoundService;
import com.lost.rest.service.LostService;

@RestController
@RequestMapping("/found")
public class FoundController {

	@Autowired
	private FoundService foundService;
	
	/*
	 * 根据时间查询招领物
	 */
	@RequestMapping("/time")
	public LostResult getFoundByTime(int page,int size){
		return foundService.getFoundByTime(page,size);
	}
	
	/*
	 * 根据条件查询招领物
	 */
	@RequestMapping("/search")
	public LostResult getFoundByCondition(@RequestBody DetFound detFound, int page, int size){
		return foundService.getFoundByCondition(detFound, page, size);
	}
	
	
}
