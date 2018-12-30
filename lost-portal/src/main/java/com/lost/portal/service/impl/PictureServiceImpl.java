package com.lost.portal.service.impl;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.lost.common.utils.IDUtils;
import com.lost.portal.service.PictureService;
@Service
public class PictureServiceImpl implements PictureService {
	
	@Value("${IMAGE_BASE_URL}")
	private String IMAGE_BASE_URL;
	
	/*
	 * 处理图片上传
	 */
	@Override
	public Map uploadPicture(MultipartFile uploadFile, HttpServletRequest request) {
		//创建一个map集合
		Map resultMap = new HashMap<>();
		
		//获取Servlet的运行路径下的imgs文件夹作为上传图片的存储路径
        String imageBaseUrl = request.getSession().getServletContext().getRealPath("/images");
        System.out.println("imageBaseUrl=" + imageBaseUrl);
		//图片上传路径
		String imagePath = new DateTime().toString("/yyyy/MM/dd");
		//文件存储路径
        String uploadRootPath = imageBaseUrl + imagePath;
		
		//检查图片存储路径是否存在，如果不存在，创建路径
        File uploadRootDir = new File(uploadRootPath);
        if(!uploadRootDir.exists()){
            uploadRootDir.mkdirs();	
        }
        
        //获取源文件的文件名
        String oldName = uploadFile.getOriginalFilename();
        //生成新文件名
		String newName = IDUtils.genImageName();
		newName = newName + oldName.substring(oldName.lastIndexOf("."));
		
		//创建目标文件，制定文件存储路径和文件名
        File targetFile = new File(uploadRootPath + "/" + newName);
		
        System.out.println("目标文件路径=ssss========================：" + targetFile);
        if(newName != null && newName.length() > 0){
            try {
            	//将源文件转移到目标文件，使用transferTo方法
            	uploadFile.transferTo(targetFile);
            	
            	 //补上失物images属性
            	resultMap.put("url", IMAGE_BASE_URL + imagePath + "/" + newName);
    			return resultMap;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        //上传失败
        resultMap.put("msg", "文件上传失败！");
		return resultMap;
	}

}
