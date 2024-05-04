<%@page import="com.entity.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.bookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
<%@ include file="allComponent/allCss.jsp"%>

<style type="text/css">

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
<body>
	<header>
		<%@include file="allComponent/navbar.jsp"%>
	</header>

	<section class="container mt-3">
		
		<div class="row row-cols-1 row-cols-md-4 g-4">

			<%
			String keyword = request.getParameter("keyword");
			bookDAO bDAO = new bookDAO();
			List<Book> list = bDAO.searchBook(keyword);
			for (Book b : list) {
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

						<p>
							Author:
							<%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>
						<p>
							Price:
							<%=b.getPrice()%></p>
						<div class="row">
							<a href="view_books.jsp?bid=<%=b.getBookID()%>" class="btn btn-success btn-sm mt-1">View Details</a>
								
							<c:if test="${not empty userObj}">
							<a href="add_cart?bID=<%=b.getBookID()%>" class="btn btn-danger btn-sm mt-1">Add Cart</a>															
							</c:if>
							
							<c:if test="${empty userObj}">
							<a href="login.jsp" class="btn btn-danger btn-sm mt-1">Add Cart</a>																
							</c:if>
							
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>
	</section>

	<%@ include file="allComponent/footer.jsp"%>
</body>
</html>