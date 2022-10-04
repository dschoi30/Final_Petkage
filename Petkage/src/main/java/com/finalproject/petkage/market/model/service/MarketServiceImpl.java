package com.finalproject.petkage.market.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finalproject.petkage.common.util.PageInfo;
import com.finalproject.petkage.market.model.mapper.MarketMapper;
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

		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectAll(rowBounds);
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
	
}
