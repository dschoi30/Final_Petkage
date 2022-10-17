package com.finalproject.petkage.tools.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.finalproject.petkage.tools.model.service.ToolsService;
import com.finalproject.petkage.tools.model.vo.Food;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/tools")
public class ToolsController {
	
	@Autowired
	private ToolsService service;
	
	@GetMapping("/toolsMain")
	public String toolsMain() {
		log.info("펫키지 툴즈 메인화면 요청");
		
		return "tools/toolsMain";
	}
	
	@GetMapping("/ageCalculator")
	public String ageCal() {
		log.info("펫키지 툴즈 나이 계산기 요청");
		
		return "tools/ageCalculator";
	}
	
	@GetMapping("/bmiCalculator")
	public String bmiCal() {
		log.info("펫키지 툴즈 비만도 계산기 요청");
		
		return "tools/bmiCalculator";
	}
	
	@GetMapping("/calorieCalculator")
	public String calorieCal() {
		log.info("펫키지 툴즈 칼로리 계산기 요청");
		
		return "tools/calorieCalculator";
	}
	
	@GetMapping("/foodDictionary")
	public String foodDic() {
		log.info("펫키지 툴즈 식품사전 요청");
		
		return "tools/foodDictionary";
	}
	
	@GetMapping("/walkOutRecommend")
	public String walkOut() {
		log.info("펫키지 툴즈 산책코스 요청");
		
		return "tools/walkOutRecommend";
	}
	
	@RequestMapping(value = "/eatThis", method = { RequestMethod.GET })
    public ModelAndView foodSearch (
            ModelAndView model, @RequestParam(value = "foodName", required = false) String foodName) { 
	    
	    log.info("입력한 과일 이름 : " + foodName);
	    
        Food food = null;
        System.out.println("서비스 전 : " + food);
        
        food = service.findFood(foodName);
        
        System.out.println("서비스 후 : " + food);
        
        model.addObject("food", food);
        model.setViewName("tools/eatThis");

        return model;
	}	
	
	@RequestMapping("/ageResult")
	public ModelAndView ageResult (
	        ModelAndView model) {
	    
	    return model;
	}
    
    @GetMapping(value = "/weather", produces = "application/json; charset=UTF-8")
    public void GetWeather(Model model) throws Exception {
//        weatherDto weather_dto = new weatherDto();
		String sky = null; 
		String temp = null;
		String pty = null;
		String pop = null;
		String skyState = null;

        /* 
            @ API LIST ~
            
            getUltraSrtNcst 초단기실황조회 
            getUltraSrtFcst 초단기예보조회 
            getVilageFcst 동네예보조회 
            getFcstVersion 예보버전조회
        */
        String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst"
            + "?serviceKey=hgEglaEDn13Dt4LXVSJLS1d4VyBtX069Yg8Xwoc80%2Fzub073%2FO4UzyQf%2F9bKzi4Q2UfG3%2BD5yMlPxqNv0RraSw%3D%3D"
            + "&dataType=JSON"            // JSON, XML
            + "&numOfRows=10"             // 페이지 ROWS
            + "&pageNo=1"                 // 페이지 번호
            + "&base_date=" + dataArray().get("day")       // 발표일자
            + "&base_time=" + dataArray().get("time")           // 발표시각
            + "&nx=60"                    // 예보지점 X 좌표
            + "&ny=127";                  // 예보지점 Y 좌표
        
        String resultMap = getDataFromJson(url, "UTF-8", "get", "").toString();
        
        System.out.println("# RESULT : " + resultMap);

        JSONObject jsonObj = new JSONObject();
        
		JSONObject parse_response = (JSONObject) jsonObj.get("response");
		JSONObject parse_body = (JSONObject) parse_response.get("body");
		JSONObject parse_items = (JSONObject) parse_body.get("items");
		JSONArray parse_item = parse_items.getJSONArray("item");
		String category;
		JSONObject weather;

		for(int i = 0; i < parse_item.length(); i++) {
		
			weather = (JSONObject) parse_item.get(i);
			Object fcstValue = weather.get("fcstValue");

			category = (String)weather.get ("category");
			
			if(category.equals("SKY")) { // 하늘 상태
				sky = (String)fcstValue;
			} else if(category.equals ("PTY")) { // 눈 비
				pty = (String)fcstValue;
			} else if(category. equals("TMP")) { // 현재 기온
				temp = (String)fcstValue;
			} else if(category.equals("POP")) { // 강수 확률
				pop = (String)fcstValue;
			}	
		}

		if (!pty.equals("0")) {
			switch(pty) {
			case "1":
				skyState = "<i class=\"fas fa-cloud-showers-heavy\"></i>";
				break;
			case "3":
				skyState = "<i class=\"far fa-snowflake\"></i>";
				break;
			case "4":
				skyState = "<i class=\"fas fa-cloud-rain\"></i>";
				break;
			}
		}else {
			switch(sky) {
			case "1":
				skyState = "<i class=\"fas fa-sun\" style=\"color:orange;\"></i>";
				break;
			case "3":
				skyState = "<i class=\"fas fa-cloud-sun\"></i>";
				break;
			case "4":
				skyState = "<i class=\"fas fa-cloud\"></i>";
				break;
			}
		}
//		weather_dto.setSky(skyState);
//		weather_dto.setPty(pop);
//		weather_dto.setTemp(temp);
//
//		return weather_dto;

        // jsonObj.put("result", resultMap);
        // return jsonObj.toString();
    }
    
