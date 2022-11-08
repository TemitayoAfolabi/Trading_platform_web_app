package com.ab.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.ab.models.Stock;


@SessionAttributes({"session_customer", "session_stock"})
@Controller
public class PortfolioController {
	
	
	
	@GetMapping("/Sell/{stockId}/{stockRegion}/{stockName}")
	public ModelAndView sell(@PathVariable("stockId") int stockId,@PathVariable("stockRegion") String stockRegion,@PathVariable("stockName") String stockName) {
		
		ModelAndView mv = new ModelAndView();
        
        Stock st = new Stock();
        
        st.setStockId(stockId);
		
		st.setStockName(stockName);
		
		st.setStockRegion(stockRegion);
				
		mv.addObject("stock",st); 
		
		mv.setViewName("sell");
		
		return mv;
}
	
	
}
