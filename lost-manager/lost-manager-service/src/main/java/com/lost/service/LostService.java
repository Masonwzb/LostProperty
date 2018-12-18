package com.lost.service;

import java.util.List;

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
}
