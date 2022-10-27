package com.finalproject.petkage.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.petkage.common.util.PageInfo;
import com.finalproject.petkage.market.model.service.MarketService;
import com.finalproject.petkage.market.model.vo.Product;
import com.finalproject.petkage.mypage.model.service.MyPageService;
import com.finalproject.petkage.mypage.model.vo.Calendar;
import com.finalproject.petkage.review.model.vo.Review;
import com.finalproject.petkage.wherego.controller.WheregoController;
import com.finalproject.petkage.wherego.model.service.WheregoService;
import com.finalproject.petkage.wherego.model.vo.Wherego;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MainController {
    
    @Autowired
    private WheregoService wherego_service;
    
    @Autowired
    private MarketService market_service;

    @Autowired
    private MyPageService mypage_service;
    
    @RequestMapping("/")
    public ModelAndView main_all(ModelAndView model,
            @RequestParam(value = "score", defaultValue = "0") int score) {
        
        List<Wherego> wherego = null;
        List<Product> product = null;
        List<Calendar> calendar = null;

        wherego = wherego_service.getListWheregoRecommend();
        product = market_service.getListProductBest();
        calendar = mypage_service.getListFestivalCalendar();
        
        System.out.println(wherego);
        System.out.println(product);
        System.out.println(calendar); 

        model.addObject("wherego", wherego);
        model.addObject("product", product);
        model.addObject("calendar", calendar);
        model.setViewName("common/main");

        System.out.println("별점 순 어디가지 : " + wherego);
        
        return model;

    }
    
    @RequestMapping("/festivalDay")
    @ResponseBody
    
    public Map<String, Object> festivalDay(@RequestBody HashMap<String, Object> festivaldate){
        Map<String, Object> resultMap = new HashMap<String, Object>();
    
//    public List<Map<String, Object>> festivalDay() {
        List<Calendar> calendar = null;
        calendar = mypage_service.getListFestivalCalendar();

        System.out.println(calendar);
        
        resultMap.put("calendar", calendar);
        return resultMap;
 
//         JSONObject jsonObj = new JSONObject();
//         JSONArray jsonArr = new JSONArray();
 
//         HashMap<String, Object> hash = new HashMap<>();
 
//         for (int i = 0; i < calendar.size(); i++) {
//             hash.put("title", calendar.get(i).getCalTitle());
//             hash.put("start", calendar.get(i).getCalDate());
// //            hash.put("time", listAll.get(i).getScheduleTime());
 
//             jsonObj = new JSONObject(hash);
//             jsonArr.put(jsonObj);
//         }
        
//         log.info("jsonArrCheck: {}", jsonArr);
//        return calendar;
    }
}
