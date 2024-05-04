<%@page import="com.entity.User"%>
<%@page import="com.entity.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.bookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta name="viewport" 
	content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->
<title>Ebook: index</title>

<%@ include file="allComponent/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/book.jpg");
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.truncate-lines-3 {
	display: -webkit-box;
	-webkit-line-clamp: 3; /* Số dòng giới hạn */
	-webkit-box-orient: vertical;
	overflow: hidden;
}

.card-hover :hover {
	background-color: #a7ffeb;
	color: black;
}
</style>

</head>
<body class="bg-body-secondary">

	<%User us = (User) session.getAttribute("userObj"); %>

	<header>
		<%@include file="allComponent/navbar.jsp"%>
	</header>
	<div class="container-fluid back-img">
		<h2 class="text-center text-light">EBook Management System</h2>
	</div>

	<section class="container-fluid mt-5">

		<!-- start recent book -->
		<article class="mb-3">
			<h3 class="text-center mb-4">Recent Book</h3>
			<div class="row row-cols-1 row-cols-md-4 g-4">

			<%
				bookDAO bDAO_1 = new bookDAO();
				List<Book> list_RecentBook = bDAO_1.getRecentBook();
				for (Book b : list_RecentBook) {
				%>

				<div class="col">
					<div class="card card-hover">
						<div class="card-body">
							<img src="book/<%=b.getPhoto()%>"
								class="card-img-top mx-auto d-block mb-2" alt="..."
								style="height: 12rem; width: 9rem;">
							<h5 class="card-title"><%=b.getBookName()%></h5>
							<p class="card-text truncate-lines-3">This is a longer card
								with supporting text below as a natural lead-in to additional
								content. This content is a little bit longer.</p>
							
							<p>Author: <%=b.getAuthor()%></p>
							<p>Categories: <%=b.getBookCategory()%></p>
							<p>Price: <%=b.getPrice()%></p>
							<div class="row">
								<a href="view_books.jsp?bid=<%=b.getBookID()%>" class="btn btn-success btn-sm mt-1">View Details</a>
								
								<%if(us != null){%>
								<a href="add_cart?bID=<%=b.getBookID()%>" class="btn btn-danger btn-sm mt-1">Add Cart</a>								
								<%}else{%>
								<a href="login.jsp" class="btn btn-danger btn-sm mt-1">Add Cart</a>																
								<%}%>
								
							</div>
						</div>
					</div>
				</div>

				<%
				}
				%>				

			</div>
			<div class="text-center mt-3">
				<a href="all_RecentBook.jsp" class="btn btn-danger btn-sm text-white">View all</a>
			</div>
		</article>
		<!-- end recent book -->
		<hr>

		<!-- start new book -->
		<article class="mb-3">
			<h3 class="text-center mb-4">New Book</h3>
			<div class="row row-cols-md-4 g-4">

				<%
				bookDAO bDAO_2 = new bookDAO();
				List<Book> list_NewBook = bDAO_2.getNewBook();
				for (Book b : list_NewBook) {
				%>

				<div class="col">
					<div class="card card-hover">
						<div class="card-body">
							<img src="book/<%=b.getPhoto()%>"
								class="card-img-top mx-auto d-block mb-2" alt="..."
								style="height: 12rem; width: 9rem;">
							<h5 class="card-title"><%=b.getBookName()%></h5>
							<p class="card-text truncate-lines-3">This is a longer card
								with supporting text below as a natural lead-in to additional
								content. This content is a little bit longer.</p>
							
							<p>Author: <%=b.getAuthor()%></p>
							<p>Categories: <%=b.getBookCategory()%></p>
							<p>Price: <%=b.getPrice()%></p>
							<div class="row">
								<a href="view_books.jsp?bid=<%=b.getBookID()%>" class="btn btn-success btn-sm mt-1">View Details</a>
								
								<%if(us != null){%>
								<a href="add_cart?bID=<%=b.getBookID()%>" class="btn btn-danger btn-sm mt-1">Add Cart</a>								
								<%}else{%>
								<a href="login.jsp" class="btn btn-danger btn-sm mt-1">Add Cart</a>																
								<%}%>
								
							</div>
						</div>
					</div>
				</div>

				<%
				}
				%>


			</div>
			<div class="text-center mt-3">
				<a href="all_NewBook.jsp" class="btn btn-danger btn-sm text-white">View all</a>
			</div>
		</article>
		<!-- end new book -->
		<hr>

		<!-- start old book -->
		<article class="mb-3">
			<h3 class="text-center mb-4">Old Book</h3>
			<div class="row row-cols-1 row-cols-md-4 g-4">

			<%
				bookDAO bDAO_3 = new bookDAO();
				List<Book> list_OldBook = bDAO_3.getOldBook();
				for (Book b : list_OldBook) {
				%>

				<div class="col">
					<div class="card card-hover">
						<div class="card-body">
							<img src="book/<%=b.getPhoto()%>"
								class="card-img-top mx-auto d-block mb-2" alt="..."
								style="height: 12rem; width: 9rem;">
							<h5 class="card-title"><%=b.getBookName()%></h5>
							<p class="card-text truncate-lines-3">This is a longer card
								with supporting text below as a natural lead-in to additional
								content. This content is a little bit longer.</p>
							
							<p>Author: <%=b.getAuthor()%></p>
							<p>Categories: <%=b.getBookCategory()%></p>
							<p>Price: <%=b.getPrice()%></p>
							<div class="row">
								<a href="view_books.jsp?bid=<%=b.getBookID()%>" class="btn btn-success btn-sm mt-1">View Details</a>
								
								<%if(us != null){%>
								<a href="add_cart?bID=<%=b.getBookID()%>" class="btn btn-danger btn-sm mt-1">Add Cart</a>								
								<%}else{%>
								<a href="login.jsp" class="btn btn-danger btn-sm mt-1">Add Cart</a>																
								<%}%>
								
							</div>
						</div>
					</div>
				</div>

				<%
				}
				%>

			</div>
			<div class="text-center mt-3">
				<a href="all_OldBook.jsp" class="btn btn-danger btn-sm text-white">View all</a>
			</div>
		</article>
		<!-- end old book -->

	</section>
	
	<c:if test="${not empty msgAddCart}">
	
	<div id="snackbar">${msgAddCart}</div>
	<%@ include file="allComponent/toast.jsp" %>
	
	<c:remove var="msgAddCart"/>
	</c:if>
	
	<%@ include file="allComponent/footer.jsp"%>

</body>
</html>