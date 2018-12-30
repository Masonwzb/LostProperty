package com.lost.portal.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.lost.common.utils.JsonUtils;
import com.lost.portal.service.PictureService;

@RestController
public class PictureController {

	@Autowired
	private PictureService pictureService;
	
	@RequestMapping(value = "/pic/upload", method = RequestMethod.POST)
	public String makeImagesUpload(@RequestParam(value = "imagesFile", required = false) MultipartFile uploadFile,
						HttpServletRequest request){
		Map getResult = pictureService.uploadPicture(uploadFile,request);
		String result = JsonUtils.objectToJson(getResult);
		return result;
	}
}
