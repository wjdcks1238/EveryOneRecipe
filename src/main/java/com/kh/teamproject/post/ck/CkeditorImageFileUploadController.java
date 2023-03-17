package com.kh.teamproject.post.ck;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;

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
				  HttpServletRequest req
				, HttpServletResponse resp
				, MultipartHttpServletRequest multiFile
			) throws Exception {
		System.out.println("out");
		Gson gson = new Gson();
		Gson gsonBuilder = new GsonBuilder().create();
		JsonObject json = new JsonObject();
		String jsonString = null;
		PrintWriter printWriter = null;
		InputStream in = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		if(file != null) {
			if(file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
				if(file.getContentType().toLowerCase().startsWith("image/")) {
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
						
						System.out.println("출력 : " + uploadResult.get("url"));
						System.out.println(uploadResult.get("url"));
						
						json.addProperty("uploaded", 1);
						json.addProperty("fileName", originalFileName);
						json.addProperty("url", );
						jsonString = gson.toJson(json);
						
						printWriter.println(json);
					} catch(Exception e) {
						
					} finally {
						if(out != null) {
							out.close();
						}
					}
				}
			}
		}
		
		return jsonString;
	}
}
