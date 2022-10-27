package com.finalproject.petkage.mypage.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {
	private int orderNo;
	
	private int memNo;
	
	private int proNo;
	
	private int payNo;
	
	private int orderAmount;
	
	private int orderPrice;
	
	private String orderStatus;
	
	private Date orderDate;
			
	private String orderImg;
		
}
