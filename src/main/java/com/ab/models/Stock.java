package com.ab.models;


import javax.persistence.Entity;
import javax.persistence.Id;


@Entity
public class Stock {
@Id
private int stockId;
private String stockName;
private String stockRegion;
private int stockQuantity;
private double stockPrice;



public Stock() {
	super();
}

public Stock(int stockId, String stockName, String stockRegion, int stockQuantity) {
	super();
	this.stockId = stockId;
	this.stockName = stockName;
	this.stockRegion = stockRegion;
	this.stockQuantity = stockQuantity;
}

public Stock(int stockId, String stockName, String stockRegion, int stockQuantity, double stockPrice) {
	super();
	this.stockId = stockId;
	this.stockName = stockName;
	this.stockRegion = stockRegion;
	this.stockQuantity = stockQuantity;
	this.stockPrice = stockPrice;
}




public int getStockId() {
	return stockId;
}

public void setStockId(int stockId) {
	this.stockId = stockId;
}

public String getStockName() {
	return stockName;
}

public void setStockName(String stockName) {
	this.stockName = stockName;
}

public String getStockRegion() {
	return stockRegion;
}

public void setStockRegion(String stockRegion) {
	this.stockRegion = stockRegion;
}



public int getStockQuantity() {
	return stockQuantity;
}

public void setStockQuantity(int stockQuantity) {
	this.stockQuantity = stockQuantity;
}

public double getStockPrice() {
	return stockPrice;
}

public void setStockPrice(double stockPrice) {
	this.stockPrice = stockPrice;
}


@Override
public String toString() {
	return "Stock [stockId=" + stockId + ", stockName=" + stockName + ", stockRegion=" + stockRegion
			+ ", stockQuantity=" + stockQuantity + ", stockPrice=" + stockPrice + "]";
}




}
