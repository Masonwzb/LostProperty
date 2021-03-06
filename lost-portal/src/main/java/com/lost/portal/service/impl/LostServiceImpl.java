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
import com.lost.customPojo.DetLost;
import com.lost.pojo.TbLost;
import com.lost.portal.service.LostService;



@Service
public class LostServiceImpl implements LostService {

	@Value("${REST_BASE_URL}")
	private String REST_BASE_URL;
	@Value("${REST_INDEX_LOST_TIME}")
	private String REST_INDEX_LOST_TIME;
	@Value("${REST_LOST_SEARCH_URL}")
	private String REST_LOST_SEARCH_URL;
	@Value("${REST_ADD_LOST}")
	private String REST_ADD_LOST;
	@Value("${REST_ID_GET_LOST}")
	private String REST_ID_GET_LOST;
	@Value("${REST_LOST_VALIDATEPWD}")
	private String REST_LOST_VALIDATEPWD;
	@Value("${REST_BY_ID_LOST}")
	private String REST_BY_ID_LOST;
	@Value("${REST_UPDATE_LOST}")
	private String REST_UPDATE_LOST;
	@Value("${REST_DELETE_LOST}")
	private String REST_DELETE_LOST;
	@Value("${REST_SENDEMAIL_LOST}")
	private String REST_SENDEMAIL_LOST;
	@Value("${REST_ALL_LOST}")
	private String REST_ALL_LOST;
	
	
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

	/*
	 * 根据条件查询失物
	 */
	@Override
	public PageResult getLostByCondition(DetLost detLost, int page, int size) {
		//将对象转换为json数据
		String json = JsonUtils.objectToJson(detLost);
		//获取服务层的数据
		try {
			String jsons = HttpClientUtil.doPostJson(REST_BASE_URL + REST_LOST_SEARCH_URL+"?page="+page+"&size="+size,json);
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

	/*
	 * 添加失物信息
	 */
	@Override
	public LostResult addLostInfo(TbLost tbLost) {
		//将对象转换为json数据
		String json = JsonUtils.objectToJson(tbLost);
		//获取服务层的数据
		try {
			String jsons = HttpClientUtil.doPostJson(REST_BASE_URL + REST_ADD_LOST, json);
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
	 * 根据ID查询明细失物信息
	 */
	@Override
	public DetLost getDetLostById(Long lostId) {
		//获取服务层的信息
		try {
			String json = HttpClientUtil.doGet(REST_BASE_URL + REST_ID_GET_LOST + lostId);
			//将字符串转换为对象
			LostResult lostResult = LostResult.formatToPojo(json, DetLost.class);
			if(lostResult.getStatus() == 200){
				DetLost result = (DetLost) lostResult.getData();
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
	public LostResult getValidatePwd(TbLost tbLost) {
		//将对象转换为json数据
		String json = JsonUtils.objectToJson(tbLost);
		// 获取服务器的数据
		try {
			String jsons = HttpClientUtil.doPostJson(REST_BASE_URL + REST_LOST_VALIDATEPWD, json);
			//将字符串转换为对象
			LostResult result = LostResult.formatToPojo(jsons, TbLost.class);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	/*
	 * 根据ID查询失物信息
	 */
	@Override
	public TbLost getLostById(Long lostId) {
		//获取服务层的信息
		try {
			String json = HttpClientUtil.doGet(REST_BASE_URL + REST_BY_ID_LOST + lostId);
			//将字符串转换为对象
			LostResult lostResult = LostResult.formatToPojo(json, TbLost.class);
			if(lostResult.getStatus() == 200){
				TbLost result = (TbLost) lostResult.getData();
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
	public LostResult updateLost(TbLost tbLost) {
		//将对象转换为json数据
		String jsons = JsonUtils.objectToJson(tbLost);
		try {
			// 从数据层获取数据
			String json = HttpClientUtil.doPostJson(REST_BASE_URL + REST_UPDATE_LOST, jsons);
			//判断json是否为空
			if(!StringUtils.isEmpty(json)){
				return LostResult.ok();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	/*
	 * 删除失物信息级联删除启事信息和评论信息
	 */
	@Override
	public LostResult deleteLost(Long lostId) {
		try {
			// 获取服务层信息
			String jsons = HttpClientUtil.doGet(REST_BASE_URL + REST_DELETE_LOST + lostId);
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
	 * 根据物品ID发送邮件给用户
	 */
	@Override
	public LostResult sendEmail(Long lostId) {
		try {
			// 获取服务层信息
			String jsons = HttpClientUtil.doGet(REST_BASE_URL + REST_SENDEMAIL_LOST + lostId);
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
	 * 获取所有失物
	 */
	@Override
	public List<TbLost> getAllLost() {
		//从数据层获取
		String jsons = HttpClientUtil.doGet(REST_BASE_URL + REST_ALL_LOST);
		//将字符串转换为对象
		LostResult listLost = LostResult.formatToList(jsons, TbLost.class);
		if(listLost.getStatus() == 200){
			List<TbLost> data = (List<TbLost>) listLost.getData();
			return data;
		}
		return null;
	}

	
	
}
