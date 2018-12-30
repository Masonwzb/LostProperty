package com.lost.portal.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.lost.common.pojo.LostResult;
import com.lost.common.utils.HttpClientUtil;
import com.lost.pojo.TbCategory;
import com.lost.portal.service.CategoryService;
@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Value("${REST_BASE_URL}")
	private String REST_BASE_URL;
	@Value("${REST_CATEGORY_FIND_ALL}")
	private String REST_CATEGORY_FIND_ALL;
	
	/*
	 * 查询所有物品分类
	 */
	@Override
	public List<TbCategory> getAllCategory() {
		
		try {
			//获取服务层的数据
			String json = HttpClientUtil.doGet(REST_BASE_URL + REST_CATEGORY_FIND_ALL);
			//将字符串转换为对象集合
			LostResult lostResult = LostResult.formatToList(json, TbCategory.class);
			if(lostResult.getStatus() == 200){
				List<TbCategory> data = (List<TbCategory>) lostResult.getData();
				return data;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
