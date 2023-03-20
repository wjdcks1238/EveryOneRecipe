package com.kh.everyrecipe.post.ck;

import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.google.gson.Gson;

@PropertySource("classpath:apiKeys.properties")
@Controller
public class CkeditorImageFileUploadController {
	@Value("${cloudinary.name}") String apiName;
	@Value("${cloudinary.key}") String apiKey;
	@Value("${cloudinary.secret}") String apiSecret;
	@Value("${cloudinary.url}") String apiUrl;
	
	@PostMapping("/upload.do")
	@ResponseBody
	public String fileUpload(
				MultipartHttpServletRequest multiFile
			) {
		Map<String, String> map = null;
		System.out.println("out");
		Gson gson = new Gson();
		InputStream in = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		if(file != null) {
			if(file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
				if(file.getContentType().toLowerCase().startsWith("image/")) { //이미지 파일만 검색
					try {
						String originalFileName = file.getOriginalFilename();
						File f = Files.createTempFile("temp",file.getOriginalFilename()).toFile();
						file.transferTo(f);
						
						Map<String, String> config = new HashMap<String, String>();
						config.put("cloud_name", apiName);
						config.put("api_key", apiKey);
						config.put("api_secret", apiSecret);
						Cloudinary cloudinary = new Cloudinary(config);
						
						Map uploadResult = cloudinary.uploader().upload(f, ObjectUtils.emptyMap());
						
						System.out.println("==============================================");
						System.out.println(uploadResult.get("url"));
						
						map = new HashMap<String, String>();
						
						map.put("uploaded", "1");
						map.put("fileName", originalFileName);
						map.put("url", uploadResult.get("url").toString());
						return gson.toJson(map);
					} catch(Exception e) {
						e.printStackTrace();
					} 
				}
			}
		}
		return "fail";
	}
}
