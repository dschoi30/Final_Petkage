package com.finalproject.petkage.wherego.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Wherego {
	private int spotNo; // 어디가지 번호
	
	private int userNo; // 작성자(관리자)
	
	private String spotCategory; // 어디가지 카테고리

	private String spotLocation; // 지역
	
	private String spotName; // 매장명
	
	private String spotAddress; // 매장주소
	
	private String spotSize; // 강아지 크기
	
	private String ameni; // 편의시설
	
	private String img; // 이미지(4개)
	
	private String renameImg; // 이미지 개명
    
	private String theme; // 테마
	
	private String introduce; // 소개
	
	private String info; // 기본정보
	
	private String spotStatus; // 어디가지 상태

	private String spotMap; // 지도 좌표
	
	private Room room; // 객실
	
	private int roomNum; // 객실 추가수

}