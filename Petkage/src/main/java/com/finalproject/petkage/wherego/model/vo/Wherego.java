package com.finalproject.petkage.wherego.model.vo;

import java.util.Date;

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
	
	private String theme; // 테마
	
	private String introduce; // 소개
	
	private String info; // 기본정보
	
	private String spotstatus; // 어디가지 상태

	private String renameimg; // 이미지 개명

	private String spotmap; // 지도 좌표
	
	private String roomname; // 객실 이름

    private int roomprice; // 객실 가격
    
    private String roomimg; // 객실 이미지(1개)
    
    private String minfo; // 모달 기본정보
    
    private String mameni; // 모달 편의시설

}