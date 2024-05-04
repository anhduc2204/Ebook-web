<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Login</title>
<%@ include file="allComponent/allCss.jsp"%>
</head>
<body class="bg-body-secondary">

	<header>
		<%@ include file="allComponent/navbar.jsp"%>
	</header>

	<section class="container mt-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="text-center">Login</h5>
						
						<c:if test="${not empty succMsg}">
							<p class="text-center text-primary"><i class="fa-solid fa-circle-check"></i> ${succMsg}</p>
							<c:remove var="succMsg" scope="session"/>
						</c:if>
						
						<c:if test="${not empty failedMsg}">
							<p class="text-center text-danger"><i class="fa-solid fa-circle-exclamation"></i> ${failedMsg}</p>
							<c:remove var="failedMsg" scope="session"/>
						</c:if>
						
						<form action="login" method="post">
							<div class="mb-3">
								<label for="email" class="form-label">Email address</label>
								<input type="email" class="form-control"
									id="email" name="email" value="${userObj.email}"
									required="required">
							</div>
							<div class="mb-3">
								<label for="password" class="form-label">Password</label>
								<input type="password" class="form-control"
									id="password" name="password" value=""
									required="required">
							</div>
							<input type="hidden" name="action" value="login">
							<div class="mb-3 text-center">
								<button type="submit" class="btn btn-primary">Login</button>
								<p><a href="register.jsp">Create account</a></p>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@include file="allComponent/footer.jsp" %>

</body>
</html>