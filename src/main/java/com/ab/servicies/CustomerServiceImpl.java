package com.ab.servicies;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.ab.models.Customer;
import com.ab.repositories.CustomerRepository;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerRepository customerRepository;
	
	@Override
	public Customer registerCustomer(Customer c) {
		
		return customerRepository.save(c);
		
	}

	@Override

	public Customer loginCustomer(String email, String password) {
		
		return customerRepository. findByRecord(email, password);


	}

	@Override
	public void modifyCustomerBalance(double balance, int id) {
		// TODO Auto-generated method stub
		 customerRepository.modifyCustomerBalance(balance, id);
	}

	

}

