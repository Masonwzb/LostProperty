package com.lost.mapper;

import com.lost.pojo.TbAboutus;
import com.lost.pojo.TbAboutusExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbAboutusMapper {
    int countByExample(TbAboutusExample example);

    int deleteByExample(TbAboutusExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbAboutus record);

    int insertSelective(TbAboutus record);

    List<TbAboutus> selectByExampleWithBLOBs(TbAboutusExample example);

    List<TbAboutus> selectByExample(TbAboutusExample example);

    TbAboutus selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbAboutus record, @Param("example") TbAboutusExample example);

    int updateByExampleWithBLOBs(@Param("record") TbAboutus record, @Param("example") TbAboutusExample example);

    int updateByExample(@Param("record") TbAboutus record, @Param("example") TbAboutusExample example);

    int updateByPrimaryKeySelective(TbAboutus record);

    int updateByPrimaryKeyWithBLOBs(TbAboutus record);

    int updateByPrimaryKey(TbAboutus record);
}