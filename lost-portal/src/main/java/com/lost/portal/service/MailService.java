package com.lost.portal.service;

import com.lost.common.pojo.LostResult;

public interface MailService {

	//联系我们
	public LostResult mailUs(String name,String email,String subject,String text);
	
}
