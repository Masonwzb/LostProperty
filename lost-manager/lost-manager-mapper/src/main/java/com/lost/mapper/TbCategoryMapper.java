package com.lost.mapper;

import com.lost.pojo.TbCategory;
import com.lost.pojo.TbCategoryExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbCategoryMapper {
    int countByExample(TbCategoryExample example);

    int deleteByExample(TbCategoryExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbCategory record);

    int insertSelective(TbCategory record);

    List<TbCategory> selectByExample(TbCategoryExample example);

    TbCategory selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbCategory record, @Param("example") TbCategoryExample example);

    int updateByExample(@Param("record") TbCategory record, @Param("example") TbCategoryExample example);

    int updateByPrimaryKeySelective(TbCategory record);

    int updateByPrimaryKey(TbCategory record);
}