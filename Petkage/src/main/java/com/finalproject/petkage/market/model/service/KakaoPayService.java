package com.finalproject.petkage.market.model.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.finalproject.petkage.market.model.mapper.MarketMapper;
import com.finalproject.petkage.market.model.vo.KakaoPayApproval;
import com.finalproject.petkage.market.model.vo.KakaoPayReady;
import com.finalproject.petkage.market.model.vo.PayItems;
import com.finalproject.petkage.market.model.vo.Payment;
import com.finalproject.petkage.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class KakaoPayService {
	private static final String HOST = "https://kapi.kakao.com";

	private KakaoPayReady kakaoPayReady;
	private KakaoPayApproval kakaoPayApproval;
	
	@Autowired
	private MarketMapper mapper;
	
	@Transactional
	public String kakaoPayReady(Payment payment) {

		RestTemplate restTemplate = new RestTemplate();
		
		
		//서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "a2c23a946b5f644401b0fc455309f81c");
		headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
		
		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("partner_order_id", "seller1");
		params.add("partner_user_id", "user1");
		params.add("item_name", payment.getOrders().get(0).getProName() + " 외 " + (payment.getOrders().size() - 1)+ "건");
		params.add("quantity", Integer.toString(payment.getOrders().size()));
		params.add("total_amount", Integer.toString(payment.getTotalPriceAfterUsingPoint()));
		params.add("tax_free_amount", "0");
		params.add("approval_url", "http://localhost:8083/petkage/market/order-finished");
		params.add("cancel_url", "http://localhost:8083/petkage/market/order-canceled");
		params.add("fail_url", "http://localhost:8083/petkage/market/order-failed");
		
		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		try {
			kakaoPayReady = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReady.class);

			log.info("{}", kakaoPayReady);

			return kakaoPayReady.getNext_redirect_pc_url();

		} catch (RestClientException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}

       return "/order";
    }
	
    public KakaoPayApproval kakaoPayInfo(String pg_token, Payment payment) {
    	System.out.println(kakaoPayReady);
        log.info("KakaoPayInfo 호출");
        
        RestTemplate restTemplate = new RestTemplate();

        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "a2c23a946b5f644401b0fc455309f81c");
        headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReady.getTid());
        params.add("partner_order_id", "seller1");
        params.add("partner_user_id", "user1");
        params.add("pg_token", pg_token);
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
            kakaoPayApproval = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApproval.class);
            log.info("" + kakaoPayApproval);
          
            return kakaoPayApproval;
        
        } catch (RestClientException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        
        System.out.println("카카오페이 승인 내용" + kakaoPayApproval);
        
        return null;
    }

	public List<PayItems> getItemsInfo(List<PayItems> orderList) {
		
		List<PayItems> result = new ArrayList<PayItems>();
		
		for(PayItems payItems : orderList) {
			
			PayItems itemsInfo = mapper.getItemsInfo(payItems.getProNo());
			
			itemsInfo.setProCount(payItems.getProCount());
			
			result.add(itemsInfo);
		}
		return result;
	}
	
	public Member getMemberInfo(int no) {
		
		return mapper.getMemberDeliveryInfo(no);
	}
	
	@Transactional
	public void setOrder(Payment payment) {

		Member member = mapper.getMemberDeliveryInfo(payment.getNo());
		
		List<PayItems> orderList = new ArrayList<>();
		
		for(PayItems payItems : payment.getOrders()) {
			PayItems itemsInfo = mapper.getItemsInfo(payItems.getProNo());
			
			itemsInfo.setProCount(payItems.getProCount());
			itemsInfo.initTotalInfo();
			
			orderList.add(itemsInfo);
		}

		Date date = new Date();	
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMDDHHmmss");
		SimpleDateFormat payTimeFormat = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
		String payNo = dateFormat.format(date) + member.getNo();
		String payCreatedAt = payTimeFormat.format(date);

		payment.setPayCreatedAt(payCreatedAt);
		payment.setOrders(orderList);
		payment.getPriceInfo();
		payment.setPayNo(payNo);
		payment.setPayMethod("Kakaopay");
		mapper.placeOrder(payment);
		for(PayItems payItems : payment.getOrders()) {
			payItems.setPayNo(payNo);
			mapper.placeOrderItems(payItems);
		}
		System.out.println(payment);
	}
}
