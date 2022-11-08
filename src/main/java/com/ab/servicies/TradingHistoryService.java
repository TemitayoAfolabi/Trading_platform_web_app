package com.ab.servicies;

import java.util.List;


import com.ab.models.TradingHistory;


public interface TradingHistoryService {
	
	public TradingHistory newTradingHistory(TradingHistory tradingHistory);
	
	public List<TradingHistory> filterTradingHistoryByCustomerId(int customerId);
	
	public List<TradingHistory> sortTradingHistoryByQuantity();
	
	public List<TradingHistory> sortTradingHistoryByPrice();
	
	public List<TradingHistory> sortTradingHistoryByTime();
	

}
