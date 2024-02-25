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
					style="color: white; vertical-align:middle; font-size:200%;" href="https://ahs.hcpss.org/"> Atholton Solutions</a>
			</div>
			<div class="ml-auto" style="font-size:150%;">
				<ul class="navbar-nav ml-auto">
					<li><a class="nav-link"  href="<%=request.getContextPath()%>/register.jsp">Register </a></li>
					<div style="border-left:3px solid #7dbd7dff; height:40%"></div>
					<li><a class="nav-link" href="<%=request.getContextPath()%>/login-page.jsp">Log In</a></li>
					<div style="border-left:3px solid #7dbd7dff; height:40%"></div>
	                <li><a class="nav-link active"> <u> Privacy Notice </u> </a></li>
	                <div style="border-left:3px solid #7dbd7dff; height:40%"></div>
	                <li><a class="nav-link" href="<%=request.getContextPath()%>/terms-and-conditions.jsp">Conditions of Use </a></li>
	            </ul>
            </div>
		</nav>
	</header>
	
	<div style="margin: 2%">
		<h4 class="display-4"><u>Privacy Notice</u></h4>
		<div style="margin: 2%">
			<p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean massa mi, pulvinar id quam vel, eleifend posuere mauris. Fusce pharetra erat ac velit tristique rhoncus. Cras laoreet ante sit amet pulvinar auctor. Sed in fringilla diam. Vivamus nec ullamcorper nisi. Etiam pellentesque dictum nisl in auctor. Pellentesque placerat feugiat pulvinar. Quisque iaculis eget metus ut mattis.
		Nunc nisl libero, placerat eu auctor vel, molestie maximus dolor. Nullam at aliquam tellus, quis convallis urna. Morbi eget leo in sem fermentum ornare non sed nisl. Morbi ut turpis mattis, sagittis risus viverra, tempus lectus. Vivamus dignissim facilisis orci, sit amet volutpat felis lacinia ut. In nulla mi, eleifend ut interdum a, volutpat in ante. Pellentesque massa mi, maximus commodo luctus non, ultricies sit amet massa. Integer arcu dui, eleifend sed iaculis vitae, tempus in tortor. Aliquam erat volutpat. Etiam a tincidunt ipsum.
		Phasellus elementum pellentesque tellus sit amet blandit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas eget arcu ut est ultrices ultricies ut ac dolor. Morbi auctor, velit condimentum auctor fringilla, nunc ante ornare ante, at ultrices mauris diam non dolor. Curabitur vulputate dapibus est ut accumsan. Suspendisse potenti. Duis lectus lorem, viverra ut porta eu, convallis sed ligula.
		Etiam non faucibus nulla. In hac habitasse platea dictumst. Aliquam imperdiet massa augue, sed fermentum risus suscipit at. Pellentesque finibus vehicula lorem, sed scelerisque diam varius ac. Aenean ut feugiat libero. Aenean vel nisl vehicula libero ullamcorper pulvinar. In gravida pellentesque ipsum porta pulvinar. Quisque tincidunt vulputate massa a scelerisque. Duis aliquet non sapien eleifend cursus.
		Aenean non lacus velit. Vivamus sit amet fringilla lacus. Sed posuere, elit vitae eleifend scelerisque, sapien arcu euismod lacus, at cursus nunc sapien sed elit. Nullam commodo metus eget viverra egestas. Maecenas cursus quis felis id sagittis. Nam semper tortor eget sapien rhoncus, et ultricies nulla ultrices. Proin maximus, felis a ultricies ullamcorper, augue justo pharetra lectus, ut tempor felis augue porttitor magna. Fusce aliquam id ex in vehicula.
			</p>
		</div>
	</div>
	
</body>
</html>
