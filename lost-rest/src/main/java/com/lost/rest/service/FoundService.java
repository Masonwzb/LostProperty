package com.lost.rest.service;

import java.util.List;

import com.lost.common.pojo.LostResult;
import com.lost.common.pojo.PageResult;
import com.lost.customPojo.DetFound;
import com.lost.customPojo.DetLost;
import com.lost.pojo.TbFound;
import com.lost.pojo.TbLost;

public interface FoundService {

	//根据时间查询招领物
	public LostResult getFoundByTime(int page,int size);
	//根据条件查询招领物
	public LostResult getFoundByCondition(DetFound detFound,int page,int size);
	//添加招领信息
	public LostResult addFound(TbFound tbFound) throws Exception;
	//根据ID查询招领物信息
	public LostResult getFoundById(Long foundId);

}
