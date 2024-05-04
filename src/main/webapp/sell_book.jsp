<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell Book</title>
<%@ include file="allComponent/allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2">
	<header>
		<%@include file="allComponent/navbar.jsp"%>
	</header>
	
	<c:if test="${empty userObj}">
		<% session.setAttribute("reqPage", "sell_book.jsp"); %>
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	
	<section class="container mt-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card p-3">
					<h3 class="text-center">Sell Book</h3>
					
					<c:if test="${not empty succMsg}">
					<p class="text-primary text-center">${succMsg}</p>
					<c:remove var="succMsg"/>
					</c:if>
					
					<c:if test="${not empty failedMsg}">
					<p class="text-danger text-center">${failedMsg}</p>
					<c:remove var="failedMsg"/>
					</c:if>
					
					<form action="sell_book" method ="post" enctype="multipart/form-data">
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
							<label for="photo" class="form-label">Upload Photo <span class="text-danger">*</span></label>
							<input class="form-control" type="file" id="photo" name="photo">
						</div>
						<input type="hidden" name="action" value="sell_book">
						<div class="mb-3 text-center">						
							<button type="submit" class="btn btn-primary">Add</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<%@ include file="allComponent/footer.jsp"%>
</body>
</html>