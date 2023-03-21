package com.kh.everyrecipe.shopping;

import lombok.Getter;
import lombok.ToString;

import org.json.JSONObject;

@Getter
@ToString
public class ItemVo {
    private String title;		// 상품이름
    private String image;		// 섬네일 이미지의 URL
    private int lprice;			// 최저가 정보
    private String link;		// 상품정보 URL
    private int hprice;			// 최고가 정보
    private String mallname;	// 상품을 판매하는 쇼핑몰
    private int productId;		// 네이버 쇼핑의 상품 ID
    private int productType;	// 상품군과 상품종류에 따른 타입 (상품군: 일반상품, 중고상품, 단종상품... / 상품종류: 가격비교 상품...)
    private String maker;		// 제조사
    private String brand;		// 브랜드
    private String category1;	// 대분류
    private String category2;	// 중분류
    private String category3;	// 소분류
    private String category4;	// 세분류

    public ItemVo(JSONObject itemJson) {
        this.title = itemJson.getString("title");
        this.image = itemJson.getString("image");
        this.lprice = itemJson.getInt("lprice");
        this.link = itemJson.getString("link");
        this.hprice = itemJson.getInt("hprice");
        this.mallname = itemJson.getString("mallname");
        this.productId = itemJson.getInt("productId");
        this.productType = itemJson.getInt("productType");
        this.maker = itemJson.getString("maker");
        this.brand = itemJson.getString("brand");
        this.category1 = itemJson.getString("category1");
        this.category2 = itemJson.getString("category2");
        this.category3 = itemJson.getString("category3");
        this.category4 = itemJson.getString("category4");
    }

}