    public HashMap<String, Object> getDataFromJson(String url, String encoding, String type, String jsonStr) throws Exception {
        boolean isPost = false;

        if ("post".equals(type)) {
            isPost = true;
        } else {
            url = "".equals(jsonStr) ? url : url + "?request=" + jsonStr;
        }

        return getStringFromURL(url, encoding, isPost, jsonStr, "application/json");
    }
    
    public HashMap<String, Object> getStringFromURL(String url, String encoding, boolean isPost, String parameter, String contentType) throws Exception {
        URL apiURL = new URL(url);

        HttpURLConnection conn = null;
        BufferedReader br = null;
        BufferedWriter bw = null;

        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {
            conn = (HttpURLConnection) apiURL.openConnection();
            conn.setConnectTimeout(5000);
            conn.setReadTimeout(5000);
            conn.setDoOutput(true);
			conn.setUseCaches(false);

            if (isPost) {
                conn.setRequestMethod("POST");
                conn.setRequestProperty("Content-Type", contentType);
                conn.setRequestProperty("Accept", "*/*");
            } else {
                conn.setRequestMethod("GET");
            }

            conn.connect();

            if (isPost) {
                bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream(), "UTF-8"));
                bw.write(parameter);
                bw.flush();
                bw = null;
            }

            br = new BufferedReader(new InputStreamReader(conn.getInputStream(), encoding));

            String line = null;

            StringBuffer result = new StringBuffer();

            while ((line=br.readLine()) != null) {
                result.append(line);
            }
            log.info(result.toString());

             ObjectMapper mapper = new ObjectMapper();

             resultMap = mapper.readValue(result.toString(), HashMap.class);
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception(url + " interface failed" + e.toString());
        } finally {
            if (conn != null) conn.disconnect();
            if (br != null) br.close();
            if (bw != null) bw.close();
        }

        return resultMap;
    }

	private HashMap<String, String> dataArray() {
		HashMap<String, String> datas = new HashMap<> ();
		LocalDate now = LocalDate.now();
		LocalTime now_time = LocalTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("HH00");
		
		int before = Integer.parseInt(now_time. format(formatter2));
		int after = 210;

		if(before > after) {
		now = now.minusDays(1);
		now_time = now_time.of (23,0);
		}
		datas.put ("day", now.format(formatter));
		datas.put ("time", now_time.format(formatter2));

		return datas;
	}
}
