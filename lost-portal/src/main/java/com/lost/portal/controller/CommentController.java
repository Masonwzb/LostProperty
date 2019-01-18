package com.lost.portal.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lost.common.pojo.LostResult;
import com.lost.common.pojo.PageResult;
import com.lost.pojo.TbComment;
import com.lost.portal.service.CommentService;

@RestController
@RequestMapping("/comment")
public class CommentController {

	@Autowired
	private CommentService commentService;
	
	/*
	 * 根据物品ID查询评论信息分页显示
	 */
	@RequestMapping("/findAll/{goodsId}")
	public PageResult selectCommentById(@PathVariable Long goodsId, int page, int size){
		PageResult result = commentService.getCommentById(goodsId, page, size);
		return result;
	}
	
	/*
	 * 添加评论
	 */
	@RequestMapping("/add")
	public LostResult createdComment(@RequestBody TbComment comment){
		LostResult result = commentService.addComment(comment);
		return result;
	}
	
	
}
