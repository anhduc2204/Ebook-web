<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<%@ include file="allComponent/allCss.jsp"%>
</head>
<body class="bg-body-secondary">
	<header>
		<%@include file="allComponent/navbar.jsp"%>
	</header>

	<c:if test="${empty userObj}">
		<% session.setAttribute("reqPage", "edit_profile.jsp"); %>
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	
	<section class="container mt-3">
		
		<c:if test="${not empty failedMsg}">
		<h5 class="text-center text-danger"><i class="fa-solid fa-circle-exclamation"></i> ${failedMsg}</h5>
		<c:remove var="failedMsg"/>
		</c:if>
		
		<c:if test="${not empty succMsg}">
		<h5 class="text-center text-primary"><i class="fa-solid fa-circle-check"></i> ${succMsg}</h5>
		<c:remove var="succMsg"/>
		</c:if>
		
		<div class="row justify-content-center">
			<div class="col-xl-4 col-12 g-5">
				<div class="card p-3">
					<h3 class="text-center">Edit Profile</h3>
					<form action="edit_profile" method="post">
						<div class="mb-3">
							<label for="fName" class="form-label">Name <span class="text-danger">*</span></label>
							<input type="text" class="form-control" id="fName" name="fName"
								value="${userObj.getfName()}" required="required">
						</div>
						<div class="mb-3">
							<label for="email" class="form-label">Email address <span class="text-danger">*</span></label> 
							<input type="email" class="form-control" id="email" name="email"
								value="${userObj.getEmail()}" required="required">
						</div>
						<div class="mb-3">
							<label for="phoneNo" class="form-label">Phone <span class="text-danger">*</span></label>
							<input type="number" class="form-control" id="phoneNo" name="phoneNo"
								value="${userObj.getPhoneNo()}" required="required">
						</div>
						<div class="mb-3">
							<label for="currentPassword" class="form-label">Current Password <span class="text-danger">*</span></label>
							<input type="password" class="form-control" id="currentPassword"
								name="currentPassword" value="" required="required">
						</div>
						
						<input type="hidden" name="userID" value="${userObj.getId()}">
						<input type="hidden" name="action" value="edit_profile">
						<div class="mb-3 text-center">
							<button type="submit" class="btn btn-primary">Update</button>
						</div>
					</form>
				</div>
			</div>
			
			<div class="col-xl-4 col-12 g-5">
				<div class="card p-3">
					<h3 class="text-center">Change Password</h3>
					<form action="change_password" method="post">
						
						<div class="mb-3">
							<label for="currentPassword" class="form-label">Current Password <span class="text-danger">*</span></label>
							<input type="password" class="form-control" id="currentPassword"
								name="currentPassword" value="" required="required">
						</div>
						<div class="mb-3">
							<label for="newPassword" class="form-label">New Password <span class="text-danger">*</span></label>
							<input type="password" class="form-control" id="newPassword"
								name="newPassword" value="" required="required">
						</div>
						<div class="mb-3">
							<label for="newPassword_check" class="form-label">Re-type New Password <span class="text-danger">*</span></label>
							<input type="password" class="form-control" id="newPassword_check"
								name="newPassword_check" value="" required="required">
						</div>
						
						<input type="hidden" name="userID" value="${userObj.getId()}">
						<input type="hidden" name="action" value="change_password">
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