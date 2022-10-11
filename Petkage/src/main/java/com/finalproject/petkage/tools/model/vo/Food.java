package com.finalproject.petkage.tools.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Food {
	private int no; // 식품 번호
	
	private String foodName; // 식품 이름
	
	private String comment; // 식품 설명 
	
	private String subComment; // 식품 상세설명
	
//	private String petType; // 반려동물 타입(Dog/Cat)

	private String eatThis; // 가능여부 (Good/Bad/Soso/Not)
}
