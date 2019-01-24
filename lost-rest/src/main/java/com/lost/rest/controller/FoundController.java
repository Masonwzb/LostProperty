package com.lost.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.lost.common.pojo.LostResult;
import com.lost.common.pojo.PageResult;
import com.lost.customPojo.DetFound;
import com.lost.customPojo.DetLost;
import com.lost.pojo.TbFound;
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
	
	/*
	 * 添加招领信息
	 */
	@RequestMapping("/add")
	public LostResult addFoundInfo(@RequestBody TbFound tbFound) throws Exception{
		return foundService.addFound(tbFound);
	}
	
	/*
	 * 根据ID查询招领信息
	 */
	@RequestMapping("/findOne/{foundId}")
	public LostResult findDetFoundById(@PathVariable Long foundId){
		return foundService.getDetFoundById(foundId);
	}
	
	/*
	 * 验证管理密码是否正确
	 */
	@RequestMapping("/pwd/validate")
	public LostResult getValidatePassword(@RequestBody TbFound tbFound){
		return foundService.getPwdValidate(tbFound);
	}
	
	/*
	 * 更新失物信息
	 */
	@RequestMapping("/update")
	public LostResult updateFoundById(@RequestBody TbFound tbFound){
		return foundService.updateFound(tbFound);
	}
	
	/*
	 * 根据ID查询失物
	 */
	@RequestMapping("/findOne/update/{foundId}")
	public LostResult selectFoundById(@PathVariable Long foundId){
		return foundService.getFoundById(foundId);
	}
	
	
}
