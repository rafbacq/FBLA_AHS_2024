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
<body style="background-color:#f3f3f3ff;">
	<header style="text-align:center;">
		<br>
		<image src = "https://static.hudl.com/users/temp/7082861_e91756197bb64e60b4b3850c4a1b85c1.jpg" alt="AHS Logo" style="height:100px; width:100px;">
	</header>
	<div style="flex-grow:1;">
		<br>
		<h1 style="text-align:center;">Sign Into Atholton Solutions</h1>
		<br>
		<div class="container col-md-5">
			<div class="card">
				<div class="card-body" style=" box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);">
					<fieldset class="form-group">
						<label style="font-size:130%;">Username or email address</label> <input type="text" class="form-control"
							name="realName" required="required" pattern="[A-Za-z\s]+"
							title="Only letters and spaces are allowed" autocomplete="off">
					</fieldset>
					<fieldset class="form-group">
						<label style="font-size:130%;">Password <span class ="text-right" style="font-size:70%; color:CornflowerBlue"> <a> Forgot Password? </a></span>
						</label> <input type="email" class="form-control"
							name="userEmail" required="required"
							pattern="^[a-zA-Z0-9_+&*-] + (?:\\.[a-zA-Z0-9_+&*-] + )*@(?:[a-zA-Z0-9-]+\\.) + [a-zA-Z]{2, 7}"
							autocomplete="off">
					</fieldset>
					<div style="text-align:center;">
						<button type="submit" class="btn btn-success" style="height: 100%; width:100%; font-size:150%;">Login</button>
					</div>
				</div>
			</div>
		</div>
	</div>
		<br>
		<div class="container col-md-5 card card-body" style="background-color:#e5e5e5ff; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); width:70%; height:8%;">
			<p style="text-align:center;"> New to Atholton Solutions? <a style="color:CornflowerBlue">Create an account. </a> </p>
		</div>
	
</body>
</html>
