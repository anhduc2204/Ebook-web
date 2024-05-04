<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home: Admin</title>
<%@include file="allCss.jsp" %>

<style type="text/css">
a{
	text-decoration: none;
	color: black;
}
</style>
</head>
<body style="background-color: #f0f2f2">

	<header>
	<%@include file="navbar.jsp"%>
	</header>
	
	<c:if test="${empty userObj}">
		<c:redirect url="../login.jsp"/>
	</c:if>
	
	<h2 class="text-center text-primary">Hello Admin</h2>
	<section class="container">
		<div class="row mt-3 p-3">
			<article class="col-md-3">
				<a href="add_books.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-square-plus fa-3x text-primary"></i> <br>
							<h4>Add book</h4>
							-----------------
						</div>
					</div>
				</a>
			</article>
			
			<article class="col-md-3">
				<a href="all_books.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-book-open fa-3x text-success"></i> <br>
							<h4>All book</h4>
							-----------------
						</div>
					</div>
				</a>
			</article>
			
			<article class="col-md-3">
				<a href="orders.jsp">
					<div class="card">
					<div class="card-body text-center">
						<i class="fa-solid fa-box-open fa-3x text-warning"></i> <br>
						<h4>Orders</h4>
						-----------------
					</div>
				</div>
				</a>
			</article>
			
			<article class="col-md-3">
				<a href = "../login.jsp" data-bs-toggle="modal"
					data-bs-target="#logoutModal">
					<div class="card">
					<div class="card-body text-center">
						<i class="fa-solid fa-right-from-bracket fa-3x text-danger"></i> <br>
						<h4>Logout</h4>
						-----------------
					</div>
				</div>
				</a>
			</article>
			
			
		</div>
	</section>

	<!-- Modal -->
	<div class="modal fade" id="logoutModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body text-center">
					<h4 class="mb-3">Do you want logout?</h4>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<a href="../logout" class="btn btn-primary">Logout</a>
				</div>
				<div class="modal-footer text-center"></div>
			</div>
		</div>
	</div>


		<%@include file="footer.jsp"%>
</body>
</html>