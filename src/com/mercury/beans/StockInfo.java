package com.mercury.beans;

public class StockInfo {
	private String symbol;
	private String name;
	private double price;
	private double change;
	private String pchange;
	private Stock stock;
	private int quantity;
	
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public StockInfo(){}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getSymbol() {
		return symbol;
	}
	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getChange() {
		return change;
	}
	public void setChange(double change) {
		this.change = change;
	}
	public String getPchange() {
		return pchange;
	}
	public void setPchange(String pchange) {
		this.pchange = pchange;
	}

	public Stock getStock() {
		return stock;
	}

	public void setStock(Stock stock) {
		this.stock = stock;
	}
	
}
