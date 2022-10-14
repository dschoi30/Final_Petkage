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

	int idCheck(@Param("userId") String userId);

	int insertPet(Pet pet);

	int insertSeller(Seller seller);

	int emailCheck(@Param("userEmail")String userEmail);

	Member selectMemberByEmail(String userEmail);

	int updateFindNum(@Param("userId") String userId, @Param("findNum") int findNum);

	int updatePwd(@Param("no") int no, @Param("newPwd") String newPwd);
}
