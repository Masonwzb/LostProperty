package com.lost.mapper;

import com.lost.pojo.TbThanks;
import com.lost.pojo.TbThanksExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbThanksMapper {
    int countByExample(TbThanksExample example);

    int deleteByExample(TbThanksExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbThanks record);

    int insertSelective(TbThanks record);

    List<TbThanks> selectByExampleWithBLOBs(TbThanksExample example);

    List<TbThanks> selectByExample(TbThanksExample example);

    TbThanks selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbThanks record, @Param("example") TbThanksExample example);

    int updateByExampleWithBLOBs(@Param("record") TbThanks record, @Param("example") TbThanksExample example);

    int updateByExample(@Param("record") TbThanks record, @Param("example") TbThanksExample example);

    int updateByPrimaryKeySelective(TbThanks record);

    int updateByPrimaryKeyWithBLOBs(TbThanks record);

    int updateByPrimaryKey(TbThanks record);
}