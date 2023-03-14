package com.kh.teamproject.fileutil;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class FileUtil {
	
	public List<Map<String, String>> saveFileList(
			MultipartHttpServletRequest multiReq
			, HttpServletRequest request
			, String addedPath) throws Exception{
		List<Map<String, String>> result = new ArrayList<Map<String,String>>();
		
		Iterator<String> iterator = multiReq.getFileNames();
		
		while(iterator.hasNext()) {
			String name = iterator.next();
			MultipartFile multiFile = multiReq.getFile(name);
			
			Map<String, String> map = new HashMap<String, String>();
			map = saveFile(multiFile, request, addedPath);
			result.add(map);
		}
		
		return result;
	}

	private Map<String, String> saveFile(
			MultipartFile multi
			, HttpServletRequest request
			, String addedPath
			) throws Exception{
		Map<String, String> result = null;
		String renameFilePath = null;
		String renameByTime = null;
		
		if(multi != null && multi.equals("")) {
			result = new HashMap<String, String>();
			
			String originalFileName = multi.getOriginalFilename();
			
			//TODO: 추후 CloudFileServer에 파일을 올릴 경우, 경로 관련 하여 설정.
			String WebServerRoot = null;
			String savePath = null;
			
			if(addedPath != null) {
				savePath += addedPath;
			}
			
			File folder = new File(savePath);
			if(!folder.exists()) {
				folder.mkdirs();
			}
			
			renameByTime = System.currentTimeMillis() + "_" + originalFileName;
			
			renameFilePath = null; // TODO:
			multi.transferTo(new File(savePath + "\\" + renameByTime)); //TODO:
			
			result.put("original", originalFileName);
			result.put("rename", renameByTime);
		}
		return result;
	}
	
	
}
