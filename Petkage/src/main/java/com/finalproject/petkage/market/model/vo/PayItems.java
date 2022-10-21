package com.finalproject.petkage.market.model.vo;

import lombok.Data;

@Data
public class PayItems {
	private int payItemNo;
	
	private String payNo;
	
	// view에서 받아올 값
	private int proNo;
	
	private int proCount;
	
	// DB에서 받아올 값
	private String proName;
	
	private String proBrand;
	
	private int proOPrice;
	
	private int proSPrice;
	
	private String renamedFileName;
	
	private int proDelFee;
	
	private int proLTime;
	
	// 주문 페이지에서 생성할 값
	// 총 가격(상품 * 수량)
	private int eachProTotalPrice;
	
	private int savingPoint;
	
	public void initTotalInfo() {
		this.eachProTotalPrice = this.proSPrice * this.proCount;
		this.savingPoint = (int)(Math.ceil(this.proSPrice * 0.05)) * this.proCount;
	}
}
