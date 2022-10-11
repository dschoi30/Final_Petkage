package com.finalproject.petkage.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Seller {
	// 4개
	private int sellerNo;
	
	private int memNo;
	
	private String bName;
	
	private String bNumber; 
}
