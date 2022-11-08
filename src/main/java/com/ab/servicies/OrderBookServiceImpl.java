package com.ab.servicies;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.ab.models.OrderBook;
import com.ab.models.Stock;
import com.ab.repositories.OrderBookRepository;
import com.ab.repositories.StockRepository;

@Service
public class OrderBookServiceImpl implements OrderBookService {

	@Autowired
	private OrderBookRepository orderBookRepository;
	

	
	@Override
	public OrderBook newOrder(OrderBook orderBook) {
		
		return orderBookRepository.save(orderBook);
	}
	//Format the date
	@Override
	public List<OrderBook> displayOrderBooks(){
		return  orderBookRepository.findAll();
	}

	@Override
	public List<OrderBook> displayOrderBooksByPrice() {
		return orderBookRepository.findAll(Sort.by(Sort.Direction.DESC, "orderPrice"));
	}

	@Override
	public List<OrderBook> displayOrderBooksByQuantity() {
		// TODO Auto-generated method stub
		return orderBookRepository.findAll(Sort.by(Sort.Direction.DESC, "orderQuantity"));
	}

	@Override
	public List<OrderBook> displayOrderBooksByRegion() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OrderBook> displayOrderBooksByStockId() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<OrderBook> findCustomerOrders(int id) {
		// TODO Auto-generated method stub
		return orderBookRepository.showOrderBookCustomerId(id);
	}
}
