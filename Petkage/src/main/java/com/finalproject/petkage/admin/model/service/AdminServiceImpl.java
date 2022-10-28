package com.finalproject.petkage.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.petkage.admin.model.mapper.AdminMapper;
import com.finalproject.petkage.common.util.PageInfo;
import com.finalproject.petkage.market.model.vo.Product;
import com.finalproject.petkage.member.model.vo.Member;
import com.finalproject.petkage.review.model.vo.Review;
import com.finalproject.petkage.wherego.model.vo.Wherego;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	public AdminMapper mapper;
	
	// 회원
	@Override
	public int getMemCount(String memtype, String search) {
		Map<String, String> map = new HashMap<>();
		
		map.put("memtype", memtype);
		map.put("search", search);
		
		return mapper.selectMemCountBySearch(map);
	}

	@Override
	public List<Member> getMemList(PageInfo pageInfo, String memtype, String search) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);	
		
		Map<String, String> map = new HashMap<>();
		
		map.put("memtype", memtype);
		map.put("search", search);
		
		return mapper.selectMemAllBySearch(rowBounds, map);
	}

	@Override
	public int getMemXCount(String memtype, String search) {
		Map<String, String> map = new HashMap<>();
		
		map.put("memtype", memtype);
		map.put("search", search);
		
		return mapper.selectMemXCount(map);
	}
	
	@Override
	public List<Member> getMemXList(PageInfo pageInfo, String memtype, String search) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);	
		
		Map<String, String> map = new HashMap<>();
		
		map.put("memtype", memtype);
		map.put("search", search);
		
		return mapper.selectMemXAll(rowBounds, map);
	}
	
	@Override
	public Member findMemberByNo(int no) {
		
		return mapper.selectMemberByNo(no);
	}
	
	@Override
	public int memUpdateStatus(Member member) {
		int result = 0;
		
		result = mapper.updateMemStatus(member);
		
		return result;
	}
	
	// 어디가지
	@Override
	public int getBoardCount(String boardtype, String search) {
		Map<String, String> map = new HashMap<>();
		
		map.put("boardtype", boardtype);
		map.put("search", search);
		
		return mapper.selectBoardCount(map);
	}

	@Override
	public List<Wherego> getBoardList(PageInfo pageInfo, String boardtype, String search) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);	
		
		Map<String, String> map = new HashMap<>();
		
		map.put("boardtype", boardtype);
		map.put("search", search);
		
		return mapper.selectBoardAll(rowBounds, map);
	}
	
	@Override
	public Wherego findBoardByNo(int no) {
		
		return mapper.selectBoardByNo(no);
	}

	@Override
	public int boardUpdateStatus(Wherego wherego) {
		int result = 0;
		
		result = mapper.updateBoardStatus(wherego);
		
		return result;
	}


	// 상품
	@Override
	public int getProCount(String searchtype, String search) {
		Map<String, String> map = new HashMap<>();
		
		map.put("searchtype", searchtype);
		map.put("search", search);
		
		return mapper.selectProductCount(map);
	}

	@Override
	public List<Product> getProductList(PageInfo pageInfo, String searchtype, String search) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);	
		
		Map<String, String> map = new HashMap<>();
		
		map.put("searchtype", searchtype);
		map.put("search", search);
		
		return mapper.selectProductAll(rowBounds, map);
	}
	
	// 리뷰
	@Override
	public int getRevCount(String categorytype, String searchtype, String search) {
		Map<String, String> map = new HashMap<>();
		
		map.put("categorytype", categorytype);
		map.put("searchtype", searchtype);
		map.put("search", search);
		
		return mapper.selectReviewCount(map);
	}

	@Override
	public List<Review> getReviewList(PageInfo pageInfo, String categorytype, String searchtype, String search) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);	
		
		Map<String, String> map = new HashMap<>();
		
		map.put("categorytype", categorytype);
		map.put("searchtype", searchtype);
		map.put("search", search);
		
		return mapper.selectReviewAll(rowBounds, map);
	}






	
}
