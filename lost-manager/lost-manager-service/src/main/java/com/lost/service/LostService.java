package com.lost.service;

import java.util.List;
import java.util.Map;

import com.lost.common.pojo.LostResult;
import com.lost.common.pojo.PageResult;
import com.lost.customPojo.DetLost;
import com.lost.pojo.TbLost;


public interface LostService {

	//查询所有失物
	public List<TbLost> getAllLost();
	
	//查询所有明细失物
	public List<DetLost> getAllDetailLost();
	
	//分页所有明细失物
	public PageResult pageLost(int page,int size);
	
	//分页条件查询所有明细失物
	public PageResult pageLost(DetLost detLost,int page,int size);
	
	//批量删除失物
	public LostResult deleteLost(Long[] ids);
	
	//数据统计
	public Map<String, String> LostStatistics();
	
	//根据ID查询明细失物
	public DetLost getDetLostById(Long lostId);
	
	//更新寻物审核状态
	public LostResult updateLostStatus(Long lostId,int status);
	
	//统计未审核数据
	public Map<String, String> unaudited();
	
}
