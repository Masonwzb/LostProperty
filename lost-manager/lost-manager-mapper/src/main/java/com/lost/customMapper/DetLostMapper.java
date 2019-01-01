package com.lost.customMapper;

import java.util.List;

import com.lost.customPojo.DetFound;
import com.lost.customPojo.DetLost;
import com.lost.pojo.TbLost;

public interface DetLostMapper {

	//分页查询所有明细失物
	List<DetLost> selectAllDetailLost();
	//按条件分页查询所有明细失物
	List<DetLost> selectConditionLost(DetLost detLost);
	//根据ID查询明细招领物
	DetLost selectLostById(Long id);
}
