package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.DAO.bookDAO;
import com.DAO.cartDAO;
import com.entity.Book;
import com.entity.Cart;
import com.entity.User;

/**
 * Servlet implementation class cartServlet
 */
@WebServlet(urlPatterns = {"/add_cart", "/remove_cart"})
public class cartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; utf-8");
		
		String requestURI = request.getRequestURI();
		int i1 = requestURI.indexOf("add_cart");
		int i2 = requestURI.indexOf("remove_cart");
		if(i1 != -1) {
			addCart(request, response);;
		}
		else if(i2 != -1) {
			removeCart(request, response);;
		}
			
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	protected void addCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String prevJsp = servletUtil.getPreviousPage(request);
		
		HttpSession session = request.getSession();
		User us = (User) session.getAttribute("userObj");
		
		int bookID = Integer.parseInt(request.getParameter("bID"));
		bookDAO bDAO = new bookDAO();
		Book book = bDAO.getBookById(bookID);
		
		Cart cart = new Cart(us, book);
		cartDAO cDAO = new cartDAO();
		boolean f = cDAO.addCart(cart);
		
		if(f) {
			session.setAttribute("msgAddCart", "Add to cart successfully");
			response.sendRedirect(prevJsp);
		}
		else {
			session.setAttribute("msgAddCart", "Add to cart failed");
			response.sendRedirect(prevJsp);
		}
		
	}
	
	protected void removeCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		User us = (User) session.getAttribute("userObj");
		
		int bookID = Integer.parseInt(request.getParameter("bID"));
		bookDAO bDAO = new bookDAO();
		Book book = bDAO.getBookById(bookID);
		
		cartDAO cDAO = new cartDAO();
		Cart cart = cDAO.getCartByUserAndBook(us, book);
		boolean f = cDAO.removeCart(cart);
		
		if(f) {
			session.setAttribute("msgRemoveCart", "Deleted");
			response.sendRedirect("cart.jsp");
		}
		else {
			session.setAttribute("msgRemoveCart", "Deletion failed");
			response.sendRedirect("cart.jsp");
		}
		
	}

}
