package com.finalproject.petkage.review.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review {

	private int revno;
	
	private int spotno;
	
	private int prono;
	
	private int writerno;
	
	private String revtype;
	
	private String revtitle;
	
	private String revcoment;
	
	private String revimg;
	
	private Date revdate;
	
	private int revscore;
	
	private int revrecomend;
	
	private String revstatus;
	
	private int revreport;
	
	private String revrenameimg;
	
	private String memname;
	
	private String revcategory;
}
