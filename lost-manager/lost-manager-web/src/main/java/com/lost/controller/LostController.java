package com.lost.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.lost.common.pojo.LostResult;
import com.lost.common.pojo.PageResult;
import com.lost.customPojo.DetLost;
import com.lost.pojo.TbLost;
import com.lost.service.LostService;

@RestController
@RequestMapping("/lost")
public class LostController {

	@Autowired
	private LostService lostService;
	
	/*
	 * 查询所有失物
	 */
	@RequestMapping("/findAll")
	public List<TbLost> getAllLost(){
		return lostService.getAllLost();
	}
	
	/*
	 * 查询明细失物
	 */
	@RequestMapping("/findDetail")
	public List<DetLost> getAllDetailLost(){
		return lostService.getAllDetailLost();
	}
	
	/*
	 * 分页所有明细失物
	 */
	@RequestMapping("/findPage")
	public PageResult pageLostAll(int page,int size){
		return lostService.pageLost(page, size);
	}
	
	/*
	 * 分页条件查询所有明细失物
	 */
	@RequestMapping(value="/search")
	public PageResult pageLostSearch(@RequestBody DetLost detLost,int page,int size){
		return lostService.pageLost(detLost, page, size);
	}
	
	/*
	 * 批量删除失物
	 */
	@RequestMapping("/delete")
	public LostResult deleteLost(Long[] ids){
		LostResult result = lostService.deleteLost(ids);
		return result;
	}
	
	
}
