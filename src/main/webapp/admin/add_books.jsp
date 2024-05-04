<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c"  uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Add Books</title>
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
					<h3 class="text-center">Add Books</h3>
					
					<c:if test="${not empty succMsg}">
					<p class="text-primary text-center">${succMsg}</p>
					<c:remove var="succMsg"/>
					</c:if>
					
					<c:if test="${not empty failedMsg}">
					<p class="text-danger text-center">${failedMsg}</p>
					<c:remove var="failedMsg"/>
					</c:if>
					
					<form action="../add_book" method ="post" enctype="multipart/form-data">
						<div class="mb-3">
							<label for="bookName" class="form-label">Book
								Name <span class="text-danger">*</span></label>
							<input type="text" class="form-control" id="bookName"
								aria-describedby="emailHelp" name="bookName">
						</div>
						<div class="mb-3">
							<label for="author" class="form-label">Author
								Name <span class="text-danger">*</span></label>
							<input type="text" class="form-control" name="author"
								id="author">
						</div>
						<div class="mb-3">
							<label for="price" class="form-label">Price
								<span class="text-danger">*</span></label>
							<input type="number" class="form-control" name="price"
								id="price">
						</div>
						<div class="mb-3">
							<label for="btype" class="form-label">Categories
								<span class="text-danger">*</span></label>
							<select class="form-select"
							name="btype" id="btype">
								<option selected>--select--</option>
								<option value="New">New Book</option>
								<option value="Old">Old Book</option>
							</select>
						</div>
						<div class="mb-3">
							<label for="status" class="form-label">Book Status
								<span class="text-danger">*</span></label>
							<select class="form-select"
							name="status" id="status">
								<option selected>--select--</option>
								<option value="active">Active</option>
								<option value="inactive">Inactive</option>
							</select>
						</div>
						<div class="mb-3">
							<label for="photo" class="form-label">Upload Photo <span class="text-danger">*</span></label>
							<input class="form-control" type="file" id="photo" name="photo">
						</div>
						<input type="hidden" name="action" value="add_book">
						<div class="mb-3 text-center">						
							<button type="submit" class="btn btn-primary">Add</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	
	<%@include file="footer.jsp" %>
	
</body>
</html>