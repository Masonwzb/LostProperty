package com.lost.rest.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lost.common.pojo.LostResult;
import com.lost.mapper.TbTextinfoMapper;
import com.lost.pojo.TbTextinfo;
import com.lost.pojo.TbTextinfoExample;
import com.lost.pojo.TbTextinfoExample.Criteria;
import com.lost.rest.service.TextService;
@Service
public class TextServiceImpl implements TextService {

	@Autowired
	private TbTextinfoMapper textInfoMapper;
	
	@Override
	public LostResult getUpdatedText(Long goods_id) {
		//获取物品对应文章信息
		TbTextinfoExample example = new TbTextinfoExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andGoodsIdEqualTo(goods_id);
		List<TbTextinfo> list = textInfoMapper.selectByExample(example);
		if(list.get(0) != null){
			TbTextinfo text = list.get(0);
			//增加浏览次数
			int times = text.getPageView();
			text.setPageView(++times);
			text.setUpdated(new Date());
			//更新文章信息
			textInfoMapper.updateByPrimaryKeySelective(text);
			
			return LostResult.ok(text);
		}
		
		return null;
	}

}
