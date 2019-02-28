package com.lost.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.lost.common.pojo.LostResult;
import com.lost.common.pojo.PageResult;
import com.lost.customPojo.DetLost;
import com.lost.pojo.TbLost;
import com.lost.service.LostService;

@Controller
@RequestMapping("/lost")
public class LostController {

	@Autowired
	private LostService lostService;
	
	/*
	 * 查询所有失物
	 */
	@RequestMapping("/findAll")
	@ResponseBody
	public List<TbLost> getAllLost(){
		return lostService.getAllLost();
	}
	
	/*
	 * 查询明细失物
	 */
	@RequestMapping("/findDetail")
	@ResponseBody
	public List<DetLost> getAllDetailLost(){
		return lostService.getAllDetailLost();
	}
	
	/*
	 * 分页所有明细失物
	 */
	@RequestMapping("/findPage")
	@ResponseBody
	public PageResult pageLostAll(int page,int size){
		return lostService.pageLost(page, size);
	}
	
	/*
	 * 分页条件查询所有明细失物
	 */
	@RequestMapping(value="/search")
	@ResponseBody
	public PageResult pageLostSearch(@RequestBody DetLost detLost,int page,int size){
		return lostService.pageLost(detLost, page, size);
	}
	
	/*
	 * 批量删除失物
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public LostResult deleteLost(Long[] ids){
		LostResult result = lostService.deleteLost(ids);
		return result;
	}
	
	/*
	 * 数据统计
	 */
	@RequestMapping("/statistics")
	@ResponseBody
	public LostResult LostStatistics(){
		Map<String, String> result = lostService.LostStatistics();
		return LostResult.ok(result);
	}
	
	/*
	 * 根据ID查询明细失物
	 */
	@RequestMapping("/findOne")
	@ResponseBody
	public DetLost selectDetLostById(@RequestParam(value="id") Long lostId){
		return lostService.getDetLostById(lostId);
	}
	
	/*
	 * 更新寻物审核状态
	 */
	@RequestMapping("/updateStatus")
	@ResponseBody
	public LostResult updateLostStatus(Long lostId,int status){
		return lostService.updateLostStatus(lostId, status);
	}
	
	/*
	 * 统计未审核数据
	 */
	@RequestMapping("/unaudited")
	public String unaudited(Model model){
		Map<String, String> unaudited = lostService.unaudited();
		model.addAttribute("unaudited", unaudited);
		return "home";
	}
	
	
	
}
