package com.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.bookDAO;
import com.entity.Book;
import com.entity.User;

/**
 * Servlet implementation class addB
 */
@WebServlet(urlPatterns = { "/add_book", "/update_book", "/delete_book", "/sell_book"})
@MultipartConfig
public class bookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public bookServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int bookID = Integer.parseInt(req.getParameter("bookID"));
		bookDAO bDAO = new bookDAO();
		Book b = new Book();
		b.setBookID(bookID);
		boolean f = bDAO.deleteBook(b);
		
		HttpSession session = req.getSession();
		
		if (f) {
			session.setAttribute("succMsg", "Book Delete Successfully");
			res.sendRedirect("admin/all_books.jsp");
		} else {
			session.setAttribute("failedMsg", "Something wrong on Server");
			res.sendRedirect("admin/all_books.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html; utf-8");
		String action = req.getParameter("action");
		if(action.equals("add_book")) {
			addBook(req, res);
		}
		else if(action.equals("update_book")) {
			updateBook(req, res);
		}
		else if(action.equals("sell_book")) {
			sellBook(req, res);
		}
	}

	protected void addBook(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String bookName = req.getParameter("bookName");
		String author = req.getParameter("author");
		String price_str = req.getParameter("price");
		double price = 0;
		if (price_str != null) {
			price = Double.parseDouble(price_str);
		}
		String category = req.getParameter("btype");
		String status = req.getParameter("status");
		Part part = req.getPart("photo");
		String photo = part.getSubmittedFileName();

		Book b = new Book(bookName, author, price, category, status, photo, "admin");

		bookDAO bDAO = new bookDAO();
		boolean f = false;
		f = bDAO.addBook(b);
		HttpSession session = req.getSession();
		if (f) {

			String path = getServletContext().getRealPath("") + "book";
			System.out.println(path);
			File file = new File(path);
			part.write(path + File.separator + photo);
			

			session.setAttribute("succMsg", "Book Add Successfully");
			res.sendRedirect("admin/add_books.jsp");
		} else {
			session.setAttribute("failedMsg", "Something wrong on Server");
			res.sendRedirect("admin/add_books.jsp");
		}
	}

	protected void updateBook(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int bookID = Integer.parseInt(req.getParameter("bookID"));
		String bookName = req.getParameter("bookName");
		String author = req.getParameter("author");
		String price_str = req.getParameter("price");
		double price = 0;
		if (price_str != null) {
			price = Double.parseDouble(price_str);
		}
		String status = req.getParameter("status");
		Part part = req.getPart("photo");
		String photo = part.getSubmittedFileName();
		
		bookDAO bDAO = new bookDAO();
		Book b = null;
		b = bDAO.getBookById(bookID);
		b.setBookName(bookName);
		b.setAuthor(author);
		b.setPrice(price);
		b.setStatus(status);
		if(photo !="") {
			b.setPhoto(photo);			
		}
		boolean f = bDAO.updateBook(b);
		HttpSession session = req.getSession();
		if (f) {
			//thay ảnh
			if(photo != "") {
				String path = getServletContext().getRealPath("") + "book";
				File folder = new File(path);
				if (folder.exists() && folder.isDirectory()) {
					part.write(path + File.separator + photo);
					//xóa ảnh cũ
					
				}
				
			}

			session.setAttribute("succMsg", "Book Update Successfully");
			res.sendRedirect("admin/all_books.jsp");
		} else {
			session.setAttribute("failedMsg", "Something wrong on Server");
			res.sendRedirect("admin/all_books.jsp");
		}
	}
	
	protected void sellBook(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User us = (User) session.getAttribute("userObj");
		String email = us.getEmail();
		String bookName = req.getParameter("bookName");
		String author = req.getParameter("author");
		String price_str = req.getParameter("price");
		double price = 0;
		if (price_str != null) {
			price = Double.parseDouble(price_str);
		}
		String category = "Old";
		String status = "active";
		Part part = req.getPart("photo");
		String photo = part.getSubmittedFileName();

		Book b = new Book(bookName, author, price, category, status, photo, email);

		bookDAO bDAO = new bookDAO();
		boolean f = false;
		f = bDAO.addBook(b);
		
		if (f) {

			String path = getServletContext().getRealPath("") + "book";
			File file = new File(path);
			part.write(path + File.separator + photo);
			

			session.setAttribute("succMsg", "Book Add Successfully");
			res.sendRedirect("sell_book.jsp");
		} else {
			session.setAttribute("failedMsg", "Something wrong on Server");
			res.sendRedirect("sell_books.jsp");
		}
	}

}
