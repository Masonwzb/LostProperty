package com.lost.rest.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lost.common.pojo.LostResult;
import com.lost.mapper.TbCategoryMapper;
import com.lost.pojo.TbCategory;
import com.lost.rest.service.CategoryService;
@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private TbCategoryMapper categoryMapper;
	
	/*
	 * 查询所有物品分类
	 */
	@Override
	public LostResult getAllCategory() {
		List<TbCategory> result = categoryMapper.selectByExample(null);
		return LostResult.ok(result);
	}

}
