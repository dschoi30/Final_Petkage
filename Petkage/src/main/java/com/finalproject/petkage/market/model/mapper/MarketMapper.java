package com.finalproject.petkage.market.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.finalproject.petkage.market.model.vo.Product;

@Mapper
public interface MarketMapper {
	int selectProductCount();

	List<Product> selectAll(RowBounds rowbounds);
	
	Product selectProductByNo(@Param("proNo") int proNo);

	int registerProduct(Product product);
}
