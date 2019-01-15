package com.lost.rest.service;

import java.util.List;

import com.lost.common.pojo.LostResult;
import com.lost.common.pojo.PageResult;
import com.lost.customPojo.DetLost;
import com.lost.pojo.TbLost;

public interface LostService {

	//根据时间查询失物
	public LostResult getLostByTime(int page,int size);
	//根据条件查询失物
	public LostResult getLostByCondition(DetLost detLost,int page,int size);
	//添加失物信息
	public LostResult addLost(TbLost tbLost) throws Exception;
	//根据ID查询失物信息
	public LostResult getLostById(Long lostId);
	
}
