package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.cartDAO;
import com.DAO.orderDAO;
import com.entity.Cart;
import com.entity.Order;
import com.entity.User;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet(urlPatterns = {"/order", "/my_order"})
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		req.setCharacterEncoding("utf-8");
//		res.setCharacterEncoding("utf-8");
//		res.setContentType("text/html; utf-8");
//		
//		String action = req.getParameter("action");
//		
//		if(action.equals("all_order")) {
//			getAllOrder(req, res);
//		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; utf-8");

		String address = request.getParameter("address");
		String paymentType = request.getParameter("paymentType");
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("userObj");
		cartDAO cDAO = new cartDAO();
		List<Cart> listCart = cDAO.getCartByUser(user);
		
		Order ord = null;
		List<Order> listOrd = new ArrayList<Order>();
		Random random = new Random();
		for(Cart cart : listCart) {
			String ordID = "BOOK-ORD-0" + random.nextInt(1000);
			
			ord = new Order(ordID, user, cart.getBook(), address, paymentType);
			listOrd.add(ord);
		}
		
		orderDAO oDAO = new orderDAO();
		boolean f = oDAO.addListOrder(listOrd);
		
		if(f) {
			session.setAttribute("succMsg", "Order Successfully");
			for(Cart cart : listCart) {
				cDAO.removeCart(cart);
			}
			
			response.sendRedirect("cart.jsp");
		}
		else {
			session.setAttribute("failedMsg", "Something wrong on Server");
			response.sendRedirect("cart.jsp");
		}
		
		
 	}
	
	protected void getAllOrder(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
//		HttpSession session = req.getSession();
//		User user = (User) session.getAttribute("userObj");
//		
//		orderDAO oDAO = new orderDAO();
//		
//		List<Order> list = oDAO.getAllOrderByUser(user);
		
		
	}

}
