<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>


<div class="container-fluid"
	style="height: 10px; background-color: #303f9f"></div>

<div class="container-fluid p-3">
	<div class="row">
		<div class="col-md-3 text-danger">
			<h3>
				<i class="fa-solid fa-book"></i> Ebook
			</h3>
		</div>
		<div class="col-md-3">
			<form class="d-flex" role="search">
				<input class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-primary" type="submit">
					<i class="fa-solid fa-magnifying-glass"></i>
				</button>
			</form>
		</div>

		<div class="col-md-3 offset-md-3">

			<c:if test="${not empty userObj}">
				<a href="home.jsp" class="btn btn-danger"><i class="fa-solid fa-user"></i>
					${userObj.getfName()}</a>
				<a class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#logoutModal"><i
					class="fa-solid fa-right-from-bracket"></i> Logout</a>

			</c:if>

			<c:if test="${empty userObj}">
				<a href="login.jsp" class="btn btn-danger"><i
					class="fa-solid fa-right-to-bracket"></i> Login</a>
				<a href="register.jsp" class="btn btn-primary"><i
					class="fa-solid fa-user-plus"></i> Register</a>

			</c:if>

		</div>

	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="logoutModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body text-center">
				<h4 class="mb-3">Do you want logout?</h4>
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
				<a href="../logout" class="btn btn-primary">Logout</a>
			</div>
			<div class="modal-footer text-center"></div>
		</div>
	</div>
</div>


<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<div class="container-fluid">
		<a class="navbar-brand" href="home.jsp"><i
			class="fa-solid fa-house"></i></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active rounded-4"
					aria-current="page" href="home.jsp">Home</a></li>

			</ul>

		</div>
	</div>
</nav>