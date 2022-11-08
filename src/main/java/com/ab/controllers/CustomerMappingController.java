package com.ab.controllers;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.ab.models.Customer;
import com.ab.models.Stock;
import com.ab.servicies.CustomerService;
import com.ab.servicies.StockService;



@SessionAttributes({"session_customer"})
@Controller
public class CustomerMappingController {
	
	@Autowired 
	private CustomerService customerService;
	@Autowired
	private StockService stockService;
	
	
	@ModelAttribute
	public Customer customer() {
		
		return new Customer();
	}
	
	
//Login Operation -GET
	@GetMapping("/login")
	public String login() {
		
		return "login"; 
	}
	
	
	//Login Operation -POST	
  @PostMapping("/login")
  public ModelAndView loginProcess(@ModelAttribute Customer c, Model model ) {
	 
	  ModelAndView mv = new ModelAndView();
	 Customer  loginCustomer = customerService.loginCustomer(c.getEmail(), c.getPassword());

	  
	  model.addAttribute("session_customer", loginCustomer);
	  
	  
	 
	  if(loginCustomer != null) {
	    	List<Stock> stocks = stockService.displayStocks();			
	    	mv.addObject("stockList",stocks); 	
	    	mv.setViewName("stock_list");
	    	return mv; 	
	   }
    	else {
    		mv.setViewName("noUser");
    		return mv;

    	}
  }  
  
  //Logout Operation
  @GetMapping("/logout")
  public ModelAndView logout(SessionStatus session) {

  	session.setComplete();	

  	ModelAndView mv = new ModelAndView();
  		
  	List<Stock> stocks = stockService.displayStocks();		
  		
  	mv.addObject("stockList",stocks); 
  		
  	mv.setViewName("stock_list");

  	return mv; 
  		
  	
  }
	
	
	//Registration-POST
  @GetMapping("/register")
  public String showRegistrationForm (){
  	return "register";
  }
  
  
	  @PostMapping("/registerCustomer")
	    public String registerProcess(Customer c) {
	    	
	    	Customer registeredCustomer = customerService.registerCustomer(c);
	        	
	    	if(registeredCustomer != null) {
	    	 return "login";
		   }
	    	 return "register";
	    	}
	    
	  



		
}
