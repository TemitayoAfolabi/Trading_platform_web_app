package com.ab.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.ab.models.Customer;
import com.ab.models.TradingHistory;
import com.ab.servicies.TradingHistoryService;


@SessionAttributes({"session_customer"})
@Controller
public class TradingHistoryController {
	
	@Autowired
	TradingHistoryService thService;
	
	//global ModelAndView variable
	ModelAndView mv = new ModelAndView();
	
	
    @GetMapping("/stocks/tradinghistory")
	public ModelAndView tradingHistoryPage(Model model) {	 
	 	 
    	Customer user = (Customer) model.getAttribute("session_customer");
        List<TradingHistory> thList =  thService.filterTradingHistoryByCustomerId(user.getCustomerId());
		mv.addObject("thList",thList); 
		mv.setViewName("trading_history");	
		return mv; 
	}
}
