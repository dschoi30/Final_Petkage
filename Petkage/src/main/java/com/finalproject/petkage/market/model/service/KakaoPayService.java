package com.finalproject.petkage.market.model.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.finalproject.petkage.market.model.mapper.MarketMapper;
import com.finalproject.petkage.market.model.vo.KakaoPayApproval;
import com.finalproject.petkage.market.model.vo.KakaoPayReady;
import com.finalproject.petkage.market.model.vo.PayItems;
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
	
	public String kakaoPayReady() {
		RestTemplate restTemplate = new RestTemplate();

		//서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "a2c23a946b5f644401b0fc455309f81c");
		headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
		
		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("partner_order_id", "1001");
		params.add("partner_user_id", "ds0631");
		params.add("item_name", "탐사 6free 강아지 사료 연어 레시피, 3kg");
		params.add("quantity", "1");
		params.add("total_amount", "17490");
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
	
    public KakaoPayApproval kakaoPayInfo(String pg_token) {
   	
        log.info("KakaoPayInfo............................................");
        log.info("-----------------------------");
        
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
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", "ds0631");
        params.add("pg_token", pg_token);
        params.add("total_amount", "17490");
        
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

	public List<PayItems> getItemsInfo(List<PayItems> orders) {
		
		List<PayItems> result = new ArrayList<PayItems>();
		
		for(PayItems payItems : orders) {
			
			PayItems itemsInfo = mapper.getItemsInfo(payItems.getProNo());
			
			itemsInfo.setProCount(payItems.getProCount());
			
			result.add(itemsInfo);
		}
		return result;
	}
	
	public Member getMemberInfo(int no) {
		
		return mapper.getMemberDeliveryInfo(no);
	}
}
