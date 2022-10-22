package com.finalproject.petkage.market.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.finalproject.petkage.market.model.vo.Cart;
import com.finalproject.petkage.market.model.vo.KakaoPayApproval;
import com.finalproject.petkage.market.model.vo.PayItems;
import com.finalproject.petkage.market.model.vo.Payment;
import com.finalproject.petkage.market.model.vo.ProRating;
import com.finalproject.petkage.market.model.vo.Product;
import com.finalproject.petkage.member.model.vo.Member;

@Mapper
public interface MarketMapper {
	int selectProductCount();

	List<Product> selectProductList(RowBounds rowbounds, Product product);
	
	List<Product> sortProductListFromLowest(RowBounds rowbounds, Product product);

	List<Product> sortProductListFromHighest(RowBounds rowbounds, Product product);
	
	Product selectProductByNo(@Param("proNo") int proNo);

	int registerProduct(Product product);

	int updateProductStatus(@Param("proNo") int proNo, @Param("proStatus") String string);
	
	int findProductByNo(int proNo);

	int updateProduct(Product product);

	int addCart(Cart cart);
	
	int deleteCart(int cartNo);
	
	int updateCart(Cart cart);

	List<Cart> getCartList(int no);

	Cart checkCart(Cart cart);

	KakaoPayApproval addPayment(String pg_token);
	
	PayItems getItemsInfo(int proNo);
	
	Member getMemberDeliveryInfo(int no);
	
	int placeOrder(Payment payment);
	
	int placeOrderItems(PayItems payItems);
	
	int deductMemberPoint(Member member);
	
	int deductProductStock(Product product);
	
	int deleteCartOrder(Cart cart);
	
	Double getProductRating(int proNo);
	
	int updateProductRating(ProRating proRating);
}
