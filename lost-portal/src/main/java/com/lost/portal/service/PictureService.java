package com.lost.portal.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface PictureService {
	
	//处理图片上传
	Map uploadPicture(MultipartFile uploadFile, HttpServletRequest request);
}
