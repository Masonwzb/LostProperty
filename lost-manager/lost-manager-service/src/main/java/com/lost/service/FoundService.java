package com.lost.service;

import java.util.List;

import com.lost.common.pojo.LostResult;
import com.lost.common.pojo.PageResult;
import com.lost.customPojo.DetFound;
import com.lost.customPojo.DetLost;
import com.lost.pojo.TbFound;

public interface FoundService {

	//查询所有招领物
		public List<TbFound> getAllFound();
		
		//查询所有明细招领物
		public List<DetFound> getAllDetailFound();
		
		//分页所有明细招领物
		public PageResult pageFound(int page,int size);
		
		//分页条件查询所有明细招领物
		public PageResult pageFound(DetFound detFound,int page,int size);
		
		//批量删除招领物
		public LostResult deleteFound(Long[] ids);
		
		//根据ID查询明细招领
		public DetFound getDetFoundById(Long foundId);
		
		//更新招领审核状态
		public LostResult updateFoundStatus(Long found,int status);
}
