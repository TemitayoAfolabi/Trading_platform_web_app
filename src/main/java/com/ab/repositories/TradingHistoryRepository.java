package com.ab.repositories;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


import com.ab.models.TradingHistory;


@Repository
public interface TradingHistoryRepository extends JpaRepository<TradingHistory, Integer>{

	
	@Transactional
	@Query("From TradingHistory th WHERE th.customerId = :customerId")
	public List<TradingHistory> filterTradingHistoryByCustomerId(@Param("customerId") int customerId);
	
	 

}
