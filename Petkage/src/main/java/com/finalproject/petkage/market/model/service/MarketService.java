package com.finalproject.petkage.market.model.service;

import java.util.List;

import com.finalproject.petkage.common.util.PageInfo;
import com.finalproject.petkage.market.model.vo.Product;

public interface MarketService {

	int getProductCount();
	
	List<Product> getProductList(PageInfo pageInfo);
	
	Product findProductByNo(int proNo);
	
	int save(int proNo);

	int delete(int proNo);
}
