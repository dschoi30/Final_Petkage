package com.finalproject.petkage.market.model.service;

import java.util.List;

import com.finalproject.petkage.common.util.PageInfo;
import com.finalproject.petkage.market.model.vo.Product;

public interface MarketService {

	int getProductCount();
	
	List<Product> getProductList(PageInfo pageInfo);

	List<Product> getProductList(PageInfo pageInfo, String searchValue);

	Product findProductByNo(int proNo);
	
	int save(Product product);

	int delete(int proNo);

}
