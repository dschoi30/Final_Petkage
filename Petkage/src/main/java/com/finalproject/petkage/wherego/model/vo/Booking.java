package com.finalproject.petkage.wherego.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Booking {
	private int spotNo; // 어디가지 번호
	
	private int userNo; // 작성자(예약 회원)
	
	private String roomname; // 객실 이름

	private String roomprice; // 객실 가격
	
	private String roomimg; // 객실 이미지(1개)
	
	private String minfo; // 모달 기본정보
    
    private String mameni; // 모달 편의시설
	
	private String roomstatus; // 객실 상태
}