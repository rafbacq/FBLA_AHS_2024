<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Atholton Solutions</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body style="background-color: white;">
	<header style="text-align: center; background-color: #42a0d3ff;">
		<br> <img class="school-logo"
			src="https://ahs.hcpss.org/sites/default/files/atholtonhs.png"
			alt="Logo image" style="width: 60px"> <a class="navbar-brand"
			style="color: white; font-size: 200%; vertical-align: middle;"
			href="https://ahs.hcpss.org/"> Atholton Solutions </a> <br> <br>
	</header>
	<br>
	<br>
		<div class="container-fluid  h-100">
		<div class="row no-gutters h-100">

			<div class="col-3 flex-column">
				<form method="post" action="EmailServlet-forgot-password"
					onsubmit="return validateForm()">
					<h1>Forgot Your Password</h1>
					<p>Enter your email to be sent instructions on how to reset
						your password</p>

					<fieldset class="form-group">
						<input id="userEmail" name="userEmail" type="email" class="form-control"
							name="emailInput" required="required"
							title="Please enter a valid email." autocomplete="off"
							placeholder="Email Address">
					</fieldset>
					<c:if test="${displayInvalidEmail == true}">
						<small id="validEmail" class="text-danger" style="display: block;">Are
							you sure this email exists?</small>
					</c:if>
					<c:if test="${noSuchUser == true}">
						<small id="validEmail" class="text-danger" style="display: block;">No such a user for this email!
						</small>
					</c:if>
					
					<button type="submit" class="btn btn-success"
						style="font-size: 150%; width: 100%;">Request Code</button>
				</form>

				<button class="btn btn-primary mt-auto" style="width: 100%;">
					<a class="navbar-brand text-white " style="font-size: 150%;"
						href="<%=request.getContextPath()%>/login-page.jsp">Back to
						Login</a>
				</button>

			</div>
			<div class="col-9"
				style="background-image: url('https://static.vecteezy.com/system/resources/previews/026/651/752/non_2x/forgot-password-concept-flat-illustration-vector.jpg'); background-size: cover;">
			</div>

		</div>

	</div>
</body>
</html>
