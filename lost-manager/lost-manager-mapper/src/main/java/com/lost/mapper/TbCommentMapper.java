package com.lost.mapper;

import com.lost.pojo.TbComment;
import com.lost.pojo.TbCommentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbCommentMapper {
    int countByExample(TbCommentExample example);

    int deleteByExample(TbCommentExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbComment record);

    int insertSelective(TbComment record);

    List<TbComment> selectByExampleWithBLOBs(TbCommentExample example);

    List<TbComment> selectByExample(TbCommentExample example);

    TbComment selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbComment record, @Param("example") TbCommentExample example);

    int updateByExampleWithBLOBs(@Param("record") TbComment record, @Param("example") TbCommentExample example);

    int updateByExample(@Param("record") TbComment record, @Param("example") TbCommentExample example);

    int updateByPrimaryKeySelective(TbComment record);

    int updateByPrimaryKeyWithBLOBs(TbComment record);

    int updateByPrimaryKey(TbComment record);
}