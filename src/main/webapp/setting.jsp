<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Settings</title>
<%@ include file="allComponent/allCss.jsp"%>

<style type="text/css">
a{
	text-decoration: none;
	color: black;
}
</style>

</head>
<body class="bg-body-secondary">
	<header>
		<%@include file="allComponent/navbar.jsp"%>
	</header>
	
	<section class="container mt-3">
		<c:if test="${not empty userObj}">
		<h3 class="text-center text-success">Hello, ${userObj.getfName()}</h3>
		</c:if>
		<div class="row mt-5">
			<div class="col-xl-6 col-12 g-3">
				<a href="sell_book.jsp">
					<div class="card p-3">
						<div class="card-body text-center">
							<i class="fa-solid fa-book-open fa-3x text-primary"></i> <br>
							<h4>Sell Old Book</h4>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-xl-6 col-12 g-3">
				<a href="edit_profile.jsp">
					<div class="card p-3">
						<div class="card-body text-center">
							<i class="fa-solid fa-id-card fa-3x text-danger"></i> <br>
							<h4>Login & Security (Edit Profile)</h4>
						</div>
					</div>
				</a>
			</div>
			
		</div>
		
		<div class="row">
			<div class="col-xl-4 col-12 g-3">
				<a href="edit_address.jsp">
					<div class="card p-3">
						<div class="card-body text-center">
							<i class="fa-solid fa-location-dot fa-3x text-primary"></i> <br>
							<h4>Address</h4>
							<h6>Edit Address</h6>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-xl-4 col-12 g-3">
				<a href="myOrder.jsp">
					<div class="card p-3">
						<div class="card-body text-center">
							<i class="fa-solid fa-location-dot fa-3x text-success"></i> <br>
							<h4>My Order</h4>
							<h6>Track Your Order</h6>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-xl-4 col-12 g-3">
				<a>
					<div class="card p-3">
						<div class="card-body text-center">
							<i class="fa-solid fa-circle-question fa-3x text-info"></i> <br>
							<h4>Help Center</h4>
							<h6>24/7 Service</h6>
						</div>
					</div>
				</a>
			</div>
			
		</div>

	</section>

	<%@ include file="allComponent/footer.jsp"%>
</body>
</html>