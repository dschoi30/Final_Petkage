package com.finalproject.petkage.market.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.finalproject.petkage.common.util.PageInfo;
import com.finalproject.petkage.market.model.mapper.MarketMapper;
import com.finalproject.petkage.market.model.vo.Cart;
import com.finalproject.petkage.market.model.vo.Product;

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
		
		int result = 0;
//		
//		Cart checkCart = mapper.checkCart(cart);
//		
//		if(checkCart != null) {
//			return 2;
//		}
//		
		result = mapper.addCart(cart);
				
		return result;
	}

	@Override
	public List<Cart> getCartList(String memNo) {

		List<Cart> cart = mapper.getCartList(memNo);
		
		return cart;
	}

}
