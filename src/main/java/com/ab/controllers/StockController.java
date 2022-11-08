package com.ab.controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.ab.models.Stock;
import com.ab.servicies.StockService;

@SessionAttributes({"session_stock","session_st","session_customer"})
@RestController
public class StockController {

	@Autowired
	private StockService stockService;
	
	//view all stocks list
	@GetMapping("/stocks")
	public ModelAndView allStocks(@ModelAttribute Stock stock, Model model){
		
		ModelAndView mv = new ModelAndView();
		
		List<Stock> stocks = stockService.displayStocks();				
		
		model.addAttribute("session_stock", stocks);
		
		mv.addObject("stockList",stocks); 
		
		mv.setViewName("stock_list");
	
		return mv; 
		
	}
	
	//Session
	//view a specific stock details and chart
		@GetMapping("/stocks/chart/{stockId}/{stockName}/{stockQuantity}/{stockRegion}")
		public ModelAndView chart(@PathVariable("stockId") int stockId,@PathVariable("stockName") String stockName,@PathVariable("stockQuantity") int stockQuantity,@PathVariable("stockRegion") String stockRegion) {
	      
			ModelAndView mv = new ModelAndView();
	        
	        Stock st = new Stock();
	        st.setStockId(stockId);
			
			st.setStockName(stockName);
			
			st.setStockRegion(stockRegion);
			
			st.setStockQuantity(stockQuantity);
			
			mv.addObject("stock",st); 
			
			mv.setViewName("stock_chart");
			
			return mv;
		}
	
	
}

