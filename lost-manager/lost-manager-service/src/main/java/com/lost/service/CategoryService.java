package com.lost.service;

import java.util.List;

import com.lost.common.pojo.LostResult;
import com.lost.common.pojo.PageResult;
import com.lost.pojo.TbCategory;

public interface CategoryService {

	//根据ID查询物品分类
	public TbCategory getCategoryById(long categoryId);
	//查询所有物品分类
	public List<TbCategory> getAllCategory();
	//物品分类分页
	public PageResult categoryPage(int pageNum,int pageSize);
	//按条件查询并分页
	public PageResult categoryPage(TbCategory category,int pageNum,int PageSize);
	//添加物品分类
	public LostResult add(TbCategory category);
	//修改物品分类
	public LostResult update(TbCategory category);
	//批量删除物品分类
	public LostResult delete(Long[] ids);
	
}
