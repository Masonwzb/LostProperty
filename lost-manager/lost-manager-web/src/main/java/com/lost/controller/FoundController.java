package com.lost.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lost.common.pojo.LostResult;
import com.lost.common.pojo.PageResult;
import com.lost.customPojo.DetFound;
import com.lost.pojo.TbFound;
import com.lost.service.FoundService;

@RestController
@RequestMapping("/found")
public class FoundController {

	@Autowired
	private FoundService foundService;
	
	/*
	 * 查询所有招领物
	 */
	@RequestMapping("/findAll")
	public List<TbFound> getAllFound(){
		return foundService.getAllFound();
	}
	
	/*
	 * 查询明细招领物
	 */
	@RequestMapping("/findDetail")
	public List<DetFound> getAllDetailFound(){
		return foundService.getAllDetailFound();
	}
	
	/*
	 * 分页所有明细招领物
	 */
	@RequestMapping("/findPage")
	public PageResult pageFoundAll(int page,int size){
		return foundService.pageFound(page, size);
	}
	
	/*
	 * 分页条件查询所有明细招领物
	 */
	@RequestMapping(value="/search")
	public PageResult pageFoundSearch(@RequestBody DetFound detFound,int page,int size){
		return foundService.pageFound(detFound, page, size);
	}
	
	/*
	 * 批量删除招领物
	 */
	@RequestMapping("/delete")
	public LostResult deleteFound(Long[] ids){
		LostResult result = foundService.deleteFound(ids);
		return result;
	}
	
	
}
