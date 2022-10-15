package com.finalproject.petkage.market.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.finalproject.petkage.market.model.vo.Cart;
import com.finalproject.petkage.market.model.vo.Product;

@Mapper
public interface MarketMapper {
	int selectProductCount();

	List<Product> selectProductList(RowBounds rowbounds, Product product);
	
	Product selectProductByNo(@Param("proNo") int proNo);

	int registerProduct(Product product);

	int updateProductStatus(@Param("proNo") int proNo, @Param("proStatus") String string);
	
	int findProductByNo(int proNo);

	int updateProduct(Product product);

	int addCart(Cart cart) throws Exception;
	
	int deleteCart(int proNo);
	
	int updateCart(Cart cart);

	List<Cart> getCartList(int no);

	Cart checkCart(Cart cart);
}
