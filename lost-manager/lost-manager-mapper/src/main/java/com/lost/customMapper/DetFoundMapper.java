package com.lost.customMapper;

import java.util.List;

import com.lost.customPojo.DetFound;

public interface DetFoundMapper {

	//分页查询所有明细招领物
	List<DetFound> selectAllDetailFound();
	//按条件分页查询所有明细招领物
	List<DetFound> selectConditionFound(DetFound detFound);
	//根据ID查询明细招领物
	DetFound selectFoundById(Long id);
}
