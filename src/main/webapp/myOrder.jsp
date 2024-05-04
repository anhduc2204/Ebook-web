<%@page import="com.entity.Order"%>
<%@page import="com.entity.User"%>
<%@page import="com.DAO.orderDAO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Order</title>
<%@ include file ="allComponent/allCss.jsp" %>


</head>
<body style="background-color: #f0f2f2">
	<header>
		<%@include file="allComponent/navbar.jsp"%>
	</header>
	
	<c:if test="${empty userObj}">
		<% session.setAttribute("reqPage", "myOrder.jsp"); %>
		<c:redirect url="login.jsp"/>
	</c:if>
	
	<div class="container mt-5">

		<table class="table table-striped">
			<thead>
				<tr class="table-dark">
					<th scope="col">Order ID</th>
					<th scope="col">Image</th>
					<th scope="col">Book Name</th>
					<th scope="col">Price</th>
					<th scope="col">User Name</th>
					<th scope="col">Email</th>
					<th scope="col">Address</th>
					<th scope="col">PaymentType</th>
				</tr>
			</thead>
			<tbody>
				<%
				User user = (User) session.getAttribute("userObj");
				
				orderDAO oDAO = new orderDAO();
				
				List<Order> list = oDAO.getAllOrderByUser(user);
				for (Order order : list) {
				%>

				<tr>
					<th><%=order.getOrderID()%></th>
					<td><img src="book/<%=order.getBook().getPhoto()%>"
						style="width: 50px; heigt: 50px"></td>
					<td><%=order.getBook().getBookName()%></td>
					<td><%=order.getTotalPrice()%></td>
					<td><%=order.getUser().getfName()%></td>
					<td><%=order.getUser().getEmail()%></td>
					<td><%=order.getUser().getAddress()%></td>
					<td><%=order.getPaymentType()%></td>
				</tr>
				<%
				}
				%>

			</tbody>
		</table>

	</div>

	<%@ include file="allComponent/footer.jsp"%>
</body>
</html>