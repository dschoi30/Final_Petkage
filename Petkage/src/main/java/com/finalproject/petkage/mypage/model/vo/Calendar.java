package com.finalproject.petkage.mypage.model.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Calendar {
    private int calNo;
    
    private int calMemNo;
    
    private String calTitle;

    private String calContent;
    
    @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy/MM/dd")
    private Date calDate;
            
    private String calStatus;

}
