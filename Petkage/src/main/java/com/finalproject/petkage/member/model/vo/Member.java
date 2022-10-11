package com.finalproject.petkage.member.model.vo;

import java.util.Date;
import java.util.List;

import javax.print.DocFlavor.STRING;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
   // 15 + 2
   private int no;
   
   private String userId;
   
   private String userPwd;
   
   private String userName;
      
   private String userPhone;
   
   private String zonecode;
   
   private String userAddress;
   
   private String addressSub;
   
   private String userEmail;
   
   private int point;
   
   private int report;
   
   private String memberRole;
   
   private String status;
   
   private Date enrolldate;
   
   private String petYN;
   
//   private Pet pet;
//   
//   private Seller seller;
}