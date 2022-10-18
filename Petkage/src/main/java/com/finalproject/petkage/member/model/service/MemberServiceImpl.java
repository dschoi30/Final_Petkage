package com.finalproject.petkage.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finalproject.petkage.member.model.mapper.MemberMapper;
import com.finalproject.petkage.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private MemberMapper mapper;
	
	@Override
	public Member login(String userId, String userPwd) {
		Member member = null;
		
		member = mapper.selectMemberById(userId);
		System.out.println("encode() : " + passwordEncoder.encode(userPwd));
		
		if(member != null && passwordEncoder.matches(userPwd, member.getUserPwd())) {
			return member;
		} else {
			return null;
		}
	}

	@Override
	@Transactional
	public int saveMember(Member member) {
		int result = 0;
		String role = member.getMemberRole();
		String petYN = member.getPetYN();
		
		member.setUserPwd(passwordEncoder.encode(member.getUserPwd()));
		
		if(member.getNo() != 0) {
			// update
//			result = mapper.updateMember(member);
		} else {
			// insert

			if(role.equals("ROLE_USER") && petYN.equals("N")) {
				// 일반 회원이면서 펫 정보 없을 경우	
				result = mapper.insertMember(member);
			}
			
			if(role.equals("ROLE_USER") && petYN.equals("Y")) {
				// 일반 회원이면서 펫 정보 있을 경우
				result = mapper.insertMember(member);
				member.getPet().setMemNo(member.getNo());
				result = mapper.insertPet(member.getPet());
			}
			
			if(role.equals("ROLE_SELLER")) {
				// 판매자 회원일 경우
				result = mapper.insertMember(member);
				member.getSeller().setMemNo(member.getNo());
				result = mapper.insertSeller(member.getSeller());
			}

		}
		return result;
	}

	@Override
	@Transactional
	public int idCheck(String userId) {
		int result = 0;
		result = mapper.idCheck(userId);

		return result;
	}

	@Override
	@Transactional
	public int emailCheck(String userEmail) {
		int result = 0;
		result = mapper.emailCheck(userEmail);

		return result;
	}

	@Override
	@Transactional
	public Member findByEmail(String userEmail) {
		Member member = null;
		
		member = mapper.selectMemberByEmail(userEmail);
		
		if(member != null) {
			return member;
		} else {
			return null;
		}
	}

	@Override
	@Transactional
	public int updateFindNum(String userId, int findNum) {
		int result = 0;
		
		result = mapper.updateFindNum(userId, findNum);
		return result;
	}
	
	@Override
	@Transactional
	public int updatePwd(int no, String newPwd) {
		int result = 0;
		
		newPwd = passwordEncoder.encode(newPwd);		
		
		result = mapper.updatePwd(no, newPwd);
		return result;
	}
}
