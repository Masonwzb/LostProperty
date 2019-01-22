package com.lost.rest.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.lost.common.pojo.LostResult;
import com.lost.common.pojo.PageResult;
import com.lost.common.utils.IDUtils;
import com.lost.customMapper.DetLostMapper;
import com.lost.customPojo.DetLost;
import com.lost.mapper.TbLostMapper;
import com.lost.mapper.TbTextinfoMapper;
import com.lost.pojo.TbLost;
import com.lost.pojo.TbLostExample;
import com.lost.pojo.TbTextinfo;
import com.lost.rest.service.LostService;
@Service
public class LostServiceImpl implements LostService {

	@Autowired
	private TbLostMapper lostMapper;
	@Autowired
	private DetLostMapper detLostMapper;
	@Autowired
	private TbTextinfoMapper textInfoMapper;

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

	/*
	 * 根据条件查询失物
	 */
	@Override
	public LostResult getLostByCondition(DetLost detLost, int page, int size) {
		//分页
		PageHelper.startPage(page, size);
		//按条件查询
		Page<DetLost> page1 =  (Page<DetLost>) detLostMapper.selectConditionLost(detLost);
		PageResult result = new PageResult(page1.getTotal(),page1.getResult());
		//结果使用LostResult包装
		return LostResult.ok(result);
	}

	/*
	 * 添加失物信息
	 */
	@Override
	public LostResult addLost(TbLost tbLost) throws Exception{
		// 补全失物信息
		//设置ID
		Long userId = (long) 2;
		tbLost.setId(IDUtils.generateId());
		
		//添加添加失物详细文章信息
		LostResult result = insertTextInfo(tbLost.getId());
		if(result.getStatus() != 200){
			throw new Exception();
		}
		
		tbLost.setUserId(userId);
		
		//设置日期
		tbLost.setCreated(new Date());
		tbLost.setUpdated(new Date());
		//添加至数据库
		lostMapper.insert(tbLost);
		return LostResult.ok();
	}
	
	/*
	 * 添加失物详细文章信息
	 */
	private LostResult insertTextInfo(Long goods_id){
		TbTextinfo text = new TbTextinfo();
		text.setGoodsId(goods_id);
		text.setPublishTime(new Date());
		text.setPageView(0);
		text.setStatus(0);
		text.setCreated(new Date());
		text.setUpdated(new Date());
		textInfoMapper.insert(text);
		return LostResult.ok();
	}
	

	/*
	 * 根据ID查询失物信息
	 */
	@Override
	public LostResult getLostById(Long lostId) {
		DetLost detlost = detLostMapper.selectLostById(lostId);
		return LostResult.ok(detlost);
	}

	/*
	 * 验证管理密码是否正确
	 */
	@Override
	public LostResult getPwdValidate(TbLost tbLost) {
		// 获取数据库中失物信息
		TbLost databaseLost = lostMapper.selectByPrimaryKey(tbLost.getId());
		//判断密码是否一致
		if(databaseLost.getPassword().equals(tbLost.getPassword())){
			return LostResult.ok();
		}else{
			//如果不一致
			LostResult lostResult = new LostResult(404, "ERROR", null);
			return lostResult;
		}
	}


}
