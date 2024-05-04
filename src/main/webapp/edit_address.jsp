<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Address</title>
<%@ include file="allComponent/allCss.jsp"%>
</head>
<body class="bg-body-secondary">
	<header>
		<%@include file="allComponent/navbar.jsp"%>
	</header>

	<c:if test="${empty userObj}">
		<% session.setAttribute("reqPage", "edit_address.jsp"); %>
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	
	<section class="container mt-3">
		
		<div class="row justify-content-center">
			<div class="col-xl-4 col-12 g-3">
				<div class="card p-3">
					<h3 class="text-center">Edit Address</h3>
					
					<c:if test="${not empty failedMsg}">
					<p class="text-center text-danger"><i class="fa-solid fa-circle-exclamation"></i> ${failedMsg}</p>
					<c:remove var="failedMsg"/>
					</c:if>
					
					<c:if test="${not empty succMsg}">
					<p class="text-center text-primary"><i class="fa-solid fa-circle-check"></i> ${succMsg}</p>
					<c:remove var="succMsg"/>
					</c:if>
				
					<form action="edit_address" method="post">
						<div class="mb-3">
							<label for="address" class="form-label">Address <span class="text-danger">*</span></label>
							<input type="text" class="form-control" id="address" name="address"
								value="${userObj.getAddress()}" required="required">
						</div>
						
						<div class="mb-3">
							<label for="currentPassword" class="form-label">Current Password <span class="text-danger">*</span></label>
							<input type="password" class="form-control" id="currentPassword"
								name="currentPassword" value="" required="required">
						</div>
						
						<input type="hidden" name="userID" value="${userObj.getId()}">
						<input type="hidden" name="action" value="edit_address">
						<div class="mb-3 text-center">
							<button type="submit" class="btn btn-primary">Update</button>
						</div>
					</form>
				</div>
			</div>
			
			
		</div>
	</section>

	<%@ include file="allComponent/footer.jsp"%>
</body>
</html>