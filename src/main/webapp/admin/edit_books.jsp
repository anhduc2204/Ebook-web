<%@page import="java.io.File"%>
<%@page import="com.entity.Book"%>
<%@page import="com.DAO.bookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c"  uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Edit Books</title>
<%@ include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2">
	<header>
		<%@include file="navbar.jsp"%>
	</header>
	
	<c:if test="${empty userObj}">
		<c:redirect url="../login.jsp"/>
	</c:if>

	<section class="container mt-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card p-3">
					<h3 class="text-center">Edit Books</h3>
					
					<%
						int id = Integer.parseInt(request.getParameter("bookID"));
						bookDAO bDAO = new bookDAO();
						Book b = bDAO.getBookById(id);						
					%>
					<form action="../update_book" method ="post" enctype="multipart/form-data">
						<div class="mb-3">
							<label for="bookName" class="form-label">Book
								Name <span class="text-danger">*</span></label>
							<input type="text" class="form-control" id="bookName"
								aria-describedby="emailHelp" name="bookName" value="<%=b.getBookName()%>" >
						</div>
						<div class="mb-3">
							<label for="author" class="form-label">Author
								Name <span class="text-danger">*</span></label>
							<input type="text" class="form-control" name="author"
								id="author" value="<%=b.getAuthor()%>">
						</div>
						<div class="mb-3">
							<label for="price" class="form-label">Price
								<span class="text-danger">*</span></label>
							<input type="number" class="form-control" name="price"
								id="price" value="<%=b.getPrice()%>">
						</div>
						
						<div class="mb-3">
							<label for="status" class="form-label">Book Status
								<span class="text-danger">*</span></label>
							<select class="form-select"
							name="status" id="status">
								<%if(b.getStatus().equals("active")){%>
								<option value="active">Active</option>
								<option value="inactive">Inactive</option>								
								<%}else{%>
								<option value="inactive">Inactive</option>
								<option value="active">Active</option>
								<%}%>
							</select>
						</div>
				
						<div class="mb-3">
							<img alt="Ảnh" src="../book/<%=b.getPhoto()%>" 
										style="width: 50px; heigt: 50px">							
						</div>
						
						<div class="mb-3">
							<label for="photo" class="form-label">Upload Photo <span class="text-danger">*</span></label>
							<input class="form-control" type="file" id="photo" 
									name="photo">
						</div>
						
						<input type="hidden" name="action" value="update_book">
						<input type="hidden" name="bookID" value="<%=id%>">
						<div class="mb-3 text-center">						
							<button type="submit" class="btn btn-primary">Update</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	
	<%@include file="footer.jsp" %>
	
</body>
</html>