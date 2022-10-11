package com.finalproject.petkage.notice.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
	private int no;
	
	private int writerNo;
	
	private String title;
	
	private String content;
	
	private Date createDate;
	
	private String img;
	
	private String status;
	
}
