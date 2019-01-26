package com.lost.rest.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.lost.common.pojo.LostResult;
import com.lost.common.pojo.PageResult;
import com.lost.common.utils.IDUtils;
import com.lost.customMapper.DetLostMapper;
import com.lost.customPojo.DetLost;
import com.lost.mapper.TbCommentMapper;
import com.lost.mapper.TbLostMapper;
import com.lost.mapper.TbTextinfoMapper;
import com.lost.pojo.TbCommentExample;
import com.lost.pojo.TbLost;
import com.lost.pojo.TbLostExample;
import com.lost.pojo.TbTextinfo;
import com.lost.pojo.TbTextinfoExample;
import com.lost.pojo.TbTextinfoExample.Criteria;
import com.lost.rest.service.LostService;
@Service
public class LostServiceImpl implements LostService {

	@Autowired
	private TbLostMapper lostMapper;
	@Autowired
	private DetLostMapper detLostMapper;
	@Autowired
	private TbTextinfoMapper textInfoMapper;
	@Autowired
	private TbCommentMapper commentMapper;

	/*
	 * 根据时间查询失物
	 */
	@Override
	public LostResult getLostByTime(int page, int size) {
		//分页处理
		PageHelper.startPage(page, size);
		Page<TbLost> page1 = (Page<TbLost>) lostMapper.selectByTime();
		PageResult result = new PageResult(page1.getTotal(),page1.getResult());
		//结果使用LostResult包装
		return LostResult.ok(result);
		
	}

	/*
	 * 根据条件查询失物
	 */
	@Override
	public LostResult getLostByCondition(DetLost detLost, int page, int size) {
		//分页
		PageHelper.startPage(page, size);
		//按条件查询
		Page<DetLost> page1 =  (Page<DetLost>) detLostMapper.selectConditionLost(detLost);
		PageResult result = new PageResult(page1.getTotal(),page1.getResult());
		//结果使用LostResult包装
		return LostResult.ok(result);
	}

	/*
	 * 添加失物信息
	 */
	@Override
	public LostResult addLost(TbLost tbLost) throws Exception{
		// 补全失物信息
		//设置ID
		Long userId = (long) 2;
		tbLost.setId(IDUtils.generateId());
		
		//添加添加失物详细文章信息
		LostResult result = insertTextInfo(tbLost.getId());
		if(result.getStatus() != 200){
			throw new Exception();
		}
		
		tbLost.setUserId(userId);
		
		//设置日期
		tbLost.setCreated(new Date());
		tbLost.setUpdated(new Date());
		//添加至数据库
		lostMapper.insert(tbLost);
		return LostResult.ok();
	}
	
	/*
	 * 添加失物详细文章信息
	 */
	private LostResult insertTextInfo(Long goods_id){
		TbTextinfo text = new TbTextinfo();
		text.setGoodsId(goods_id);
		text.setPublishTime(new Date());
		text.setPageView(0);
		text.setStatus(0);
		text.setCreated(new Date());
		text.setUpdated(new Date());
		textInfoMapper.insert(text);
		return LostResult.ok();
	}
	

	/*
	 * 根据ID查询明细失物信息
	 */
	@Override
	public LostResult getDetLostById(Long lostId) {
		DetLost detlost = detLostMapper.selectLostById(lostId);
		return LostResult.ok(detlost);
	}

	/*
	 * 验证管理密码是否正确
	 */
	@Override
	public LostResult getPwdValidate(TbLost tbLost) {
		// 获取数据库中失物信息
		TbLost databaseLost = lostMapper.selectByPrimaryKey(tbLost.getId());
		//判断密码是否一致
		if(databaseLost.getPassword().equals(tbLost.getPassword())){
			return LostResult.ok();
		}else{
			//如果不一致
			LostResult lostResult = new LostResult(404, "ERROR", null);
			return lostResult;
		}
	}

	/*
	 * 更新失物信息
	 */
	@Override
	public LostResult updateLost(TbLost tbLost) {
		// 补全更新信息
		tbLost.setUpdated(new Date());
		
		try {
			 lostMapper.updateByPrimaryKeySelective(tbLost);
			 return LostResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	/*
	 * 根据ID查询失物
	 */
	@Override
	public LostResult getLostById(Long lostId) {
		//根据ID查询
		TbLost lost = lostMapper.selectByPrimaryKey(lostId);
		
		return LostResult.ok(lost);
	}

	/*
	 * 删除失物信息并级联删除启事信息和评论信息
	 */
	@Override
	public LostResult deleteLost(Long lostId) {
		
		try {
			//删除失物信息
			lostMapper.deleteByPrimaryKey(lostId);
			
			//删除启事信息
			//根据物品ID删除
			TbTextinfoExample example = new TbTextinfoExample();
			Criteria createCriteria = example.createCriteria();
			createCriteria.andGoodsIdEqualTo(lostId);
			textInfoMapper.deleteByExample(example);
			
			//删除评论信息
			//根据物品ID删除
			TbCommentExample example2 = new TbCommentExample();
			com.lost.pojo.TbCommentExample.Criteria createCriteria2 = example2.createCriteria();
			createCriteria2.andGoodsIdEqualTo(lostId);
			commentMapper.deleteByExample(example2);
			
			return LostResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	/*
	 * 获取失物管理密码发送邮件给用户
	 */
	@Override
	public LostResult sendEmail(Long lostId) {
		// 根据ID获取失物进而获取管理密码
		TbLost lost = lostMapper.selectByPrimaryKey(lostId);
		
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
			helper.setTo(lost.getEmail());
			helper.setFrom("156669011@qq.com");
			helper.setSubject("找回信息管理密码-嘉园失物招领");
			helper.setText("<div>您好！欢迎使用嘉园失物招领平台！<br/><br/>"
					+ "您发布的信息编码为："+ lostId +"<br/>"
					+ "信息管理密码为："+ lost.getPassword() +"</div><br/><br/>"
					+ "本邮件为系统自动发送，请勿回复，谢谢！"
					+ "<br/>嘉园失物招领平台，让失物招领变得更简单，一个公益性平台，"
					+ "如果您有好的建议或者意见，或者想参与失物招领平台建设，请联系我们，你就是下一个受益者！", true);
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
