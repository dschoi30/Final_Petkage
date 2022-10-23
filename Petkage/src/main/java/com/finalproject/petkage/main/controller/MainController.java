package com.finalproject.petkage.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.petkage.common.util.PageInfo;
import com.finalproject.petkage.market.model.service.MarketService;
import com.finalproject.petkage.market.model.vo.Product;
import com.finalproject.petkage.mypage.model.service.MyPageService;
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
    
    @GetMapping("/")
    public ModelAndView main_all(ModelAndView model,
//            @ModelAttribute Wherego wherego, 
            @RequestParam(value = "score", defaultValue = "0") int score) {
        
        List<Wherego> wherego = null;
//        List<Product> product = null;
//        List<Mypage> calendar = null;

//        PageInfo wheregoPage = new PageInfo(page, 10, wherego_service.getCountWheregoRecommend(), 10);
//        PageInfo productPage = new PageInfo(page, 10, market_service.getCountProductBest(), 10);
//        PageInfo calendarPage = new PageInfo(page, 10, mypage_service.getCountMyCalendar(), 10);
        
        wherego = wherego_service.getListWheregoRecommend();
//        product = market_service.getListProductBest(score);
//        calendar = mypage_service.getListMyCalendar(calendarPage);
        
        System.out.println(wherego);
//        System.out.println(product);
//        System.out.println(calendar);

        model.addObject("wherego", wherego);
//        model.addObject("product", product);
//        model.addObject("calendar", calendar);
//        model.addObject("pageInfo", pageInfo);
        model.setViewName("common/main");

        System.out.println("별점 순 어디가지 : " + wherego);
        
        return model;

    }
}
