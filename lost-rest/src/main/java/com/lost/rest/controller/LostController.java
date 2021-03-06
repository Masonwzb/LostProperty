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
	public LostResult addLostInfo(@RequestBody TbLost tbLost) throws Exception{
		return lostService.addLost(tbLost);
	}
	
	/*
	 * 根据ID查询明细失物信息
	 */
	@RequestMapping("/findOne/{lostId}")
	public LostResult findDetLostById(@PathVariable Long lostId){
		return lostService.getDetLostById(lostId);
	}
	
	/*
	 * 验证管理密码是否正确
	 */
	@RequestMapping("/pwd/validate")
	public LostResult getValidatePassword(@RequestBody TbLost tbLost){
		return lostService.getPwdValidate(tbLost);
	}
	
	/*
	 * 更新失物信息
	 */
	@RequestMapping("/update")
	public LostResult updateLostById(@RequestBody TbLost tbLost){
		return lostService.updateLost(tbLost);
	}
	
	/*
	 * 根据ID查询失物
	 */
	@RequestMapping("/findOne/update/{lostId}")
	public LostResult selectLostById(@PathVariable Long lostId){
		return lostService.getLostById(lostId);
	}
	
	/*
	 * 删除失物信息并级联删除启事信息和评论信息
	 */
	@RequestMapping("/delete/{lostId}")
	public LostResult removeLost(@PathVariable Long lostId){
		return lostService.deleteLost(lostId);
	}
	
	/*
	 * 获取失物管理密码发送邮件给用户
	 */
	@RequestMapping("/sendEmail/{lostId}")
	public LostResult sendEmailToUser(@PathVariable Long lostId){
		return lostService.sendEmail(lostId);
	}
	
	/*
	 * 获取所有失物信息
	 */
	@RequestMapping("/findAll")
	public LostResult findAllLost(){
		return lostService.getAllLost();
	}
	
}
