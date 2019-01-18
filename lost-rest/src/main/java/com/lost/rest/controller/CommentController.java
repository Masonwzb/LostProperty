package com.lost.rest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lost.common.pojo.LostResult;
import com.lost.pojo.TbComment;
import com.lost.rest.service.CommentService;

@RestController
@RequestMapping("/comment")
public class CommentController {

	@Autowired
	private CommentService commentService;
	
	/*
	 * 根据物品ID查询评论信息并分页显示
	 */
	@RequestMapping("/findAll/{goodsId}")
	public LostResult selectCommentByID(@PathVariable Long goodsId, int page, int size){
		LostResult allComment = commentService.getAllComment(goodsId, page, size);
		return allComment;
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
