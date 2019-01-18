package com.lost.portal.service.impl;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.lost.common.pojo.LostResult;
import com.lost.common.utils.HttpClientUtil;
import com.lost.pojo.TbTextinfo;
import com.lost.portal.service.TextService;
@Service
public class TextServiceImpl implements TextService {

	@Value("${REST_BASE_URL}")
	private String REST_BASE_URL;
	@Value("${REST_ADD_PAGEVIEW}")
	private String REST_ADD_PAGEVIEW;
	
	/*
	 * 增加浏览次数，并返回文章信息
	 */
	@Override
	public TbTextinfo getTextInfo(Long goods_id) {
		try {
			//获取服务层的数据
			String jsons = HttpClientUtil.doGet(REST_BASE_URL + REST_ADD_PAGEVIEW + goods_id);
			//将字符串转换为对象
			LostResult lostResult = LostResult.formatToPojo(jsons, TbTextinfo.class);
			if(lostResult.getStatus() == 200){
				TbTextinfo data = (TbTextinfo) lostResult.getData();
				return data;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
