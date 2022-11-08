package com.ab.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes({"session_stock"})
@Controller
public class StockMappingController {

	@GetMapping("/stocks/chart")
	public String chart() {			
		return "stock_chart"; 
	}
	
}
