package com.lost.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.lost.common.pojo.LostResult;
import com.lost.common.pojo.PageResult;
import com.lost.customMapper.DetLostMapper;
import com.lost.customPojo.DetLost;
import com.lost.mapper.TbCommentMapper;
import com.lost.mapper.TbFoundMapper;
import com.lost.mapper.TbLostMapper;
import com.lost.mapper.TbTextinfoMapper;
import com.lost.pojo.TbCommentExample;
import com.lost.pojo.TbFoundExample;
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
	private TbFoundMapper foundMapper;
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

	//数据统计
	@Override
	public Map<String, String> LostStatistics() {
		//有效失物启事
		TbLostExample example = new TbLostExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andEmailNotEqualTo("已保密");
		int validLost1 = lostMapper.countByExample(example);
		
		//无效失物启事
		TbLostExample example1 = new TbLostExample();
		Criteria createCriteria1 = example1.createCriteria();
		createCriteria1.andEmailEqualTo("已保密");
		int invalidLost1 = lostMapper.countByExample(example1);
		
		//有效招领启事
		TbFoundExample example2 = new TbFoundExample();
		com.lost.pojo.TbFoundExample.Criteria createCriteria2 = example2.createCriteria();
		createCriteria2.andEmailNotEqualTo("已保密");
		int validFound1 = foundMapper.countByExample(example2);
		
		//无效招领启事
		TbFoundExample example3 = new TbFoundExample();
		com.lost.pojo.TbFoundExample.Criteria createCriteria3 = example3.createCriteria();
		createCriteria3.andEmailEqualTo("已保密");
		int invalidFound1 = foundMapper.countByExample(example3);
		
		//整数转换为字符串
		String validLost = String.valueOf(validLost1);
		String invalidLost = String.valueOf(invalidLost1);
		String validFound = String.valueOf(validFound1);
		String invalidFound = String.valueOf(invalidFound1);
		
		//将数据统计放进map中
		Map<String, String> result = new HashMap<String, String>();
		result.put(validLost, "寻找中寻物启事");
		result.put(invalidLost, "已失效寻物启事");
		result.put(validFound, "寻找中招领启事");
		result.put(invalidFound, "已失效招领启事");
		
		
		return result;
	}

	/*
	 * 根据Id查询明细寻物
	 */
	@Override
	public DetLost getDetLostById(Long lostId) {
		return detLostMapper.selectLostById(lostId);
	}

	/*
	 * 更新寻物审核状态
	 */
	@Override
	public LostResult updateLostStatus(Long lostId, int status) {
		// 根据ID查询寻物启事
		TbLost lost = lostMapper.selectByPrimaryKey(lostId);
		
		//判断status如果为2：审核未通过则删除否则更新status
		if(status == 2){
			lostMapper.deleteByPrimaryKey(lostId);
		}else{
			lost.setStatus(status);
			lostMapper.updateByPrimaryKey(lost);
		}
		
		return LostResult.ok();
	}

	/*
	 * 统计未审核数据
	 */
	@Override
	public Map<String, String> unaudited() {
		
		//未审核寻物启事
		TbLostExample example = new TbLostExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andStatusEqualTo(0);
		int lostUnaudited1 = lostMapper.countByExample(example);
		
		//未审核招领启事
		TbFoundExample example1 = new TbFoundExample();
		com.lost.pojo.TbFoundExample.Criteria createCriteria2 = example1.createCriteria();
		createCriteria2.andStatusEqualTo(0);
		int foundUnaudited1 = foundMapper.countByExample(example1);
		
		//寻物启事总数
		int lostAll1 = lostMapper.countByExample(null);
		
		//招领启事总数
		int foundAll1 = foundMapper.countByExample(null);
		
		
		//整数转换为字符串
		String lostUnaudited = String.valueOf(lostUnaudited1);
		String foundUnaudited = String.valueOf(foundUnaudited1);
		String lostAll = String.valueOf(lostAll1);
		String foundAll = String.valueOf(foundAll1);
		
		//将数据统计放进map中
		Map<String, String> result = new HashMap<String, String>();
		result.put("lost", lostUnaudited);
		result.put("found", foundUnaudited);
		result.put("lostAll", lostAll);
		result.put("foundAll", foundAll);
		
		return result;
	}

}
