package com.ab.servicies;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.ab.models.TradingHistory;
import com.ab.repositories.TradingHistoryRepository;

@Service
public class TradingHistoryServiceImpl implements TradingHistoryService {

	@Autowired
	TradingHistoryRepository thRepository;
	
	
	@Override
	public TradingHistory newTradingHistory(TradingHistory tradingHistory) {
		return thRepository.save(tradingHistory);
	}

	@Override
	public List<TradingHistory> filterTradingHistoryByCustomerId(int customerId) {
		return thRepository.filterTradingHistoryByCustomerId(customerId);
	}

	@Override
	public List<TradingHistory> sortTradingHistoryByQuantity() {
		return thRepository.findAll(Sort.by(Sort.Direction.DESC, "tradingQuantity"));

	}

	@Override
	public List<TradingHistory> sortTradingHistoryByPrice() {
		return thRepository.findAll(Sort.by(Sort.Direction.DESC, "tradingPrice"));
	}

	@Override
	public List<TradingHistory> sortTradingHistoryByTime() {
		return thRepository.findAll(Sort.by(Sort.Direction.DESC, "tradingTimestamp"));
	}

}
