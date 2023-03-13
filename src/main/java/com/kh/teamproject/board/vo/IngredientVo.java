package com.kh.teamproject.board.vo;

import org.springframework.stereotype.Component;

@Component
public class IngredientVo {
	
	private int postId;
	private String ingredient;
	private String amount;

	public IngredientVo() {}
	public IngredientVo(int postId, String ingredient, String amount) {
		super();
		this.postId = postId;
		this.ingredient = ingredient;
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "IngredientVo [postId=" + postId + ", ingredient=" + ingredient + ", amount=" + amount + "]";
	}

	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public String getIngredient() {
		return ingredient;
	}
	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	
	
}
