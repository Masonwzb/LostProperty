package com.lost.mapper;

import com.lost.pojo.TbLost;
import com.lost.pojo.TbLostExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbLostMapper {
	
	//自定义开始
	
	List<TbLost> selectByTime();
		
	//自定义结束
	 
    int countByExample(TbLostExample example);

    int deleteByExample(TbLostExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbLost record);

    int insertSelective(TbLost record);

    List<TbLost> selectByExampleWithBLOBs(TbLostExample example);

    List<TbLost> selectByExample(TbLostExample example);

    TbLost selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbLost record, @Param("example") TbLostExample example);

    int updateByExampleWithBLOBs(@Param("record") TbLost record, @Param("example") TbLostExample example);

    int updateByExample(@Param("record") TbLost record, @Param("example") TbLostExample example);

    int updateByPrimaryKeySelective(TbLost record);

    int updateByPrimaryKeyWithBLOBs(TbLost record);

    int updateByPrimaryKey(TbLost record);
}