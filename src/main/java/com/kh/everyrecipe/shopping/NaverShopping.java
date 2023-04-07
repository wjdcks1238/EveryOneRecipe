package com.kh.everyrecipe.shopping;


import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.*;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;

@Component
@Configuration
@PropertySource("classpath:apiKeys.properties")
public class NaverShopping {
	@Value("${shop.id}")
	private String shopId;
	@Value("${shop.secret}")
	private String shopSecret;

    public String search(String query) {
    	//API 불러오기
        RestTemplate rest = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.add("X-Naver-Client-Id", shopId);	//Client ID
        headers.add("X-Naver-Client-Secret", shopSecret);	//Client Secret
        String body = "";

        String num = "display=10"; // 출력 할 품목 갯수    
        // 정렬 기준 (sim = 정확도순, date = 날짜순으로 내림차순, asc = 가격 오름차순, dsc = 가격 내림차순)
        String sort = "sort=sim";
        // 검색 시작위치(기본값: 1, 최댓값: 1000)
        String start = "start=1~1000";
        // 검색결과 상품유형(기본값: 모든상품, naverpay: 네이버페이 연동상품)
        String flt = "filter=naverpay";        
        
        HttpEntity<String> requestEntity = new HttpEntity<String>(body, headers);
    	//query = 검색하려는 값. 출력 갯수는 20개, 정렬기준은 정확도순으로 설정
        ResponseEntity<String> responseEntity = rest.exchange("https://openapi.naver.com/v1/search/shop.json?query="
        		+ query + "&" + num + "&" + sort, HttpMethod.GET, requestEntity, String.class);        
        String response = responseEntity.getBody();
        return response;
    }

    public List<ItemVo> JSONtoItems(String result) {
        JSONObject jsonObj = new JSONObject(result);	//문자열 result를 JSONObject로 변경
        JSONArray items = jsonObj.getJSONArray("items"); // JSONArray를 사용하여 items 추출

        List<ItemVo> itemDtoList = new ArrayList<>();

        for(int i = 0; i < items.length(); i++) {     // JSONObject 1개씩 추출
            JSONObject itemJson = items.getJSONObject(i);
            ItemVo itemDto = new ItemVo(itemJson);	//추출한 값을 itemDto에 저장
            itemDtoList.add(itemDto);			 		//itemDtoList에 추가
        }
        return itemDtoList;    // itemDtoList값 반환
    } 
    
}