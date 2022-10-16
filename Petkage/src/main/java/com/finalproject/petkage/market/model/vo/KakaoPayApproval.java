package com.finalproject.petkage.market.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class KakaoPayApproval {
    /* response */
	
	// 요청 고유 번호, 결제 고유 번호, 가맹점 코드, 정기결제용 ID-정기결제 CID로 단건결제 요청 시 발급
    private String aid, tid, cid, sid; 
    
    // 가맹점 주문번호-최대 100자, 가맹점 회원 id-최대 100자, 결제 수단-CARD 또는 MONEY 중 하나
    private String partner_order_id, partner_user_id, payment_method_type;
    
    // 결제 금액 정보
    private Amount amount;
    
    // 결제 상세 정보-결제수단이 카드일 경우만 포함
    private CardInfo card_info;
    
    // 상품 이름-최대 100자, 상품 코드-최대 100자, 결제 승인 요청에 대해 저장한 값-요청 시 전달된 내용
    private String item_name, item_code, payload;
    
    // 상품 수량, 상품 비과세 금액, 상품 부가세 금액
    private Integer quantity, tax_free_amount, vat_amount;
    
    // 결제 준비 요청 시각, 결제 승인 시각
    private Date created_at, approved_at;
}
