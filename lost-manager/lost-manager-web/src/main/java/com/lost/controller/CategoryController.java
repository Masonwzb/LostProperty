package com.lost.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.lost.common.pojo.LostResult;
import com.lost.common.pojo.PageResult;
import com.lost.pojo.TbCategory;
import com.lost.service.CategoryService;


@RestController
@RequestMapping("/category")
public class CategoryController {

	@Autowired
	private CategoryService categoryService;
	
	/*
	 * 根据ID查询物品分类
	 */
	@RequestMapping("/findOne")
	public TbCategory getCategoryById(@RequestParam("id") Long categoryId){
		TbCategory category = categoryService.getCategoryById(categoryId);
		return category;
	}
	
	/*
	 * 查询所有物品分类
	 */
	@RequestMapping("/findAll")
	public List<TbCategory> getAllCategory(){
		return categoryService.getAllCategory();
	}
	
	/*
	 * 物品分类分页
	 */
	@RequestMapping("/findPage")
	public PageResult categoryPage(@RequestParam("page") int pageNum, @RequestParam("size") int pageSize){
		return categoryService.categoryPage(pageNum, pageSize);
	}
	
	/*
	 * 按条件查询并分页
	 */
	@RequestMapping("/search")
	public PageResult pageByCondition(@RequestBody TbCategory category,int page,int size){
		return categoryService.categoryPage(category, page, size);
	}
	
	/*
	 * 添加物品分类
	 */
	@RequestMapping("/add")
	public LostResult add(@RequestBody TbCategory category){
		LostResult result = categoryService.add(category);
		return result;
	}
	
	/*
	 * 更新物品分类
	 */
	@RequestMapping("/update")
	public LostResult update(@RequestBody TbCategory category){
		LostResult result = categoryService.update(category);
		return result;
	}
	
	/*
	 * 删除物品分类
	 */
	@RequestMapping("/delete")
	public LostResult delete(Long[] ids){
		LostResult result = categoryService.delete(ids);
		return result;
	}
	
}
