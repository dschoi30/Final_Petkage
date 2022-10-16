package com.finalproject.petkage.market.model.vo;

import lombok.Data;

@Data
public class CardInfo {
	
	// 매입 카드사 한글명, 매입 카드사 코드
    private String purchase_corp, purchase_corp_code;
    
    // 카드 발급사 한글명, 	카드 발급사 코드
    private String issuer_corp, issuer_corp_code;
    
    // 카드 BIN, 카드 타입, 할부 개월 수, 카드사 승인번호, 카드사 가맹점 번호
    private String bin, card_type, install_month, approved_id, card_mid;
    
    // 무이자할부 여부(Y/N), 카드 상품 코드
    private String interest_free_install, card_item_code;
}
