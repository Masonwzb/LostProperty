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
import com.lost.customMapper.DetFoundMapper;
import com.lost.customMapper.DetLostMapper;
import com.lost.customPojo.DetFound;
import com.lost.customPojo.DetLost;
import com.lost.mapper.TbFoundMapper;
import com.lost.mapper.TbTextinfoMapper;
import com.lost.pojo.TbFound;
import com.lost.pojo.TbTextinfo;
import com.lost.rest.service.FoundService;
@Service
public class FoundServiceImpl implements FoundService {

	@Autowired
	private TbFoundMapper foundMapper;
	@Autowired
	private DetFoundMapper detFoundMapper;
	@Autowired
	private TbTextinfoMapper textInfoMapper;

	/*
	 * 根据时间查询招领物
	 */
	@Override
	public LostResult getFoundByTime(int page, int size) {
		//分页处理
		PageHelper.startPage(page, size);
		Page<TbFound> page1 = (Page<TbFound>) foundMapper.selectByTime();
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

	/*
	 * 添加招领信息
	 */
	@Override
	public LostResult addFound(TbFound tbFound) throws Exception{
		// 补全招领信息
		//设置ID
		Long userId = (long) 2;
		tbFound.setId(IDUtils.generateId());
		
		//添加添加招领详细文章信息
		LostResult result = insertTextInfo(tbFound.getId());
		if(result.getStatus() != 200){
			throw new Exception();
		}
		
		tbFound.setUserId(userId);
		
		//设置日期
		tbFound.setCreated(new Date());
		tbFound.setUpdated(new Date());
		//添加至数据库
		foundMapper.insert(tbFound);
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
	public LostResult getFoundById(Long foundId) {
		DetFound detFound = detFoundMapper.selectFoundById(foundId);
		return LostResult.ok(detFound);
	}


}
