package com.lost.customMapper;

import java.util.List;

import com.lost.customPojo.DetFound;

public interface DetFoundMapper {

	//分页查询所有明细失物
		List<DetFound> selectAllDetailFound();
		//按条件分页查询所有明细失物
		List<DetFound> selectConditionFound(DetFound detFound);
}
