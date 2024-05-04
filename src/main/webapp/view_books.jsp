<%@page import="com.DAO.bookDAO"%>
<%@page import="com.entity.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="allComponent/allCss.jsp"%>
</head>
<body class="bg-body-secondary">
	<header>
		<%@include file="allComponent/navbar.jsp"%>
	</header>

	<section class="container mt-5">
		<div class="row">
		
			<%
			int id = Integer.parseInt(request.getParameter("bid")) ; 
			bookDAO bDAO = new bookDAO(); 
			Book b = bDAO.getBookById(id);
			%>
		
			<div class="col-md-6 text-center border p-3 bg-white">
				<img alt="..." src="book/<%=b.getPhoto()%>"
					style="height: 16rem; width: 12rem;">
				<h4 class="mt-2">Book name: <span class="text-primary"><%=b.getBookName()%></span></h4>
				<h4>Author: <span class="text-primary"><%=b.getAuthor()%></span></h4>
				<h4>Category: <span class="text-primary"><%=b.getBookCategory()%></span></h4>
			</div>

			<div class="col-md-6 text-center border bg-white p-5">
				<h3><%=b.getBookName()%></h3>
				
				<%if(b.getBookCategory().equals("Old")){%>
				<h6 class="text-primary">Contact To Seller</h6>
				<h6 class="text-primary"><i class="fa-solid fa-envelope"></i> Email: <%=b.getEmail()%></h6>
				<%}%>
				
				<div class="row mt-4">
					<div class="col-md-4 text-danger">
						<i class="fa-solid fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger">
						<i class="fa-solid fa-rotate-left fa-2x text-danger"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger">
						<i class="fa-solid fa-truck-fast fa-2x text-danger"></i>
						<p>Free Shipping</p>
					</div>
				</div>

				<div class="row p-3">
					<c:if test="${not empty userObj}">														
					<a href="add_cart?bID=<%=b.getBookID()%>" class="btn btn-primary col-md-3 offset-md-3"><i class="fa-solid fa-cart-plus"></i> Add Cart</a>
					</c:if>
					
					<c:if test="${empty userObj}">
					<% session.setAttribute("reqPage", "view_books.jsp?bid=" + b.getBookID()); %>													
					<a href="login.jsp" class="btn btn-primary col-md-3 offset-md-3"><i class="fa-solid fa-cart-plus"></i> Add Cart</a>
					</c:if>
					
					<a href="#" class="btn btn-danger col-3"><i class="fa-solid fa-money-bill"></i> <%=b.getPrice()%></a>
					
				</div>

			</div>

		</div>

	</section>
	
	<c:if test="${not empty msgAddCart}">
	
	<div id="snackbar">${msgAddCart}</div>
	<%@ include file="allComponent/toast.jsp" %>
	
	<c:remove var="msgAddCart"/>
	</c:if>

	<%@ include file="allComponent/footer.jsp"%>
</body>
</html>