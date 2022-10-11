package com.finalproject.petkage.member.model.service;

import com.finalproject.petkage.member.model.vo.Member;
import com.finalproject.petkage.member.model.vo.Pet;
import com.finalproject.petkage.member.model.vo.Seller;

public interface MemberService {
	
	Member login(String userId, String userPwd);

	int saveMember(Member member);

	int idCheck(String userId);

	int emailCheck(String userEmail);
}
