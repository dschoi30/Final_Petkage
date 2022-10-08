package com.finalproject.petkage.market.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
	private int proNo;
	
	private int proSelNo;
	
	private String proName;
	
	private String proBrand;
	
	private String proCategory1;
	
	private String proCategory2;
	
	private String proTag;
	
	private String renamedFileName;
	
	private int proQty;
	
	private int proOPrice;
	
	private int proSPrice;
	
	private int proDelFee;
	
	private int proLTime;
	
	private String proContent;
	
	private Date proRDate;
	
	private String proStatus;
	
	private int proRepCount;
	
	private String searchValue;
}