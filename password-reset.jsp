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
<body style="background-color: #f3f3f3ff;" >
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: gray">
			<div>
				<img class="school-logo"
					src="https://ahs.hcpss.org/sites/default/files/atholtonhs.png"
					alt="Logo image" style="width: 80px"> <a class="navbar-brand"
					style="color: white; vertical-align: middle; font-size: 200%;"
					href="<%=request.getContextPath()%>/register.jsp"> Atholton Solutions </a>
			</div>
		</nav>
		<br>

	</header>
	<div class="d-flex p-2 flex-column">
		<div class="container col-md-5 my-auto">
			<div class="card">
				<div class="card-body rounded"
					style="background-color: #fafafaff; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);">
					<image class="rounded-circle border border-secondary inline"
						src="https://cdn-icons-png.flaticon.com/512/483/483408.png"
						alt="Lock icon" style="height:100px; width:100px;"> <span
						class="h1 pl-3" style="margin: auto;">Change your Password</span>
					<br>
					<br>
					<form action="" method="post" onsubmit="return validate()">
						<fieldset class="form-group" style="flex-grow: 1">
							<label style="font-size: 130%;">New Password </label> <input
								type="password" class="form-control" name="userPassword" id="userPassword"
								required="required"
								autocomplete="off">
						</fieldset>

						<fieldset class="form-group" style="flex-grow: 1">
							<label style="font-size: 130%;">Re-type Password</label> <input
								type="password" class="form-control" name="retypePassword"
								id="retypePassword"
								required="required"
								title="Enter your password" autocomplete="off">
						</fieldset>
						<small id="passwordMatch" class="text-danger" style="display: none;">Passwords do not match</small>
					</form>
					<div style="text-align: center;">
						<button type="submit" class="btn btn-secondary"
							style="height: 100%; width: 100%; font-size: 150%;">Confirm</button>
					</div>
				</div>
			</div>
		</div>
	<div>
	<script>
		document.getElementById('retypePassword').addEventListener('input', function() {
	        var password = document.getElementById('userPassword').value;
	        var retypePassword = document.getElementById('retypePassword').value;
	        var passwordMatch = document.getElementById('passwordMatch');
	        
	        if (password !== retypePassword && retypePassword.length != 0) {
	            passwordMatch.style.display = 'block';
	        } else{
	            passwordMatch.style.display = 'none';
	        }
	    });
		function validate(){
			return document.getElementById("userPassword").value == document.getElementById("retypePassword").value;
		}
	</script>

</body>
</html>
