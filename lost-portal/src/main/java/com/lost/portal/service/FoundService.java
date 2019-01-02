package com.lost.portal.service;

import com.lost.common.pojo.LostResult;
import com.lost.common.pojo.PageResult;
import com.lost.customPojo.DetFound;
import com.lost.customPojo.DetLost;
import com.lost.pojo.TbFound;
import com.lost.pojo.TbLost;

public interface FoundService {

	//根据时间查询失物
	public PageResult getFoundByTime(int page, int size);
	//根据条件查询失物 
	public PageResult getFoundByCondition(DetFound detFound,int page,int size);
	//添加招领信息
	public LostResult addFoundInfo(TbFound tbFound);
	//根据Id查询招领信息
	public DetFound getFoundById(Long foundId);

}
