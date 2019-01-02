package com.lost.portal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.lost.common.pojo.LostResult;
import com.lost.common.pojo.PageResult;
import com.lost.customPojo.DetFound;
import com.lost.customPojo.DetLost;
import com.lost.pojo.TbFound;
import com.lost.pojo.TbLost;
import com.lost.portal.service.FoundService;

@Controller
@RequestMapping("/found")
public class FoundController {

	@Autowired
	private FoundService foundService;
	
	@RequestMapping("/newest")
	@ResponseBody
	public PageResult getByTimeFound(int page,int size){
		PageResult result = foundService.getFoundByTime(page, size);
		return result;
	}
	
	/*
	 * 根据条件查询数据
	 */
	@RequestMapping("/search")
	@ResponseBody
	public PageResult getByConditionFound(@RequestBody DetFound detFound,int page,int size){
		PageResult result = foundService.getFoundByCondition(detFound, page, size);
		return result;
	}
	
	/*
	 * 添加招领信息
	 */
	@RequestMapping("/add")
	@ResponseBody
	public LostResult addFound(@RequestBody TbFound tbFound){
		return foundService.addFoundInfo(tbFound);
	}
	
	/*
	 * 根据Id获取失物信息
	 */
	@RequestMapping("/findOne/{foundId}")
	public String findFoundById(@PathVariable Long foundId,Model model){
		DetFound found = foundService.getFoundById(foundId);
		model.addAttribute("found",found);
		return "foundDetail";
	}
	
}
