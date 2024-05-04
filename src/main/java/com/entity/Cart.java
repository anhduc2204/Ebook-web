package com.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class Cart {
	@Id
	@GeneratedValue
	int cartID;
	
	@OneToOne
	@JoinColumn(name = "userID")
	private User user;
	
	@OneToOne
	@JoinColumn(name = "bookID")
	private Book book;
	
	private double totalPrice;

	public Cart() {
		
	}

	public Cart(User user, Book book) {
		this.user = user;
		this.book = book;
		this.totalPrice = book.getPrice();
	}

	public int getCartID() {
		return cartID;
	}

	public void setCartID(int cartID) {
		this.cartID = cartID;
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
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	
	@Override
	public String toString() {
		return "Cart [cartID=" + cartID + ", userName=" + user.getfName() + ", bookName=" + book.getBookName() 
					+ ", bookAuthor=" + book.getAuthor() + ", totalPrice=" + totalPrice + "]";
	}
	
	
	
}
