package com.lost.mapper;

import com.lost.pojo.TbFound;
import com.lost.pojo.TbFoundExample;
import com.lost.pojo.TbLost;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbFoundMapper {
	
	//自定义开始
	
	List<TbFound> selectByTime();
		
	//自定义结束
	
    int countByExample(TbFoundExample example);

    int deleteByExample(TbFoundExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbFound record);

    int insertSelective(TbFound record);

    List<TbFound> selectByExampleWithBLOBs(TbFoundExample example);

    List<TbFound> selectByExample(TbFoundExample example);

    TbFound selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbFound record, @Param("example") TbFoundExample example);

    int updateByExampleWithBLOBs(@Param("record") TbFound record, @Param("example") TbFoundExample example);

    int updateByExample(@Param("record") TbFound record, @Param("example") TbFoundExample example);

    int updateByPrimaryKeySelective(TbFound record);

    int updateByPrimaryKeyWithBLOBs(TbFound record);

    int updateByPrimaryKey(TbFound record);
}