package com.finalproject.petkage.member.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.finalproject.petkage.member.model.vo.Member;
import com.finalproject.petkage.member.model.vo.Pet;
import com.finalproject.petkage.member.model.vo.Seller;

@Mapper
public interface MemberMapper {
	Member selectMemberById(@Param("userId") String userId);

	int insertMember(Member member);

	int idCheck(String userId);

	int insertPet(Pet pet);

	int insertSeller(Seller seller);

	int emailCheck(String userEmail);
}
