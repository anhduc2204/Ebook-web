package com.DAO;

import java.util.List;

import com.entity.Book;

public interface bookInterface {
	public boolean addBook(Book b);
	
	public boolean updateBook(Book b);

	public List<Book> getAllBooks();
	
	public Book getBookById(int id);
	
	public boolean deleteBook(Book b);
	
	public List<Book> getNewBook();

	public List<Book> getRecentBook();

	public List<Book> getOldBook();
	
	public List<Book> getAllNewBook();
	
	public List<Book> getAllRecentBook();
	
	public List<Book> getAllOldBook();
	
	public List<Book> searchBook(String strKey);
	
	
}

