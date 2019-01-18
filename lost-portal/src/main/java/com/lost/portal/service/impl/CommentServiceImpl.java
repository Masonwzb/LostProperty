package com.lost.portal.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.lost.common.pojo.LostResult;
import com.lost.common.pojo.PageResult;
import com.lost.common.utils.HttpClientUtil;
import com.lost.common.utils.JsonUtils;
import com.lost.pojo.TbComment;
import com.lost.portal.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService{

	@Value("${REST_BASE_URL}")
	private String REST_BASE_URL;
	@Value("${REST_GET_COMMENT}")
	private String REST_GET_COMMENT;
	@Value("${REST_ADD_COMMENT}")
	private String REST_ADD_COMMENT;

	/*
	 * 根据物品ID查询评论信息分页显示
	 */
	@Override
	public PageResult getCommentById(Long goodsId, int page, int size) {
		// 获取服务层的数据
		//参数设置
		Map<String,String> param = new HashMap<String, String>();
		param.put("page", page+"");
		param.put("size", size+"");
		
		try {
			String jsons = HttpClientUtil.doGet(REST_BASE_URL + REST_GET_COMMENT + goodsId, param);
			//将字符串转换为对象
			LostResult lostResult = LostResult.formatToPojo(jsons, PageResult.class);
			if(lostResult.getStatus() == 200){
				PageResult data = (PageResult) lostResult.getData();
				return data;
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/*
	 * 添加评论
	 */
	@Override
	public LostResult addComment(TbComment comment) {
		// 将对象转换为json数据
		String json = JsonUtils.objectToJson(comment);
		
		try {
			//从服务层获取数据
			String jsons = HttpClientUtil.doPostJson(REST_BASE_URL + REST_ADD_COMMENT, json);
			//判空
			if(!StringUtils.isEmpty(jsons)){
				return LostResult.ok();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	
}
