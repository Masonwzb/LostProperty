package com.lost.portal.service;

import com.lost.common.pojo.LostResult;
import com.lost.common.pojo.PageResult;
import com.lost.customPojo.DetLost;
import com.lost.pojo.TbLost;

public interface LostService {

	//根据时间查询失物
	public PageResult getLostByTime(int page, int size);
	//根据条件查询失物
	public PageResult getLostByCondition(DetLost detLost,int page,int size);
	//添加失物信息
	public LostResult addLostInfo(TbLost tbLost);
	//根据Id查询失物信息
	public DetLost getLostById(Long lostId);
	//验证密码是否正确
	public LostResult getValidatePwd(TbLost tbLost);
	
}
