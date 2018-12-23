package com.lost.portal.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.lost.common.pojo.LostResult;
import com.lost.common.pojo.PageResult;
import com.lost.common.utils.HttpClientUtil;
import com.lost.pojo.TbLost;
import com.lost.portal.service.LostService;



@Service
public class LostServiceImpl implements LostService {

	@Value("${REST_BASE_URL}")
	private String REST_BASE_URL;
	@Value("${REST_INDEX_LOST_TIME}")
	private String REST_INDEX_LOST_TIME;
	
	
	//根据时间查询失物
	@Override
	public PageResult getLostByTime(int page, int size) {
		//获取服务层的数据
		//查询参数
		Map<String,String> param = new HashMap<String,String>();
		param.put("page", page+"");
		param.put("size", size+"");
		try {
			String jsons = HttpClientUtil.doGet(REST_BASE_URL + REST_INDEX_LOST_TIME, param);
			//将字符串转换为对象;
				LostResult lost = LostResult.formatToPojo(jsons, PageResult.class);
				if(lost.getStatus() == 200){
					PageResult data = (PageResult) lost.getData();
					return data;
				}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
