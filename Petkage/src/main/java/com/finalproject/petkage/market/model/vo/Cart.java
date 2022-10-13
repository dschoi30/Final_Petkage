package com.finalproject.petkage.market.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
	private int cartNo;
	
	private int memNo;
	
	private int proNo;
	
	private int proCount;
	
	// Product 테이블 join 부분
	private String proName;
	
	private String proBrand;
	
	private String renamedFileName;
	
	private int proOPrice;
	
	private int proSPrice;
	
	private int proDelFee;
	
	private int proLTime;
}
