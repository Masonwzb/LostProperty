package com.lost.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.lost.common.pojo.LostResult;
import com.lost.common.pojo.PageResult;
import com.lost.common.utils.IDUtils;
import com.lost.mapper.TbCategoryMapper;
import com.lost.pojo.TbCategory;
import com.lost.pojo.TbCategoryExample;
import com.lost.pojo.TbCategoryExample.Criteria;
import com.lost.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	private TbCategoryMapper categoryMapper;
	/*
	 * 根据ID查询物品分类
	 */
	@Override
	public TbCategory getCategoryById(long categoryId) {
		TbCategoryExample example = new TbCategoryExample();
		//添加查询条件
		Criteria createCriteria = example.createCriteria();
		createCriteria.andIdEqualTo(categoryId);
		List<TbCategory> list = categoryMapper.selectByExample(example);
		if(list != null && list.size() > 0){
			TbCategory category = list.get(0);
			return category;
		}
		return null;
	}

	//查询所有物品分类
	@Override
	public List<TbCategory> getAllCategory() {
		return categoryMapper.selectByExample(null);
	}

	/*
	 * 物品类别分页
	 */
	@Override
	public PageResult categoryPage(int pageNum, int pageSize) {
		//分页
		PageHelper.startPage(pageNum, pageSize);
		Page<TbCategory> page = (Page<TbCategory>) categoryMapper.selectByExample(null);
		return new PageResult(page.getTotal(), page.getResult());
	}

	/*
	 * 按条件查询物品类别分页
	 */
	@Override
	public PageResult categoryPage(TbCategory category, int pageNum, int PageSize) {
		//分页
		PageHelper.startPage(pageNum, PageSize);
		//按条件查询
		TbCategoryExample example = new TbCategoryExample();
		Criteria createCriteria = example.createCriteria();
		//判断条件
		if(category != null){
			if(category.getCategoryName() != null && category.getCategoryName().length() > 0){
				createCriteria.andCategoryNameLike("%"+category.getCategoryName()+"%");
			}
		}
		
		Page<TbCategory> page2 = (Page<TbCategory>) categoryMapper.selectByExample(example);
		
		return new PageResult(page2.getTotal(), page2.getResult());
	}

	/*
	 * 添加物品分类
	 */
	@Override
	public LostResult add(TbCategory category) {
		category.setCreated(new Date());
		category.setUpdated(new Date());
		categoryMapper.insert(category);	
		return LostResult.ok();
	}

	/*
	 * 修改物品分类
	 */
	@Override
	public LostResult update(TbCategory category) {
		category.setUpdated(new Date());
		categoryMapper.updateByPrimaryKeySelective(category);
		return LostResult.ok();
	}

	/*
	 * 删除物品分类
	 */
	@Override
	public LostResult delete(Long[] ids) {
		for (Long id : ids) {
			categoryMapper.deleteByPrimaryKey(id);
		}
		return LostResult.ok();
	}

	
}
