<%@page import="com.entity.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.cartDAO"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<%@ include file="allComponent/allCss.jsp"%>
</head>
<body class="bg-body-secondary">

	<header>
		<%@include file="allComponent/navbar.jsp"%>
	</header>

	<c:if test="${empty userObj}">
		<% session.setAttribute("reqPage", "cart.jsp"); %>
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<section class="container mt-5">
		<c:if test="${not empty succMsg}">
			<h2 class="text-center text-primary mt-5">${succMsg}</h2>
			<c:remove var="succMsg" scope="session" />
		</c:if>

		<c:if test="${not empty failedMsg}">
			<h2 class="text-center text-primary mt-5">${failedMsg}</h2>
			<c:remove var="succMsg" scope="session" />
		</c:if>

		<div class="row">

			<div class="col-xl-6 col-12 mt-3">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Item</h3>
						<table class="table table-hover">
							<thead>
								<tr>
									<th scope="col"></th>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
									<th scope="col">Quantity</th>
								</tr>
							</thead>
							<tbody>

								<%
								User user = (User) session.getAttribute("userObj");
								cartDAO cDAO = new cartDAO();
								List<Book> list = cDAO.getBookByUser(user);
								double totalPrice = 0;
								for (Book b : list) {
									totalPrice += b.getPrice();
								%>

								<tr>
									<td><img src="book/<%=b.getPhoto()%>"
												style="width: 50px; heigt: 50px"></td>
									<th scope="row"><%=b.getBookName()%></th>
									<td><%=b.getAuthor()%></td>
									<td><%=b.getPrice()%></td>
									<td><a href="remove_cart?bID=<%=b.getBookID()%>" class="btn btn-danger btn-sm">Remove</a></td>
								</tr>

								<%} %>
								<tr>
									<th scope="row" class="text-danger">Total Price:</th>
									<td></td>
									<td></td>
									<th class="text-danger"><%=totalPrice%></th>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-xl-6 col-12 mt-3">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Details For Order</h3>
						<form class="row g-3" method ="post" action="order">
							<div class="col-md-6">
								<label for="fName" class="form-label">Name</label> <input
									type="text" class="form-control" id="fName" name="fName"
									value="${userObj.getfName()}" readonly="readonly">
							</div>
							<div class="col-md-6">
								<label for="email" class="form-label">Email</label> <input
									type="email" class="form-control" id="email" name="email"
									value="${userObj.getEmail()}" readonly="readonly">
							</div>
							<div class="col-md-6">
								<label for="phoneNo" class="form-label">Phone Number</label> <input
									type="number" class="form-control" id="phoneNo" name="phoneNo"
									value="${userObj.getPhoneNo()}" readonly="readonly">
							</div>
							<div class="col-md-6">
								<label for="address" class="form-label">Address</label> <input
									type="text" class="form-control" id="address" name="address"
									value="${userObj.getAddress()}" required="required">
							</div>

							<div class="col-md-12">
								<label for="inputPassword4" class="form-label">Payment
									type</label> <select class="form-select"
									aria-label="Default select example" name="paymentType" required="required">
									<option value="COD">Cash On Delivery</option>
								</select>
							</div>
							<div class="col-12 text-center p-3">
								<button type="submit" class="btn btn-primary">Order Now</button>
								<a href="index.jsp" class="btn btn-danger">Continue
									Shopping</a>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>


	</section>
	
	<c:if test="${not empty msgRemoveCart}">
	
	<div id="snackbar">${msgRemoveCart}</div>
	<%@ include file="allComponent/toast.jsp" %>
	
	<c:remove var="msgRemoveCart"/>
	</c:if>
	

	<%@ include file="allComponent/footer.jsp"%>
</body>
</html>