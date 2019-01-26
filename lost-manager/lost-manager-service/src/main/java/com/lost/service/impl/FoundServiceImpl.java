package com.lost.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.lost.common.pojo.LostResult;
import com.lost.common.pojo.PageResult;
import com.lost.customMapper.DetFoundMapper;
import com.lost.customPojo.DetFound;
import com.lost.mapper.TbCommentMapper;
import com.lost.mapper.TbFoundMapper;
import com.lost.mapper.TbTextinfoMapper;
import com.lost.pojo.TbCommentExample;
import com.lost.pojo.TbFound;
import com.lost.pojo.TbTextinfoExample;
import com.lost.service.FoundService;
@Service
public class FoundServiceImpl implements FoundService{

	@Autowired
	private TbFoundMapper foundMapper;
	@Autowired
	private DetFoundMapper detFoundMapper;
	@Autowired 
	private TbTextinfoMapper textInfoMapper;
	@Autowired
	private TbCommentMapper commentMapper;
	
	//查询所有招领物
	@Override
	public List<TbFound> getAllFound() {
		return foundMapper.selectByExample(null);
	}

	//查询所有明细招领物
	@Override
	public List<DetFound> getAllDetailFound() {
		return detFoundMapper.selectAllDetailFound();
	}

	//分页所有明细招领物
	@Override
	public PageResult pageFound(int page, int size) {
		//分页
		PageHelper.startPage(page, size);
		//按条件查询
		Page<DetFound> page1 = (Page<DetFound>) detFoundMapper.selectAllDetailFound();
		return new PageResult(page1.getTotal(), page1.getResult());
	}

	/*
	 * 分页条件查询所有明细招领物
	 */
	@Override
	public PageResult pageFound(DetFound detFound, int page, int size) {
		//分页
		PageHelper.startPage(page, size);
		//按条件查询
		Page<DetFound> page1 =  (Page<DetFound>) detFoundMapper.selectConditionFound(detFound);
		return new PageResult(page1.getTotal(), page1.getResult());
	}

	
	/*
	 * 批量删除招领物
	 */
	@Override
	public LostResult deleteFound(Long[] ids) {
		for (Long id : ids) {
			foundMapper.deleteByPrimaryKey(id);
			
			//删除启事信息
			//根据物品ID删除
			TbTextinfoExample example = new TbTextinfoExample();
			com.lost.pojo.TbTextinfoExample.Criteria createCriteria = example.createCriteria();
			createCriteria.andGoodsIdEqualTo(id);
			textInfoMapper.deleteByExample(example);
			
			//删除评论信息
			//根据物品ID删除
			TbCommentExample example2 = new TbCommentExample();
			com.lost.pojo.TbCommentExample.Criteria createCriteria2 = example2.createCriteria();
			createCriteria2.andGoodsIdEqualTo(id);
			commentMapper.deleteByExample(example2);
		}
		return LostResult.ok();
	}

}
