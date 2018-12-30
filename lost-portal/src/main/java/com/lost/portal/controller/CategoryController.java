package com.lost.portal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lost.pojo.TbCategory;
import com.lost.portal.service.CategoryService;

@RestController
@RequestMapping("/category")
public class CategoryController {
	
	@Autowired
	private CategoryService categroyService;
	
	/*
	 * 查询所有物品分类
	 */
	@RequestMapping("/findAll")
	public List<TbCategory> findAllCategory(){
		return categroyService.getAllCategory();
	}
	
}
