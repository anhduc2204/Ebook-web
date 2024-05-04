<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c"  uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Register</title>
<%@ include file="allComponent/allCss.jsp"%>
</head>
<body class="bg-body-secondary">
	<header>
		<%@include file="allComponent/navbar.jsp"%>
	</header>

	<section class="container mt-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Registation Page</h4>
						
						<c:if test="${not empty succMsg}">
							<p class="text-center text-primary"><i class="fa-solid fa-circle-check"></i> ${succMsg}</p>
							<c:remove var="succMsg" scope ="session"/>
						</c:if>
						
						<c:if test="${not empty failedMsg}">
							<p class="text-center text-danger"><i class="fa-solid fa-circle-exclamation"></i> ${failedMsg}</p>
							<c:remove var="failedMsg" scope="session"/>
						</c:if>
						
						<form action ="register" method="post">
							<div class="mb-3">
								<label for="fName" class="form-label">Enter
									Your Name</label> <input type="text" class="form-control"
									id="fName" name ="fName" value="${user.fName}"
									required="required">
							</div>
							<div class="mb-3">
								<label for="email" class="form-label">Email
									address</label> <input type="email" class="form-control"
									id="email" name="email" value="${user.email}"
									required="required">
							</div>
							<div class="mb-3">
								<label for="phoneNo" class="form-label">Phone no</label>
								<input type="number" class="form-control"
									id="phoneNo" name ="phoneNo" value="${user.phoneNo}"
									required="required">
							</div>
							<div class="mb-3">
								<label for="password" class="form-label">Password</label>
								<input type="password" class="form-control"
									id="password"  name ="password" value ="${user.password}"
									required="required">
							</div>
							<div class="mb-3 form-check">
								<input type="checkbox" class="form-check-input"
									id="check" name ="check"> <label class="form-check-label"
									for="check">Agree terms & Condition</label>
							</div>
							<input type="hidden" name ="action" value ="register">
							<div class="mb-3 text-center">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</section>
	
	<%@ include file="allComponent/footer.jsp" %>
	
</body>
</html>