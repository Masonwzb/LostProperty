package com.lost.portal.service.impl;

import java.util.Properties;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.lost.common.pojo.LostResult;
import com.lost.pojo.TbLost;
import com.lost.portal.service.MailService;
@Service
public class MailServiceImpl implements MailService {

	@Override
	public LostResult mailUs(String name, String email, String subject, String text) {
				
				//将密码发送给用户
				try {
					JavaMailSenderImpl senderImpl   = new JavaMailSenderImpl();
					 // 设定mail server  		    
					senderImpl.setHost( "smtp.qq.com" );
					 // 建立邮件消息  
					MimeMessage mimeMessage = senderImpl.createMimeMessage();
					MimeMessageHelper helper = new MimeMessageHelper(mimeMessage,true,"UTF-8");
					// 设置收件人，寄件人 用数组发送多个邮件
					// String[] array = new String[]    {"sun111@163.com","sun222@sohu.com"};    
					// mailMessage.setTo(array); bineawu@163.com
					helper.setTo("bineawu@163.com");
					helper.setFrom("嘉园失物招领网站<156669011@qq.com>");
					helper.setSubject("用户建议与问题-嘉园失物招领");
					helper.setText("<div>您好！嘉园失物招领平台管理员！<br/><br/>"
							+ "姓名："+ name +"<br/>"
							+ "邮箱："+ email +"<br/>"
							+ "主题："+ subject +"<br/>"
							+"内容：" + text + "</div>", true);
					//  根据自己的情况,设置username
					senderImpl.setUsername("156669011@qq.com");
					//  根据自己的情况, 设置password
					senderImpl.setPassword("llwfeerpbmwsbibe");
					Properties prop = new Properties();
					prop.put("mail.smtp.auth", "true");
					prop.put("mail.smtp.timeout ", "25000");
					senderImpl.setJavaMailProperties(prop);
					//发送邮件
					senderImpl.send(mimeMessage);
					
					return LostResult.ok();
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				return null;
	}

}
