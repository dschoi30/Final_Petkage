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
	
	private int proCount;
}
