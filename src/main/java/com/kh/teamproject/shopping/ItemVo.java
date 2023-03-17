package com.kh.teamproject.shopping;

import lombok.Getter;
import lombok.ToString;

import org.json.JSONObject;

@Getter
@ToString
public class ItemVo {
    private String title;
    private String image;
    private int lprice;
    private String link;

    public ItemVo(JSONObject itemJson) {
        this.title = itemJson.getString("title");
        this.image = itemJson.getString("image");
        this.lprice = itemJson.getInt("lprice");
        this.link = itemJson.getString("link");
    }

}
