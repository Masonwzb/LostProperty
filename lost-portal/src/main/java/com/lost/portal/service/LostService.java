package com.lost.portal.service;

import com.lost.common.pojo.PageResult;

public interface LostService {

	//根据时间查询失物
	public PageResult getLostByTime(int page, int size);
}
