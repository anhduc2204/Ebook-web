<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.entity.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.bookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Books</title>
<%@ include file="allCss.jsp"%>


</head>
<body style="background-color: #f0f2f2">
	<header>
		<%@include file="navbar.jsp"%>
	</header>
	
	<c:if test="${empty userObj}">
		<c:redirect url="../login.jsp"/>
	</c:if>
	
	<h2 class="text-center mt-3">Hello Admin</h2>

	<div class="container mt-5">

		<c:if test="${not empty succMsg}">
			<p class="text-primary text-center">${succMsg}</p>
			<c:remove var="succMsg" />
		</c:if>

		<c:if test="${not empty failedMsg}">
			<p class="text-danger text-center">${failedMsg}</p>
			<c:remove var="failedMsg" />
		</c:if>

		<table class="table table-striped">
			<thead>
				<tr class="table-dark">
					<th scope="col">Id</th>
					<th scope="col">Image</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Categories</th>
					<th scope="col">Status</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				bookDAO bDAO = new bookDAO();
				List<Book> list = bDAO.getAllBooks();
				for (Book b : list) {
				%>

				<tr>
					<th><%=b.getBookID()%></th>
					<td><img src="../book/<%=b.getPhoto()%>"
						style="width: 50px; heigt: 50px"></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getBookCategory()%></td>
					<td><%=b.getStatus()%></td>
					<td><a href="edit_books.jsp?bookID=<%=b.getBookID()%>"
						class="btn btn-sm btn-primary"><i
							class="fa-solid fa-pen-to-square"></i> Edit</a>
						<a href="../delete_book?bookID=<%=b.getBookID()%>"
						class="btn btn-sm btn-danger"><i class="fa-solid fa-trash-can"></i>
							Delete</a></td>
				</tr>
				<%
				}
				%>

			</tbody>
		</table>

	</div>

	<%@include file="footer.jsp"%>
</body>
</html>