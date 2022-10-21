package com.finalproject.petkage.market.model.vo;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Payment {
    /* request */
    
    private String payNo;
    
    private int no;
    
    private String address;
    
    private String subaddress;
    
    private String payMethod;
    
    private int totalDelFee;

    private int totalPrice;
    
    private int usingPoint;
    
    private int totalSavingPoint;
    
    private int totalPriceAfterUsingPoint;
    
    private String orderComment;
    
    private String orderStatus;
    
    private String payCreatedAt;
    
    private List<PayItems> orders;
    
    public void getPriceInfo() {
    	for(PayItems payItems : orders) {
    		totalPrice += payItems.getEachProTotalPrice();
    		totalSavingPoint += payItems.getSavingPoint();
    	}
    	totalPriceAfterUsingPoint = totalPrice + totalDelFee - usingPoint;
    }
}
