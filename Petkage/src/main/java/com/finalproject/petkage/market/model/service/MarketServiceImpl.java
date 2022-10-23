package com.finalproject.petkage.market.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.petkage.common.util.PageInfo;
import com.finalproject.petkage.market.model.mapper.MarketMapper;
import com.finalproject.petkage.market.model.vo.Cart;
import com.finalproject.petkage.market.model.vo.ProRating;
import com.finalproject.petkage.market.model.vo.Product;
import com.finalproject.petkage.review.model.vo.Review;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MarketServiceImpl implements MarketService {

	@Autowired
	private MarketMapper mapper;
	
	@Override
	public int getProductCount() {

		return mapper.selectProductCount();
	}

	@Override
	public List<Product> getProductList(PageInfo pageInfo) {

		return getProductList(pageInfo, null);
	}
	
	@Override
	public List<Product> getProductList(PageInfo pageInfo, Product product) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
				
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectProductList(rowBounds, product);
	}

	@Override
	public List<Product> sortProductListFromLowest(PageInfo pageInfo, Product product) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
				
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.sortProductListFromLowest(rowBounds, product);
	}

	@Override
	public List<Product> sortProductListFromHighest(PageInfo pageInfo, Product product) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
				
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.sortProductListFromHighest(rowBounds, product);
	}
	
	@Override
	public Product findProductByNo(int proNo) {
		
		return mapper.selectProductByNo(proNo);
	}

	@Override
	public int save(Product product) {
		
		int result = 0;

		if(product.getProNo() != 0) {
			result = mapper.updateProduct(product);
		} else {
			result = mapper.registerProduct(product);
		}
		
		return result;
	}

	@Override
	public int delete(int proNo) {
		
		int result = 0;
		
		result = mapper.updateProductStatus(proNo, "N");
		
		return result;
	}

	@Override
	public int addCart(Cart cart) {
		
		Cart checkCart = mapper.checkCart(cart);
		
		if(checkCart != null) {
			return 2;
		}
		return mapper.addCart(cart);
	}

	@Override
	public int deleteCart(int cartNo) {
		
		return mapper.deleteCart(cartNo);
	}

	@Override
	public int updateCart(Cart cart) {
		
		return mapper.updateCart(cart);
	}
	
	@Override
	public List<Cart> getCartList(int no) {

		List<Cart> cart = mapper.getCartList(no);
		
		return cart;
	}

	@Override
	public void setProductRating(int proNo) {
		Double proRating = mapper.getProductRating(proNo);
		
		if(proRating == null) {
			proRating = 0.0;
		}
		
		ProRating rating = new ProRating();
		rating.setProNo(proNo);
		rating.setProRatingAvg(proRating);
		
		mapper.updateProductRating(rating);
	}

	@Override
	public int getReviewCount(int proNo) {
		log.info("proNo : {}", proNo);
		return mapper.getReviewCount(proNo);
	}

	@Override
	public List<Review> getReviewList(PageInfo pageInfo, Review review, int proNo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		
		RowBounds rowbounds = new RowBounds(offset, limit);
		log.info("review : {}", review);
		return mapper.getReviewList(rowbounds, review, proNo);
	}
}
