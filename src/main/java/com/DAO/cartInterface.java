package com.DAO;

import java.util.List;

import com.entity.Book;
import com.entity.Cart;
import com.entity.User;

public interface cartInterface {
	
	public boolean addCart(Cart cart);
	
	public List<Book> getBookByUser(User user);
	
	public boolean removeCart(Cart cart);
		
	public Cart getCartByUserAndBook(User u, Book b);
	
	public List<Cart> getCartByUser(User u);
	
}
