package com.finalproject.petkage.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Pet {
	// 7개
	private int petNo;
	
	private int memNo;
	
	private String petName;
	
	private String petType;
	
	private String petWeight;
	
	private String petInfo;
	
	private String petStatus;
}
