package com.lost.portal.service;

import com.lost.common.pojo.PageResult;
import com.lost.customPojo.DetFound;
import com.lost.customPojo.DetLost;

public interface FoundService {

	//根据时间查询失物
	public PageResult getFoundByTime(int page, int size);
	//根据条件查询失物 
	public PageResult getFoundByCondition(DetFound detFound,int page,int size);
}
