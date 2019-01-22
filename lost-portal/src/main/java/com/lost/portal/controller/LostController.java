package com.lost.portal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lost.common.pojo.LostResult;
import com.lost.common.pojo.PageResult;
import com.lost.customPojo.DetLost;
import com.lost.pojo.TbLost;
import com.lost.pojo.TbTextinfo;
import com.lost.pojo.TbTextinfoExample;
import com.lost.pojo.TbTextinfoExample.Criteria;
import com.lost.portal.service.LostService;
import com.lost.portal.service.TextService;

@Controller
@RequestMapping("/lost")
public class LostController {

	@Autowired
	private LostService lostService;
	@Autowired
	private TextService textService;
	
	/*
	 * 根据时间查询数据
	 */
	@RequestMapping("/newest")
	@ResponseBody
	public PageResult getByTimeLost(int page,int size){
		PageResult result = lostService.getLostByTime(page, size);
		return result;
	}
	
	/*
	 * 根据条件查询数据
	 */
	@RequestMapping("/search")
	@ResponseBody
	public PageResult getByConditionLost(@RequestBody DetLost detLost,int page,int size){
		PageResult result = lostService.getLostByCondition(detLost, page, size);
		return result;
	}
	
	/*
	 * 添加失物信息
	 */
	@RequestMapping("/add")
	@ResponseBody
	public LostResult addLost(@RequestBody TbLost tbLost){
		return lostService.addLostInfo(tbLost);
	}
	
	/*
	 * 根据Id获取失物信息
	 */
	@RequestMapping("/findOne/{lostId}")
	public String findLostById(@PathVariable Long lostId,Model model){
		DetLost lost = lostService.getLostById(lostId);
		model.addAttribute("lost",lost);
		//增加该失物文章信息浏览次数
		TbTextinfo textInfo = textService.getTextInfo(lostId);
		model.addAttribute("lostTextInfo", textInfo);
		
		return "lostDetail";
	}
	
	/*
	 * 验证密码是否正确
	 */
	@RequestMapping("/pwd/validate")
	@ResponseBody
	public LostResult validatePwd(@RequestBody TbLost tbLost){
		return lostService.getValidatePwd(tbLost);
	}
	
	
}
