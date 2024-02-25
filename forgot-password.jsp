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
<body style="background-color: #ebeff3ff;">
	<header style="text-align:center; background-color:#fafafaff;">
	<br>
		<img class="school-logo"
			src="https://ahs.hcpss.org/sites/default/files/atholtonhs.png"
			alt="Logo image" style="width: 60px"> <a class="navbar-brand"
			style="color: black; font-size:200%; vertical-align:middle;" href="https://ahs.hcpss.org/"> Atholton Solutions </a>
	<br>
	<br>
	</header>
	<br>
	<br>
		<div class="rounded" style="width:54%; height:73%; margin:0 auto;">
			<div class="card rounded" style="height:100%;">
				<div class="card-body rounded" style="box-shadow: 5px 5px 10px 2px rgba(0,0,0,.5); text-align:center; height:100%;">
					<h1 style="height:10%;">Forgot Your Password</h1>
					<p style="height:10%;">Enter your email to be sent instructions on how to reset your password</p>
					
					<fieldset class="form-group" style="flex-grow: 1; height: 30%">
						<input type="text" class="form-control" name="emailInput"
							required="required" pattern="[A-Za-z\s]+"
							title="Please enter a valid email." autocomplete="off"
							placeholder="Email Address" style="font-size: 130%; height:100%; width:50%; margin:0 auto;" >
					</fieldset>
					<div style="text-align: center; flex-grow: 1;">
						<button type="submit" class="btn btn-success"
							style="font-size: 150%;">Request
							Code</button>
					</div>
					<div style="text-align: center;  ">
						<a class="navbar-brand" href="<%=request.getContextPath()%>/login-page.jsp" style="color:CornflowerBlue">Back to Login</a>
					</div>					
					
				</div>
			</div>
		</div>
</body>
</html>
