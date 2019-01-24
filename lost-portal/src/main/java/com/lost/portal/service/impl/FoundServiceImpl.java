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
import com.lost.pojo.TbLost;
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
	@Value("${REST_ID_GET_FOUND}")
	private String REST_ID_GET_FOUND;
	@Value("${REST_FOUND_VALIDATEPWD}")
	private String REST_FOUND_VALIDATEPWD;
	@Value("${REST_BY_ID_FOUND}")
	private String REST_BY_ID_FOUND;
	@Value("${REST_UPDATE_FOUND}")
	private String REST_UPDATE_FOUND;
	
	
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


	/*
	 * 根据ID查询招领信息
	 */
	@Override
	public DetFound getDetFoundById(Long foundId) {
		//获取服务层的信息
		try {
			String json = HttpClientUtil.doGet(REST_BASE_URL + REST_ID_GET_FOUND + foundId);
			//将字符串转换为对象
			LostResult lostResult = LostResult.formatToPojo(json, DetFound.class);
			if(lostResult.getStatus() == 200){
				DetFound result = (DetFound) lostResult.getData();
				return result;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	/*
	 * 验证密码是否正确
	 */
	@Override
	public LostResult getValidatePwd(TbFound tbFound) {
		//将对象转换为json数据
		String json = JsonUtils.objectToJson(tbFound);
		// 获取服务器的数据
		try {
			String jsons = HttpClientUtil.doPostJson(REST_BASE_URL + REST_FOUND_VALIDATEPWD, json);
			//将字符串转换为对象
			LostResult result = LostResult.formatToPojo(jsons, TbFound.class);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	/*
	 * 根据Id查询失物信息
	 */
	@Override
	public TbFound getFoundById(Long foundId) {
		//获取服务层的信息
		try {
			String json = HttpClientUtil.doGet(REST_BASE_URL + REST_BY_ID_FOUND + foundId);
			//将字符串转换为对象
			LostResult lostResult = LostResult.formatToPojo(json, TbFound.class);
			if(lostResult.getStatus() == 200){
				TbFound result = (TbFound) lostResult.getData();
				return result;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	/*
	 * 更新失物信息
	 */
	@Override
	public LostResult updateFound(TbFound tbFound) {
		//将对象转换为json数据
		String jsons = JsonUtils.objectToJson(tbFound);
		try {
			// 从数据层获取数据
			String json = HttpClientUtil.doPostJson(REST_BASE_URL + REST_UPDATE_FOUND, jsons);
			//判断json是否为空
			if(!StringUtils.isEmpty(json)){
				return LostResult.ok();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
