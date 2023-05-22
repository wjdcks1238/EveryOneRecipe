package com.kh.everyrecipe.fileutil;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

@Component("fileUtil")
@PropertySource("classpath:apiKeys.properties")
public class FileUtil {
	@Value("${cloudinary.name}")
	private String apiName;
	@Value("${cloudinary.key}")
	private String apiKey;
	@Value("${cloudinary.secret}")
	private String apiSecret;
	@Value("${cloudinary.url}")
	private String apiUrl;
	

	public Map<String, String> saveFile(
			MultipartFile multi
			) throws Exception{
		Map<String, String> map = null;
		
		if(!multi.isEmpty()) {
			
			try {
				String originalFileName = multi.getOriginalFilename();
				
				File f = Files.createTempFile("temp", multi.getOriginalFilename()).toFile();
				multi.transferTo(f);
				
				Map<String, String> config = new HashMap<String, String>();
				config.put("cloud_name", apiName);
				config.put("api_key", apiKey);
				config.put("api_secret", apiSecret);
				Cloudinary cloudinary = new Cloudinary(config);
				
				Map uploadResult = cloudinary.uploader().upload(f, ObjectUtils.emptyMap());
				map = new HashMap<String, String>();
				map.put("original", originalFileName);
				map.put("url", uploadResult.get("url").toString());
			} catch(Exception e) {
				System.out.println("업로드 실패");
				e.printStackTrace();
			}
		} 
		return map;
	}
	
	
}
