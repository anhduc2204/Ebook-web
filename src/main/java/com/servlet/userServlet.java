package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.userDAO;
import com.entity.User;

/**
 * Servlet implementation class userServlet
 */
@WebServlet(urlPatterns = {"/register", "/login", "/logout", "/edit_profile", "/change_password", "/edit_address"})
public class userServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		session.removeAttribute("userObj");
		session.removeAttribute("reqPage");
		session.setAttribute("succMsg", "Logout Successfully");
		resp.sendRedirect("login.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; utf-8");
		String action = request.getParameter("action");
		if(action.equals("register")) {
			userRegister(request, response);
		}
		else if(action.equals("login")) {
			userLogin(request, response);
		}
		else if(action.equals("edit_profile")) {
			editProfile(request, response);
		}
		else if(action.equals("change_password")) {
			changePassword(request, response);
		}
		else if(action.equals("edit_address")) {
			editAddress(request, response);
		}
		
	}
	
	protected void userRegister(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String fname = req.getParameter("fName") + "";
		String email = req.getParameter("email") + "";
		String phoneNo = req.getParameter("phoneNo") + "";
		String password = req.getParameter("password") + "";
		String check = req.getParameter("check");
		
		HttpSession session = req.getSession();
		
		User us = new User();
		us.setfName(fname);
		us.setEmail(email);
		us.setPassword(password);
		us.setPhoneNo(phoneNo);
		
		session.setAttribute("user", us);
		
		userDAO usDAO = new userDAO();
		if(!usDAO.checkExistsEmail(us)) {
			if(check!= null) {
				boolean f =  usDAO.userRegister(us);
				if(f) {
					session.setAttribute("succMsg", "Registration Successfully...");
					res.sendRedirect("register.jsp");
				}
				else {
					session.setAttribute("failedMsg", "Something wrong on server");					
					res.sendRedirect("register.jsp");
				}
			}
			else {
				session.setAttribute("failedMsg", "Please Agree terms & Condition");
				res.sendRedirect("register.jsp");
			}
		}
		else {
			session.setAttribute("failedMsg", "Email has been used");
			res.sendRedirect("register.jsp");
		}
		
	}
	
	protected void userLogin(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String reqPage = session.getAttribute("reqPage") + "";
		
		if(reqPage.equalsIgnoreCase("null")) {
			reqPage = "index.jsp";
		}
		
		String email = req.getParameter("email") + "";
		String password = req.getParameter("password") + "";
		
		User us = new User();
		us.setEmail(email);
		us.setPassword(password);
		
		boolean f = false;
		userDAO usDAO = new userDAO();
		User user = new User();
		
		if(us.getEmail().equals("admin@gmail.duc.com") && us.getPassword().equals("admin")) {
			f = true;
			user.setfName("Admin");
			session.setAttribute("userObj", user);
			res.sendRedirect("admin/home.jsp");							 
		}
		else {
			user = usDAO.userLogin(us);
			session.setAttribute("userObj", user);
			if(user != null) {
				session.setAttribute("userObj", user);
				res.sendRedirect(reqPage);	
			}
			else {
				session.setAttribute("userObj", us);
				session.setAttribute("failedMsg", "Email or password invalid");
				res.sendRedirect("login.jsp");
			}
		}

	}
	
	
	protected void editProfile(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String currentPassword = req.getParameter("currentPassword");
		String fname = req.getParameter("fName");
		String email = req.getParameter("email");
		String phoneNo = req.getParameter("phoneNo");
		int userID = Integer.parseInt(req.getParameter("userID"));
		
		userDAO usDAO = new userDAO();
		User user = usDAO.getUserByID(userID);
		
		HttpSession session = req.getSession();
		
		if(currentPassword.equals(user.getPassword()) == false) {
			session.setAttribute("failedMsg", "Invalid Password");				
			res.sendRedirect("edit_profile.jsp");
		}
		else {
			user.setfName(fname);
			user.setEmail(email);
			user.setPhoneNo(phoneNo);
			
			boolean f = usDAO.userUpdate(user);
			if(f) {
				session.setAttribute("userObj", user);
				session.setAttribute("succMsg", "Update Successfully");				
				res.sendRedirect("edit_profile.jsp");
			}else {
				session.setAttribute("failedMsg", "Something Wrong On Server");				
				res.sendRedirect("edit_profile.jsp");
			}
			
		}
	}
	
	
	protected void changePassword(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String currentPassword = req.getParameter("currentPassword");
		String newPassword = req.getParameter("newPassword");
		String newPassword_check = req.getParameter("newPassword_check");
		int userID = Integer.parseInt(req.getParameter("userID"));
		
		userDAO usDAO = new userDAO();
		User user = usDAO.getUserByID(userID);
		
		HttpSession session = req.getSession();
		
		if(currentPassword.equals(user.getPassword()) == false) {
			
			session.setAttribute("failedMsg", "Invalid Current Password");				
			res.sendRedirect("edit_profile.jsp");
			
		}
		else if(newPassword_check.equals(newPassword) == false){
			
			session.setAttribute("failedMsg", "New password does not match");				
			res.sendRedirect("edit_profile.jsp");
			
		}else {
			
			user.setPassword(newPassword);
			boolean f = usDAO.userUpdate(user);
			if(f) {
				session.setAttribute("userObj", user);
				session.setAttribute("succMsg", "Update Successfully");				
				res.sendRedirect("edit_profile.jsp");
			}else {
				session.setAttribute("failedMsg", "Something Wrong On Server");				
				res.sendRedirect("edit_profile.jsp");
			}
			
		}
	}
	
	protected void editAddress(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String currentPassword = req.getParameter("currentPassword");
		String address = req.getParameter("address");
		int userID = Integer.parseInt(req.getParameter("userID"));
		
		userDAO usDAO = new userDAO();
		User user = usDAO.getUserByID(userID);
		
		HttpSession session = req.getSession();
		
		if(currentPassword.equals(user.getPassword()) == false) {
			session.setAttribute("failedMsg", "Invalid Password");				
			res.sendRedirect("edit_address.jsp");
		}
		else {
			user.setAddress(address);
			
			boolean f = usDAO.userUpdate(user);
			if(f) {
				session.setAttribute("userObj", user);
				session.setAttribute("succMsg", "Update Successfully");				
				res.sendRedirect("edit_address.jsp");
			}else {
				session.setAttribute("failedMsg", "Something Wrong On Server");				
				res.sendRedirect("edit_address.jsp");
			}
			
		}
	}

}
