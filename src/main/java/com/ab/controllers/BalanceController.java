package com.ab.controllers;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.ab.models.Customer;

import com.ab.models.OrderBook;
import com.ab.models.Stock;

import com.ab.servicies.CustomerService;
import com.ab.servicies.OrderBookService;

@SessionAttributes({"session_customer"})
@Controller
public class BalanceController{
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private OrderBookService orderBookService;
	
	//global ModelAndView variable
		ModelAndView mv = new ModelAndView();
		
	@GetMapping("balance")
	public String balance() {
		return "balance";	}


  @PostMapping("/depositBalance")
   public ModelAndView depositBalance(@RequestParam("deposit") Double balance, @ModelAttribute("session_customer") Customer customer,@ModelAttribute("session_stock") Stock stock,Model model) {
	
		Customer user = (Customer) model.getAttribute("session_customer");
	
	    Double currentBalance = user.getBalance(); 
		
	    Double depositBalance = currentBalance + balance;	    
		
		customerService.modifyCustomerBalance(depositBalance, user.getCustomerId());
		
		model.addAttribute("session_customer", new Customer(user.getCustomerId(),user.getFirstName(),user.getLastName(),user.getEmail(),user.getPassword(),depositBalance));
		List<OrderBook> orderBookCustomerList =  orderBookService.findCustomerOrders(customer.getCustomerId());
        System.out.println(orderBookCustomerList);
        
        mv.addObject("orderBookCustomerList",orderBookCustomerList); 

		mv.addObject("user",user); 
		mv.setViewName("portfolio");	
		return mv; 
	
}
  
  
  @PostMapping("/withdrawBalance")
  public ModelAndView withdrawBalance(@RequestParam("withdraw") Double balance,@ModelAttribute("session_customer") Customer customer,@ModelAttribute("session_stock") Stock stock,Model model ) {

		Customer user = (Customer) model.getAttribute("session_customer");
	
	    Double currentBalance = user.getBalance(); 
		
	    Double withdrawBalance = currentBalance - balance;	    
		
		customerService.modifyCustomerBalance(withdrawBalance, user.getCustomerId());
		
		
		model.addAttribute("session_customer", new Customer(user.getCustomerId(),user.getFirstName(),user.getLastName(),user.getEmail(),user.getPassword(),withdrawBalance));
		
		List<OrderBook> orderBookCustomerList =  orderBookService.findCustomerOrders(customer.getCustomerId());
        System.out.println(orderBookCustomerList);
        
        mv.addObject("orderBookCustomerList",orderBookCustomerList); 
		mv.addObject("user",user); 
		mv.setViewName("portfolio");	
		return mv; 
			
  }
  

}