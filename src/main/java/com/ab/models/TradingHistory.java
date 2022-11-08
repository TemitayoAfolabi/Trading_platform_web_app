package com.ab.models;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class TradingHistory {

	@Id
	private int tradingId;
	
	private String tradingType;
	private int tradingQuantity;
	private double tradingPrice;

	private String tradingTimestamp;
	
//	@OneToMany(cascade= CascadeType.ALL)
//	@JoinColumn(name = "FK_customerId")
	private int customerId;
//	@OneToMany(cascade= CascadeType.ALL)
//	@JoinColumn(name = "FK_stockId")
	private int stockId;

	
	
	public TradingHistory() {
	}
	
	public TradingHistory(String tradingType, int tradingQuantity, double tradingPrice,
			String tradingTimestamp, int customerId, int stockId) {

		this.tradingType = tradingType;
		this.tradingQuantity = tradingQuantity;
		this.tradingPrice = tradingPrice;
		this.tradingTimestamp = tradingTimestamp;
		this.customerId = customerId;
		this.stockId = stockId;
	}
	
	
	public void setTradingId(int tradingId) {
		this.tradingId = tradingId;
	}
	public void setTradingType(String tradingType) {
		this.tradingType = tradingType;
	}
	public void setTradingQuantity(int tradingQuantity) {
		this.tradingQuantity = tradingQuantity;
	}
	public void setTradingPrice(double tradingPrice) {
		this.tradingPrice = tradingPrice;
	}
	public void setTimestamp(String timestamp) {
		this.tradingTimestamp = timestamp;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public void setStockId(int stockId) {
		this.stockId = stockId;
	}
	
	
	public int getTradingId() {
		return tradingId;
	}
	public String getTradingType() {
		return tradingType;
	}
	public int getTradingQuantity() {
		return tradingQuantity;
	}
	public double getTradingPrice() {
		return tradingPrice;
	}
	public String getTimestamp() {
		return tradingTimestamp;
	}
	public int getCustomerId() {
		return customerId;
	}
	public int getStockId() {
		return stockId;
	}
	@Override
	public String toString() {
		return "TradingHistory [tradingId=" + tradingId + ", tradingType=" + tradingType + ", tradingQuantity="
				+ tradingQuantity + ", tradingPrice=" + tradingPrice + ", timestamp=" + tradingTimestamp + ", customerId="
				+ customerId + ", stockId=" + stockId + "]";
	}
	
	
	
	
}
