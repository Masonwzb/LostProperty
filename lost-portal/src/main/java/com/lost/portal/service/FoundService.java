package com.lost.portal.service;

import java.util.List;

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
	//根据Id查询明细招领信息
	public DetFound getDetFoundById(Long foundId);
	//验证密码是否正确
	public LostResult getValidatePwd(TbFound tbFound);
	//根据Id查询失物信息
	public TbFound getFoundById(Long foundId);
	//更新失物信息
	public LostResult updateFound(TbFound tbFound);
	//删除招领信息级联删除启事信息和评论信息
	public LostResult deleteFound(Long foundId);
	//根据物品ID发送邮件给用户
	public LostResult sendEmail(Long foundId);
	//获取所有失物
	public List<TbFound> getAllFound();

}
