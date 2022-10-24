package com.finalproject.petkage.admin.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.finalproject.petkage.market.model.vo.Product;
import com.finalproject.petkage.member.model.vo.Member;
import com.finalproject.petkage.review.model.vo.Review;
import com.finalproject.petkage.wherego.model.vo.Wherego;

@Mapper
public interface AdminMapper {

	int selectMemCountBySearch(Map<String, String> map);
	
	List<Member> selectMemAllBySearch(RowBounds rowBounds, Map<String, String> map);
	
	int selectMemXCount();

	List<Member> selectMemXAll(RowBounds rowBounds);

	int selectBoardCount();

	List<Wherego> selectBoardAll(RowBounds rowBounds);

	int selectProductCount();

	List<Product> selectProductAll(RowBounds rowBounds);

	int selectReviewCount();

	List<Review> selectReviewAll(RowBounds rowBounds);
	
	


}
