package com.lost.portal.service;

import com.lost.common.pojo.PageResult;
import com.lost.customPojo.DetLost;

public interface LostService {

	//根据时间查询失物
	public PageResult getLostByTime(int page, int size);
	//根据条件查询失物
	public PageResult getLostByCondition(DetLost detLost,int page,int size);
}
