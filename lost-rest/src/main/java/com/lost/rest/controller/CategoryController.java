package com.lost.rest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lost.common.pojo.LostResult;
import com.lost.rest.service.CategoryService;

@RestController
@RequestMapping("/category")
public class CategoryController {

	@Autowired
	private CategoryService categoryService;
	
	/*
	 * 查询所有物品分类
	 */
	@RequestMapping("/findAll")
	public LostResult getAllCategory(){
		return categoryService.getAllCategory();
	}
	
}
