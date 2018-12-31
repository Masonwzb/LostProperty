package com.lost.portal.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.lost.common.pojo.LostResult;
import com.lost.common.pojo.PageResult;
import com.lost.common.utils.HttpClientUtil;
import com.lost.common.utils.JsonUtils;
import com.lost.customPojo.DetFound;
import com.lost.customPojo.DetLost;
import com.lost.pojo.TbFound;
import com.lost.portal.service.FoundService;



@Service
public class FoundServiceImpl implements FoundService {

	@Value("${REST_BASE_URL}")
	private String REST_BASE_URL;
	@Value("${REST_INDEX_FOUND_TIME}")
	private String REST_INDEX_FOUND_TIME;
	@Value("${REST_FOUND_SEARCH_URL}")
	private String REST_FOUND_SEARCH_URL;
	@Value("${REST_ADD_FOUND}")
	private String REST_ADD_FOUND;
	
	
	//根据时间查询失物
	@Override
	public PageResult getFoundByTime(int page, int size) {
		//获取服务层的数据
		//查询参数
		Map<String,String> param = new HashMap<String,String>();
		param.put("page", page+"");
		param.put("size", size+"");
		try {
			String jsons = HttpClientUtil.doGet(REST_BASE_URL + REST_INDEX_FOUND_TIME, param);
			//将字符串转换为对象;
				LostResult found = LostResult.formatToPojo(jsons, PageResult.class);
				if(found.getStatus() == 200){
					PageResult data = (PageResult) found.getData();
					return data;
				}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}


	/*
	 * 根据条件查询招领物
	 */
	@Override
	public PageResult getFoundByCondition(DetFound detFound, int page, int size) {
		//将对象转换为json数据
		String json = JsonUtils.objectToJson(detFound);
		//获取服务层的数据
		try {
			String jsons = HttpClientUtil.doPostJson(REST_BASE_URL + REST_FOUND_SEARCH_URL+"?page="+page+"&size="+size,json);
			//将字符串转换为对象;
				LostResult found = LostResult.formatToPojo(jsons, PageResult.class);
				if(found.getStatus() == 200){
					PageResult data = (PageResult) found.getData();
					return data;
				}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}


	/*
	 * 添加招领信息
	 */
	@Override
	public LostResult addFoundInfo(TbFound tbFound) {
		//将对象转换为json数据
				String json = JsonUtils.objectToJson(tbFound);
				//获取服务层的数据
				try {
					String jsons = HttpClientUtil.doPostJson(REST_BASE_URL + REST_ADD_FOUND, json);
					//判断jsons是否为空
					if(!StringUtils.isEmpty(jsons)){
						return LostResult.ok();
					}
						
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				return null;
	}

}
