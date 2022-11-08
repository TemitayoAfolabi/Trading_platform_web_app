	package com.ab.controllers;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.ab.models.Customer;
import com.ab.models.OrderBook;
import com.ab.models.TradingHistory;
import com.ab.servicies.CustomerService;
import com.ab.servicies.OrderBookService;
import com.ab.servicies.TradingHistoryService;


@SessionAttributes({"session_customer","session_stock"})
@Controller
public class OrderBookMappingController {
	
	
	@Autowired
	private OrderBookService orderBookService;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private TradingHistoryService thService;
	
	
	//global ModelAndView variable
	ModelAndView mv = new ModelAndView();
	
    @PostMapping("/stocks/orderbook")
	public ModelAndView newOrder(@RequestParam("order") String orderType,@RequestParam("quantity") int quantity,@RequestParam("price") double price,@RequestParam("stockRegion") String stockRegion,@RequestParam("stockName") String stockName,@RequestParam("stockId") int stockId, Model model) {

  	Customer user = (Customer) model.getAttribute("session_customer");
  	String myString= LocalDateTime.now().toString().replace('T',' ');

  	
  		if(user != null) {
  		
    	double currentBalance = user.getBalance();

  		if(currentBalance > (price*quantity)) {
  		
    	orderBookService.newOrder(new OrderBook(orderType,quantity,price,stockRegion,stockName,myString,user.getCustomerId(),stockId));
    	
    	// TradingHistory
    	thService.newTradingHistory(new TradingHistory(orderType,quantity,price,myString,user.getCustomerId(),stockId));
    	
  		}
    	
    	if (orderType.equalsIgnoreCase("sell")) {
    	
    	 currentBalance += (price*quantity);
    	 customerService.modifyCustomerBalance(currentBalance, user.getCustomerId());
    	
    	}else if(orderType.equalsIgnoreCase("buy") && currentBalance > (price*quantity)) {
    		
    	 currentBalance -= (price*quantity);
    	 customerService.modifyCustomerBalance(currentBalance, user.getCustomerId());
    	 
    	}
 
    	model.addAttribute("session_customer", new Customer(user.getCustomerId(),user.getFirstName(),user.getLastName(),user.getEmail(),user.getPassword(),currentBalance));
    	
	 	 
        List<OrderBook> orderBookList =  orderBookService.displayOrderBooks();
		mv.addObject("orderBookList",orderBookList); 
		mv.setViewName("order_book");	
		return mv; 
	}else {
		mv.setViewName("noUser");
		return mv;
	}
	}
  		
    
    @GetMapping("/stocks/orderbook")
	public ModelAndView newOrder(Model model) {	 
	 	 
        List<OrderBook> orderBookList =  orderBookService.displayOrderBooks();
		mv.addObject("orderBookList",orderBookList); 
		mv.setViewName("order_book");	
		return mv; 
	}
    
    @GetMapping("/stocks/orderbook/orderByPrice")
	public ModelAndView newOrder2() {
	 	 
        List<OrderBook> orderBookList =  orderBookService.displayOrderBooksByPrice();
		mv.addObject("orderBookList",orderBookList); 
		
		mv.setViewName("order_book");
		
		
		return mv; 
	}
    

    @GetMapping("/stocks/orderbook/orderByQuantity")
	public ModelAndView newOrder3() {
	 	 
        List<OrderBook> orderBookList =  orderBookService.displayOrderBooksByQuantity();
		mv.addObject("orderBookList",orderBookList); 
		
		mv.setViewName("order_book");
	
		
		return mv; 
	}
    
    
    
    
}
