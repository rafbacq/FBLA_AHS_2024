<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Atholton Solutions</title>
 <script src="https://kit.fontawesome.com/f6e0cd647d.js" crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body style="background-color:#f3f3f3ff;">
	<header>
	<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: green">
			<div>
				<img class="school-logo"
					src="https://ahs.hcpss.org/sites/default/files/atholtonhs.png"
					alt="Logo image" style="width: 80px"> <a class="navbar-brand"
					style="color: white; vertical-align:middle; font-size:200%;" href="https://ahs.hcpss.org/"> Atholton Solutions </a>
			</div>
			<div class="ml-auto" style="font-size:150%;">
				<ul class="navbar-nav ml-auto">
					<li><a class="nav-link" href="<%=request.getContextPath()%>/register.jsp">Register</a></li>
					<div style="border-left:3px solid #7dbd7dff; height:40%"></div>
					<li><a class="nav-link active"> <u> Log In </u> </a></li>
					<div style="border-left:3px solid #7dbd7dff; height:40%"></div>
	                <li><a class="nav-link" href="<%=request.getContextPath()%>/privacy-notice.jsp">Privacy Notice</a></li>
	                <div style="border-left:3px solid #7dbd7dff; height:40%"></div>
	                <li><a class="nav-link" href="<%=request.getContextPath()%>/terms-and-conditions.jsp">Conditions of Use</a></li>
	            </ul>
            </div>
		</nav>
		<br>
		<div style="text-align:center">
			<image class="rounded-circle border border-success"  src = "https://static.hudl.com/users/temp/7082861_e91756197bb64e60b4b3850c4a1b85c1.jpg" alt="AHS Logo" style="height:100px; width:100px;">
		</div>
	</header>
	<div style="flex-grow:1;">
		<br>
		<h1 style="text-align:center;">Log in to Atholton Solutions</h1>
		<br>
		<div class="container col-md-5">
			<div class="card">
				<div class="card-body rounded" style="background-color:#fafafaff; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);">
					<fieldset class="form-group">
						<label style="font-size:130%;"><i class="fa-solid fa-envelope" style="color: #1e5030;"></i> Email address</label> <input type="text" class="form-control"
							name="realName" required="required" pattern="[A-Za-z\s]+"
							title="Only letters and spaces are allowed" autocomplete="off">
					</fieldset>
					<fieldset class="form-group">
						
						<label style="display:flex; align-items:center; justify-content:space-between; font-size:130%;"> <span> <i class="fa-solid fa-key" style="color: #1e5030;"></i> Password </span><a style="font-size:70%; color:CornflowerBlue" href="<%=request.getContextPath()%>/forgot-password.jsp"> Forgot Password?  </a>
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
		<div class="container col-md-5 card card-body rounded" style="background-color:#e5e5e5ff; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); width:70%; height:8%;">
			<h4 style="text-align:center;"> New to Atholton Solutions? <a style="color:CornflowerBlue" href="<%=request.getContextPath()%>/register.jsp">Create an account. </a> </h4>
		</div>
	
</body>
</html>
