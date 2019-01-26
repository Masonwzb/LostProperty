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
import com.lost.mapper.TbCommentMapper;
import com.lost.mapper.TbLostMapper;
import com.lost.mapper.TbTextinfoMapper;
import com.lost.pojo.TbCommentExample;
import com.lost.pojo.TbLost;
import com.lost.pojo.TbLostExample;
import com.lost.pojo.TbTextinfoExample;
import com.lost.pojo.TbLostExample.Criteria;
import com.lost.service.LostService;
@Service
public class LostServiceImpl implements LostService{

	@Autowired
	private TbLostMapper lostMapper;
	@Autowired
	private DetLostMapper detLostMapper;
	@Autowired 
	private TbTextinfoMapper textInfoMapper;
	@Autowired
	private TbCommentMapper commentMapper;
	
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
			
			//删除启事信息
			//根据物品ID删除
			TbTextinfoExample example = new TbTextinfoExample();
			com.lost.pojo.TbTextinfoExample.Criteria createCriteria = example.createCriteria();
			createCriteria.andGoodsIdEqualTo(id);
			textInfoMapper.deleteByExample(example);
			
			//删除评论信息
			//根据物品ID删除
			TbCommentExample example2 = new TbCommentExample();
			com.lost.pojo.TbCommentExample.Criteria createCriteria2 = example2.createCriteria();
			createCriteria2.andGoodsIdEqualTo(id);
			commentMapper.deleteByExample(example2);
		}
		return LostResult.ok();
	}

}
