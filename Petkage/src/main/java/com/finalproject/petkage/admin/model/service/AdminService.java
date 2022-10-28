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

	int getMemXCount(String memtype, String search);

	List<Member> getMemXList(PageInfo pageInfo, String memtype, String search);

	int getBoardCount(String boardtype, String search);

	List<Wherego> getBoardList(PageInfo pageInfo, String boardtype, String search);

	int getProCount(String searchtype, String search);

	List<Product> getProductList(PageInfo pageInfo, String searchtype, String search);

	int getRevCount(String categorytype, String searchtype, String search);

	List<Review> getReviewList(PageInfo pageInfo, String categorytype, String searchtype, String search);

	Member findMemberByNo(int no);

	int memUpdateStatus(Member member);

	Wherego findBoardByNo(int no);

	int boardUpdateStatus(Wherego wherego);
	
}
