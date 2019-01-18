package com.lost.rest.service;

import com.lost.common.pojo.LostResult;
import com.lost.pojo.TbComment;

public interface CommentService {

	//根据物品ID查询评论信息并分页显示
	public LostResult getAllComment(Long goodsId, int page, int size);
	//添加评论
	public LostResult addComment(TbComment comment);
}
