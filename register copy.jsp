<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Partner Management Application</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	 <style>
        .navbar {
            background-color: green;
        }
        .navbar-brand {
            font-size: 1.5rem;
            color: white;
        }
        .nav-link {
            color: white;
        }
        .card {
            max-width: 500px;
            padding: 20px;
            border-radius: 10px;
            background-color: rgba(255, 255, 255, 0.8);
        }
        .card p {
            margin-bottom: 20px;
        }
        body {
            background-image: url('https://img.freepik.com/free-vector/cartoon-business-people-collection_23-2148953086.jpg?w=1380&t=st=1658688665~exp=1658689265~hmac=e54ed71217f4800c8188fae4aafde3e0d9c66c4a45738df5d39d4fbffbe0d5c3');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
    </style>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: green">
			<div>
				<img class="school-logo" src="https://ahs.hcpss.org/sites/default/files/atholtonhs.png" alt="Logo image" style="width: 80px">
                <a class="navbar-brand" href="https://ahs.hcpss.org/"> Atholton Solutions </a>
            </div>
			<div class="ml-auto" style="font-size:120%;">
				<ul class="navbar-nav ml-auto">
					<li><a class="nav-link" >Sign Up</a></li>
					<div style="border-left:3px solid #7dbd7dff; height:40%"></div>
					<li><a class="nav-link" >Log In</a></li>
					<div style="border-left:3px solid #7dbd7dff; height:40%"></div>
	                <li><a class="nav-link" >Privacy Notice</a></li>
	                <div style="border-left:3px solid #7dbd7dff; height:40%"></div>
	                <li><a class="nav-link">Conditions of Use</a></li>
	            </ul>
            </div>
		</nav>
	</header>
	<br>
	<div style="display: flex; flex-direction: row; justify-content: center; align-items: center;">
		<image
		src="https://img.freepik.com/free-vector/cartoon-business-people-collection_23-2148953086.jpg?w=1380&t=st=1658688665~exp=1658689265~hmac=e54ed71217f4800c8188fae4aafde3e0d9c66c4a45738df5d39d4fbffbe0d5c3"
		alt="people talking" style="width:20%; height:40%; flex:1;"> 
		<div style="flex:1;">
			<h2 style="text-align:center;">Create Account</h2>
			<br>
			<form action="<%= request.getContextPath() %>/register" method="post">
			<div class="container col-md-5" style="width:100%;">
				<div class="card" style="width:100%;">
					<div class="card-body" style="width:100%;">
						<fieldset class="form-group">
							<label style="font-size:130%;">Email</label> <input type="email" class="form-control"
								name="userEmail" id= "userEmail" required="required"
								pattern="^[a-zA-Z0-9_+&*-] + (?:\\.[a-zA-Z0-9_+&*-] + )*@(?:[a-zA-Z0-9-]+\\.) + [a-zA-Z]{2, 7}"
								autocomplete="off" style="background-color:GhostWhite;">
						</fieldset>
						<fieldset class="form-group">
							<label style="font-size:130%;">Password</label> <input type="password" class="form-control"
								name="userPassword" id="userPassword" required="required" 
								title="Enter a password" autocomplete="off" style="background-color:GhostWhite;">
						</fieldset>
						<fieldset class="form-group">
							<label style="font-size:130%;">Re-type Password</label> <input type="password"
								class="form-control" name="retypePassword" required="required"
								title="Enter your password"
								autocomplete="off" style="background-color:GhostWhite;">
						</fieldset>
						<p>By creating an account you agree to Atholton Solutions's
							Conditions of Use and Privacy Notice.</p>
						<div style="text-align:center;">
							<button type="submit" class="btn btn-success" style="height: 100%; width:100%; font-size:130%;">Create
							Account</button>
						</div>
						<hr>
						<p> Already have an account? Sign In here. </p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
