package com.lost.mapper;

import com.lost.pojo.TbTextinfo;
import com.lost.pojo.TbTextinfoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbTextinfoMapper {
    int countByExample(TbTextinfoExample example);

    int deleteByExample(TbTextinfoExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbTextinfo record);

    int insertSelective(TbTextinfo record);

    List<TbTextinfo> selectByExample(TbTextinfoExample example);

    TbTextinfo selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbTextinfo record, @Param("example") TbTextinfoExample example);

    int updateByExample(@Param("record") TbTextinfo record, @Param("example") TbTextinfoExample example);

    int updateByPrimaryKeySelective(TbTextinfo record);

    int updateByPrimaryKey(TbTextinfo record);
}