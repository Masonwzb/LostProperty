package com.lost.rest.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.lost.common.pojo.LostResult;
import com.lost.common.pojo.PageResult;
import com.lost.customMapper.DetFoundMapper;
import com.lost.customMapper.DetLostMapper;
import com.lost.customPojo.DetFound;
import com.lost.customPojo.DetLost;
import com.lost.mapper.TbFoundMapper;
import com.lost.pojo.TbFound;
import com.lost.rest.service.FoundService;
@Service
public class FoundServiceImpl implements FoundService {

	@Autowired
	private TbFoundMapper FoundMapper;
	@Autowired
	private DetFoundMapper detFoundMapper;

	/*
	 * 根据时间查询招领物
	 */
	@Override
	public LostResult getFoundByTime(int page, int size) {
		//分页处理
		PageHelper.startPage(page, size);
		Page<TbFound> page1 = (Page<TbFound>) FoundMapper.selectByTime();
		PageResult result = new PageResult(page1.getTotal(),page1.getResult());
		//结果使用FoundResult包装
		return LostResult.ok(result);
		
	}

	/*
	 * 根据条件查询招领物
	 */
	@Override
	public LostResult getFoundByCondition(DetFound detFound, int page, int size) {
		//分页
		PageHelper.startPage(page, size);
		//按条件查询
		Page<DetFound> page1 =  (Page<DetFound>) detFoundMapper.selectConditionFound(detFound);
		PageResult result = new PageResult(page1.getTotal(),page1.getResult());
		//结果使用LostResult包装
		return LostResult.ok(result);
	}


}
