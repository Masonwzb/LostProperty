package com.lost.rest.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.lost.common.pojo.LostResult;
import com.lost.common.pojo.PageResult;
import com.lost.mapper.TbLostMapper;
import com.lost.pojo.TbLost;
import com.lost.rest.service.LostService;
@Service
public class LostServiceImpl implements LostService {

	@Autowired
	private TbLostMapper lostMapper;

	/*
	 * 根据时间查询失物
	 */
	@Override
	public LostResult getLostByTime(int page, int size) {
		//分页处理
		PageHelper.startPage(page, size);
		Page<TbLost> page1 = (Page<TbLost>) lostMapper.selectByTime();
		PageResult result = new PageResult(page1.getTotal(),page1.getResult());
		//结果使用LostResult包装
		return LostResult.ok(result);
		
	}


}
