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
import com.lost.customMapper.DetFoundMapper;
import com.lost.customMapper.DetLostMapper;
import com.lost.customPojo.DetFound;
import com.lost.customPojo.DetLost;
import com.lost.mapper.TbCommentMapper;
import com.lost.mapper.TbFoundMapper;
import com.lost.mapper.TbTextinfoMapper;
import com.lost.pojo.TbCommentExample;
import com.lost.pojo.TbFound;
import com.lost.pojo.TbLost;
import com.lost.pojo.TbTextinfo;
import com.lost.pojo.TbTextinfoExample;
import com.lost.pojo.TbTextinfoExample.Criteria;
import com.lost.rest.service.FoundService;
@Service
public class FoundServiceImpl implements FoundService {

	@Autowired
	private TbFoundMapper foundMapper;
	@Autowired
	private DetFoundMapper detFoundMapper;
	@Autowired
	private TbTextinfoMapper textInfoMapper;
	@Autowired
	private TbCommentMapper commentMapper;

	/*
	 * 根据时间查询招领物
	 */
	@Override
	public LostResult getFoundByTime(int page, int size) {
		//分页处理
		PageHelper.startPage(page, size);
		Page<TbFound> page1 = (Page<TbFound>) foundMapper.selectByTime();
		PageResult result = new PageResult(page1.getTotal(),page1.getResult());
		//结果使用FoundResult包装
		return LostResult.ok(result);
		
	}

	/*
	 * 根据条件查询招领物
	 */
	@Override
	public LostResult getFoundByCondition(DetFound detFound, int page, int size) {
		//分页
		PageHelper.startPage(page, size);
		//按条件查询
		Page<DetFound> page1 =  (Page<DetFound>) detFoundMapper.selectConditionFound(detFound);
		PageResult result = new PageResult(page1.getTotal(),page1.getResult());
		//结果使用LostResult包装
		return LostResult.ok(result);
	}

	/*
	 * 添加招领信息
	 */
	@Override
	public LostResult addFound(TbFound tbFound) throws Exception{
		// 补全招领信息
		//设置ID
		Long userId = (long) 2;
		tbFound.setId(IDUtils.generateId());
		
		//添加添加招领详细文章信息
		LostResult result = insertTextInfo(tbFound.getId());
		if(result.getStatus() != 200){
			throw new Exception();
		}
		
		tbFound.setUserId(userId);
		
		//设置日期
		tbFound.setCreated(new Date());
		tbFound.setUpdated(new Date());
		//添加至数据库
		foundMapper.insert(tbFound);
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
	 * 根据ID查询失物信息
	 */
	@Override
	public LostResult getDetFoundById(Long foundId) {
		DetFound detFound = detFoundMapper.selectFoundById(foundId);
		return LostResult.ok(detFound);
	}

	/*
	 * 验证管理密码是否正确
	 */
	@Override
	public LostResult getPwdValidate(TbFound tbFound) {
		// 获取数据库中失物信息
		TbFound databaseLost = foundMapper.selectByPrimaryKey(tbFound.getId());
		//判断密码是否一致
		if(databaseLost.getPassword().equals(tbFound.getPassword())){
			return LostResult.ok();
		}else{
			//如果不一致
			LostResult lostResult = new LostResult(404, "ERROR", null);
			return lostResult;
		}
	}

	/*
	 * 更新招领物信息
	 */
	@Override
	public LostResult updateFound(TbFound tbFound) {
		// 补全更新信息
		tbFound.setUpdated(new Date());
		
		try {
			 foundMapper.updateByPrimaryKeySelective(tbFound);
			 return LostResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	/*
	 * 根据ID查询招领物
	 */
	@Override
	public LostResult getFoundById(Long foundId) {
		//根据ID查询
		TbFound found = foundMapper.selectByPrimaryKey(foundId);
		
		return LostResult.ok(found);
	}

	/*
	 * 删除招领信息并级联删除启事信息和评论信息
	 */
	@Override
	public LostResult deleteFound(Long foundId) {
		try {
			//删除失物信息
			foundMapper.deleteByPrimaryKey(foundId);
			
			//删除启事信息
			//根据物品ID删除
			TbTextinfoExample example = new TbTextinfoExample();
			Criteria createCriteria = example.createCriteria();
			createCriteria.andGoodsIdEqualTo(foundId);
			textInfoMapper.deleteByExample(example);
			
			//删除评论信息
			//根据物品ID删除
			TbCommentExample example2 = new TbCommentExample();
			com.lost.pojo.TbCommentExample.Criteria createCriteria2 = example2.createCriteria();
			createCriteria2.andGoodsIdEqualTo(foundId);
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
	public LostResult sendEmail(Long foundId) {
		// 根据ID获取失物进而获取管理密码
		TbFound found = foundMapper.selectByPrimaryKey(foundId);
		
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
			helper.setTo(found.getEmail());
			helper.setFrom("156669011@qq.com");
			helper.setSubject("找回信息管理密码-嘉园失物招领");
			helper.setText("<div>您好！欢迎使用嘉园失物招领平台！<br/><br/>"
					+ "您发布的信息编码为："+ foundId +"<br/>"
					+ "信息管理密码为："+ found.getPassword() +"</div><br/><br/>"
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
	
	/*
	 * 	获取所有的招领物信息
	 */
	@Override
	public LostResult getAllFound() {
		// 获取数据库
		List<TbFound> found = foundMapper.selectByExample(null);
		return LostResult.ok(found);
	}


}
