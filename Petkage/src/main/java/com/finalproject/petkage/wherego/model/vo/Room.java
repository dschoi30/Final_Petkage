package com.finalproject.petkage.wherego.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Room {
    private int roomNo; // 객실 번호

    private int spotNo; // 어디가지 번호
    
    private int roomTypeNo; // 객실 타입 번호
	
	private String roomName; // 객실 이름

	private String roomPrice; // 객실 가격
	
	private String roomImg; // 객실 이미지(1개)
	   
	private String renameRoomImg; // 객실 이미지 개명
	
	private String mInfo; // 모달 기본정보   
    
    private String mAmeni; // 모달 편의시설
	
	private String roomStatus; // 객실 상태
}