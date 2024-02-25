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
<body>
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
					<li><a class="nav-link active" ><u>Register </u></a></li>
					<div style="border-left:3px solid #7dbd7dff; height:40%"></div>
					<li><a class="nav-link" href="<%=request.getContextPath()%>/login-page.jsp">Log In</a></li>
					<div style="border-left:3px solid #7dbd7dff; height:40%"></div>
	                <li><a class="nav-link" href="<%=request.getContextPath()%>/privacy-notice.jsp">Privacy Notice</a></li>
	                <div style="border-left:3px solid #7dbd7dff; height:40%"></div>
	                <li><a class="nav-link" href="<%=request.getContextPath()%>/terms-and-conditions.jsp">Conditions of Use</a></li>
	            </ul>
            </div>
		</nav>
	</header>
	
	<div style="display: flex; flex-direction: row;">
		<div>
			<image
			style="vertical-align:middle;"
			src="https://img.freepik.com/free-vector/cartoon-business-people-collection_23-2148953086.jpg?w=1380&t=st=1658688665~exp=1658689265~hmac=e54ed71217f4800c8188fae4aafde3e0d9c66c4a45738df5d39d4fbffbe0d5c3"
			alt="people talking" style="width:20%; height:40%;"> 
		</div>
		
		<div>
		<br>
			<h2 style="text-align:center;">Register</h2>
		<br>
			<div style="display:flex; flex-direction: column;" class="container-fluid card card-body" >
				<fieldset class="form-group" style="flex-grow:1">
					<label style="font-size:130%;">Your Name</label> <input type="text" class="form-control"
						name="realName" required="required" pattern="[A-Za-z\s]+"
						title="Only letters and spaces are allowed" autocomplete="off" style="background-color:GhostWhite;">
				</fieldset>
				<fieldset class="form-group" style="flex-grow:1">
					<label style="font-size:130%;">Email</label> <input type="email" class="form-control"
						name="userEmail" required="required"
						pattern="^[a-zA-Z0-9_+&*-] + (?:\\.[a-zA-Z0-9_+&*-] + )*@(?:[a-zA-Z0-9-]+\\.) + [a-zA-Z]{2, 7}"
						autocomplete="off" style="background-color:GhostWhite;">
				</fieldset>
				<fieldset class="form-group" style="flex-grow:1">
					<label style="font-size:130%;">Password</label> <input type="text" class="form-control"
						name="userPassword" required="required" pattern="[0-9]{10}"
						title="Enter a password" autocomplete="off" style="background-color:GhostWhite;">
				</fieldset>
				<fieldset class="form-group" style="flex-grow:1">
					<label style="font-size:130%;">Re-type Password</label> <input type="password"
						class="form-control" name="retypePassword" required="required"
						pattern="[0-9]{10}" title="Enter your password"
						autocomplete="off" style="background-color:GhostWhite;">
				</fieldset>
				<p>By creating an account you agree to Atholton Solutions's
					Conditions of Use and Privacy Notice.</p>
				<div style="text-align:center;">
					<button type="submit" class="btn btn-success" style="height: 100%; width:100%; font-size:130%;">Create
					Account</button>
				</div>
				<hr>
				<p> Already have an account? <a style="color:CornflowerBlue;" href="<%=request.getContextPath()%>/login-page.jsp">Sign In here. </a> </p>
			</div>
		</div>
	</div>
</body>
</html>
