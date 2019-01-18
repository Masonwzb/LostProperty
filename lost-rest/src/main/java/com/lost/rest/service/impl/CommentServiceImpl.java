package com.lost.rest.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.lost.common.pojo.LostResult;
import com.lost.common.pojo.PageResult;
import com.lost.common.utils.IDUtils;
import com.lost.mapper.TbCommentMapper;
import com.lost.pojo.TbComment;
import com.lost.pojo.TbCommentExample;
import com.lost.pojo.TbCommentExample.Criteria;
import com.lost.rest.service.CommentService;
@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private TbCommentMapper commentMapper;
	
	/*
	 * 根据物品ID查询评论信息并分页显示
	 */
	@Override
	public LostResult getAllComment(Long goodsId, int page, int size) {
		// 分页
		PageHelper.startPage(page, size);
		//根据物品ID查询评论信息
		TbCommentExample example = new TbCommentExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andGoodsIdEqualTo(goodsId);
		//设置集合结果排序顺序
		example.setOrderByClause("comment_time DESC");
		
		Page<TbComment> page1 = (Page<TbComment>) commentMapper.selectByExampleWithBLOBs(example);
		//分页处理
		PageResult result = new PageResult(page1.getTotal(),page1.getResult());
		return LostResult.ok(result) ;
	}

	/*
	 * 添加评论
	 */
	@Override
	public LostResult addComment(TbComment comment) {
		// 补全评论信息
		comment.setId(IDUtils.generateCommentId());
		comment.setCommentTime(new Date());
		comment.setCreated(new Date());
		comment.setUpdated(new Date());
		
		//加入数据
		commentMapper.insert(comment);
		
		return LostResult.ok();
	}

}
