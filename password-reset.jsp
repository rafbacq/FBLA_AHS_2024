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
	<header>
	<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: gray">
			<div>
				<img class="school-logo"
					src="https://ahs.hcpss.org/sites/default/files/atholtonhs.png"
					alt="Logo image" style="width: 80px"> <a class="navbar-brand"
					style="color: white; vertical-align:middle; font-size:200%;" href="https://ahs.hcpss.org/"> Atholton Solutions </a>
			</div>
		</nav>
		<br>
		<div style="text-align:center">
			<image class="rounded-circle border border-secondary"  src = "https://static.hudl.com/users/temp/7082861_e91756197bb64e60b4b3850c4a1b85c1.jpg" alt="AHS Logo" style="height:100px; width:100px;">
		</div>
	</header>
	<div style="flex-grow:1;">
		<br>
		<h1 style="text-align:center;">Change your Password</h1>
		<br>
		<div class="container col-md-5">
			<div class="card">
				<div class="card-body rounded" style="background-color:#fafafaff; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);">
					<fieldset class="form-group" style="flex-grow:1">
						<label style="font-size:130%;"> Password 
						</label> <input type="password" class="form-control"
							name="userPassword" required="required"
							pattern="^[a-zA-Z0-9_+&*-] + (?:\\.[a-zA-Z0-9_+&*-] + )*@(?:[a-zA-Z0-9-]+\\.) + [a-zA-Z]{2, 7}"
							autocomplete="off">
					</fieldset>
					
					<fieldset class="form-group" style="flex-grow:1">
					<label style="font-size:130%;">Re-type Password</label> <input type="password"
						class="form-control" name="retypePassword" required="required"
						pattern="[0-9]{10}" title="Enter your password"
						autocomplete="off">
				</fieldset>
					<div style="text-align:center;">
						<button type="submit" class="btn btn-secondary" style="height: 100%; width:100%; font-size:150%;">Confirm</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
