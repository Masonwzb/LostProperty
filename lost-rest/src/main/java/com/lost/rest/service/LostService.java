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
	//根据ID查询明细失物信息
	public LostResult getDetLostById(Long lostId);
	//验证管理密码是否正确
	public LostResult getPwdValidate(TbLost tbLost);
	//更新失物信息
	public LostResult updateLost(TbLost tbLost);
	//根据ID查询失物
	public LostResult getLostById(Long lostId);
	//删除失物信息并级联删除启事信息和评论信息
	public LostResult deleteLost(Long lostId);
	//获取失物管理密码发送邮件给用户
	public LostResult sendEmail(Long lostId);
	//获取所有的失物信息
	public LostResult getAllLost();
	
}
