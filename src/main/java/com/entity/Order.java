package com.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Tables;

@Entity
@Table(name = "order_book")
public class Order {
	@Id
	@GeneratedValue
	private int id;
	
	private String orderID;
	
	@OneToOne
	@JoinColumn(name = "userID")
	private User user;
	
	@OneToOne
	@JoinColumn(name = "bookID")
	private Book book;
	
	private String address;
	
	private String paymentType;
	
	private double totalPrice;

	public Order() {
	}

	public Order(String orderID, User user, Book book, String address, String paymentType) {
		
		this.orderID = orderID;
		this.user = user;
		this.book = book;
		this.address = address;
		this.paymentType = paymentType;
		this.totalPrice = book.getPrice();
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOrderID() {
		return orderID;
	}

	public void setOrderID(String orderID) {
		this.orderID = orderID;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
		this.totalPrice = book.getPrice();
	}


	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", orderID=" + orderID + ", user=" + user.getfName() + ", book=" + book.getBookName() + ", paymentType="
				+ ", address=" + this.address + paymentType + ", totalPrice=" + totalPrice + "]";
	}
	
	
	
	
	
	
}
