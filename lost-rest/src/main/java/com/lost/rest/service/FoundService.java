package com.lost.rest.service;

import java.util.List;

import com.lost.common.pojo.LostResult;
import com.lost.common.pojo.PageResult;
import com.lost.pojo.TbLost;

public interface FoundService {

	//根据时间查询失物
	public LostResult getFoundByTime(int page,int size);
}
