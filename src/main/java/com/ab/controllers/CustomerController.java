//package com.ab.controllers;
//
//import java.util.List;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.SessionAttributes;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.ab.models.Customer;
//import com.ab.models.Stock;
//import com.ab.servicies.CustomerService;
//import com.ab.servicies.StockService;
//
//
//@SessionAttributes({"session_customer"})
//@Controller
//public class CustomerController {
//	
//	@Autowired 
//	private CustomerService customerService;
//	@Autowired
//	private StockService stockService;
//	
//	@ModelAttribute
//	public Customer customer() {
//		
//		return new Customer();
//	}
//	
//	
////	  @PostMapping("/registerCustomer")
////	    public String registerProcess(@ModelAttribute Customer c, Model model) {
////	    	
////	    	Customer registeredCustomer = customerService.registerCustomer(c);
////	    	
////	    	model.addAttribute("session_customer", registeredCustomer);
////	    	
////	    	if(registeredCustomer != null) {
////	    		
////	    		return "register_success";
////		   }
////	    	else {
////	    		return "reg_faiure";
////	    	}
////	    }
//	
////	  @PostMapping("/registerCustomer")
////	    public String registerProcess(Customer c) {
////	    	
////	    	Customer registeredCustomer = customerService.registerCustomer(c);
////	        	
////	    	if(registeredCustomer != null) {
////	    		
////	    		return "login";
////		   }
////	    	else {
////	    		return "register";
////	    	}
////	    }
//	  
//	  @PostMapping("/login")
//	  public ModelAndView loginProcess(@ModelAttribute Customer c, Model model ) {
//		  		  
//		 Customer  loginCustomer = customerService.loginCustomer(c.getEmail(), c.getPassword());
//		  
//		  model.addAttribute("session_customer", loginCustomer);
//		  
//		 
//		  if(loginCustomer != null) {
//			  
//			  ModelAndView mv = new ModelAndView();
//	    		
//		    	List<Stock> stocks = stockService.displayStocks();		
//		    		
//		    	mv.addObject("stockList",stocks); 
//		    		
//		    	mv.setViewName("stock_list");
//
//		    	return mv; 
//	    		
//		   }
//	    	else {
//	    		ModelAndView mv = new ModelAndView();
//	    		mv.setViewName("register");
//	    		return mv;
//	    	}
//	  }
//	  
//	 
//	  
//	  
//	  
//	  
//	  
//	  
//}
