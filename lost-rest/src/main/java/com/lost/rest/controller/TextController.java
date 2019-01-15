package com.lost.rest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lost.common.pojo.LostResult;
import com.lost.rest.service.TextService;

@RestController
@RequestMapping("/text")
public class TextController {

	@Autowired
	private TextService textService;
	
	/*
	 * 增加浏览次数
	 */
	@RequestMapping("/update/{goods_id}")
	public LostResult addPageView(@PathVariable Long goods_id){
		LostResult result = textService.getUpdatedText(goods_id);
		return result;
	}
	
}
