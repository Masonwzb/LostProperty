package com.lost.portal.service;

import com.lost.common.pojo.PageResult;

public interface FoundService {

	//根据时间查询失物
	public PageResult getFoundByTime(int page, int size);
}
