package com.lost.rest.service;

import com.lost.common.pojo.LostResult;

public interface TextService {

	//增加浏览次数
	public LostResult getUpdatedText(Long goods_id);
	
}
