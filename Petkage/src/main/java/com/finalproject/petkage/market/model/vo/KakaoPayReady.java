package com.finalproject.petkage.market.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class KakaoPayReady {
    /* response */
	
	// 결제 고유 번호, 카카오톡으로 결제 요청 메시지(TMS)를 보내기 위한 사용자 정보 입력 화면
    private String tid;
    
    private String next_redirect_pc_url; 
    
    // 결제 준비 요청 시간
    private Date created_at; 
    
    /* request */
    
    private int payNo;
    
    private int no;
    
    private String payMethod;
    
    private int payTotalPrice;
    
    private Date payCreatedAt;
    
    private Date payApprovedAt;
    
    private List<PayItems> orders;
    
}
