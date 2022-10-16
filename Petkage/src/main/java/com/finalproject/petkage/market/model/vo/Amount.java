package com.finalproject.petkage.market.model.vo;

import lombok.Data;

@Data
public class Amount {
	
	// 전체 결제 금액, 비과세 금액, 부가세 금액, 사용한 포인트 금액, 할인 금액
    private Integer total, tax_free, vat, point, discount;
}
