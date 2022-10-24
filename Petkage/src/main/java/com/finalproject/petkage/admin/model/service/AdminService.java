package com.finalproject.petkage.admin.model.service;

import java.util.List;

import com.finalproject.petkage.common.util.PageInfo;
import com.finalproject.petkage.market.model.vo.Product;
import com.finalproject.petkage.member.model.vo.Member;
import com.finalproject.petkage.review.model.vo.Review;
import com.finalproject.petkage.wherego.model.vo.Wherego;

public interface AdminService {

	int getMemCount(String memtype, String search);
	
	List<Member> getMemList(PageInfo pageInfo, String memtype, String search);

	int getMemXCount();

	List<Member> getMemXList(PageInfo pageInfo);

	int getBoardCount();

	List<Wherego> getBoardList(PageInfo pageInfo);

	int getProCount();

	List<Product> getProductList(PageInfo pageInfo);

	int getRevCount();

	List<Review> getReviewList(PageInfo pageInfo);
	
}
