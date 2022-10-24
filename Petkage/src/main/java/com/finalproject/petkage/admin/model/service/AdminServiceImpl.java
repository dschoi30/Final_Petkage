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
	
	// status = 'Y'
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

	// status = 'N'
	@Override
	public int getMemXCount() {
		
		return mapper.selectMemXCount();
	}
	
	@Override
	public List<Member> getMemXList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);	
		
		return mapper.selectMemXAll(rowBounds);
	}
	
	// 어디가지
	@Override
	public int getBoardCount() {
		
		return mapper.selectBoardCount();
	}

	@Override
	public List<Wherego> getBoardList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);	
		
		return mapper.selectBoardAll(rowBounds);
	}

	// 상품
	@Override
	public int getProCount() {
		
		return mapper.selectProductCount();
	}

	@Override
	public List<Product> getProductList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);	
		
		return mapper.selectProductAll(rowBounds);
	}
	
	// 리뷰
	@Override
	public int getRevCount() {
		
		return mapper.selectReviewCount();
	}

	@Override
	public List<Review> getReviewList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);	
		
		return mapper.selectReviewAll(rowBounds);
	}




	
}
