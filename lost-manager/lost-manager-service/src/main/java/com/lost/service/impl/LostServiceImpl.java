package com.lost.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.lost.common.pojo.LostResult;
import com.lost.common.pojo.PageResult;
import com.lost.customMapper.DetLostMapper;
import com.lost.customPojo.DetLost;
import com.lost.mapper.TbLostMapper;
import com.lost.pojo.TbLost;
import com.lost.pojo.TbLostExample;
import com.lost.pojo.TbLostExample.Criteria;
import com.lost.service.LostService;
@Service
public class LostServiceImpl implements LostService{

	@Autowired
	private TbLostMapper lostMapper;
	@Autowired
	private DetLostMapper detLostMapper;
	
	//查询所有失物
	@Override
	public List<TbLost> getAllLost() {		
		return lostMapper.selectByExample(null);
	}

	//查询所有明细失物
	@Override
	public List<DetLost> getAllDetailLost() {
		return detLostMapper.selectAllDetailLost();
	}

	//分页所有明细失物
	@Override
	public PageResult pageLost(int page, int size) {
		//分页
		PageHelper.startPage(page, size);
		//按条件查询
		Page<DetLost> page1 = (Page<DetLost>) detLostMapper.selectAllDetailLost();
		return new PageResult(page1.getTotal(), page1.getResult());
	}

	/*
	 * 分页条件查询所有明细失物
	 */
	@Override
	public PageResult pageLost(DetLost detLost, int page, int size) {
		//分页
		PageHelper.startPage(page, size);
		//按条件查询
		Page<DetLost> page1 =  (Page<DetLost>) detLostMapper.selectConditionLost(detLost);
		return new PageResult(page1.getTotal(), page1.getResult());
	}

	
	/*
	 * 批量删除失物
	 */
	@Override
	public LostResult deleteLost(Long[] ids) {
		for (Long id : ids) {
			lostMapper.deleteByPrimaryKey(id);
		}
		return LostResult.ok();
	}

}
