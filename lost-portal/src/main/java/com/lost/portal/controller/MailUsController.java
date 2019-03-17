package com.lost.portal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lost.common.pojo.LostResult;
import com.lost.portal.service.MailService;

@RestController
@RequestMapping("/mail")
public class MailUsController {

	@Autowired
	private MailService mailService;
	
	@RequestMapping("/toUs")
	public LostResult mailUs(String name, String email, String subject, String text){
		return mailService.mailUs(name, email, subject, text);
	}
	
}
