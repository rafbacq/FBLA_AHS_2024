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
					style="color: white; vertical-align: middle; font-size: 200%;"
					href="https://ahs.hcpss.org/"> Atholton Solutions</a>
			</div>
			<div class="ml-auto" style="font-size: 150%;">
				<ul class="navbar-nav ml-auto">
					<li><a class="nav-link"
						href="<%=request.getContextPath()%>/register.jsp">Register </a></li>
					<div style="border-left: 3px solid #7dbd7dff; height: 40%"></div>
					<li><a class="nav-link"
						href="<%=request.getContextPath()%>/login-page.jsp">Log In</a></li>
					<div style="border-left: 3px solid #7dbd7dff; height: 40%"></div>
					<li><a class="nav-link active"> <u> Privacy Notice </u>
					</a></li>
					<div style="border-left: 3px solid #7dbd7dff; height: 40%"></div>
					<li><a class="nav-link"
						href="<%=request.getContextPath()%>/terms-and-conditions.jsp">Conditions
							of Use </a></li>
				</ul>
			</div>
		</nav>
	</header>

	<div style="margin: 2%">
		<h1>
		<span>Atholton Solutions Privacy Notice</span>
	</h1>
	<hr>
	<div style="margin:2%;">
	<h2>
		<span>1. Introduction</span>
	</h2>
	<p>
		<span>At Atholton Solutions, we take your privacy
			seriously. This Privacy Notice explains how we collect, use, and
			protect your personal information. By using our services, you consent
			to the practices described herein.</span>
	</p>
	<h2>
		<span >2. Information We Collect</span>
	</h2>
	<p >
		<span >We collect the following types of information:</span>
	</p>
	<ul >
		<li ><span >User Data</span><span
			>: Information provided during account registration,
				including name, contact details, and organization affiliation.</span></li>
		<li><span>Teacher Data</span><span
			>: Data related to teachers (e.g., names,
				qualifications, employment history) provided by educational
				institutions for database creation.</span></li>
	</ul>
	<h2 >
		<span>3. How We Use Your Information</span>
	</h2>
	<p >
		<span >We use your information for the following
			purposes:</span>
	</p>
	<ul >
		<li><span >Database
				Creation</span><span >: To design and maintain teacher
				databases.</span></li>
		<li ><span >Communication</span><span
			>: To respond to inquiries, provide support, and
				send relevant updates.</span></li>
		<li ><span>Analytics</span><span
			>: To improve our services and enhance user
				experience.</span></li>
		<li ><span>Legal
				Compliance</span><span >: To comply with applicable laws
				and regulations.</span></li>
	</ul>
	<h2 >
		<span >4. Data Security</span>
	</h2>
	<ul>
		<li><span>We employ
				industry-standard security measures to protect your data.</span></li>
		<li ><span>Access to
				teacher databases is restricted to authorized personnel only.</span></li>
		<li ><span>Data
				transmission is encrypted using secure protocols.</span></li>
	</ul>
	<h2 >
		<span>5. Data Retention</span>
	</h2>
	<ul >
		<li ><span>We retain user
				data for as long as necessary to fulfill the purposes outlined in
				this notice.</span></li>
		<li><span>Teacher data
				is retained as required by educational institutions and applicable
				laws.</span></li>
	</ul>
	<h2 >
		<span>6. Sharing Your Information</span>
	</h2>
	<ul >
		<li><span>We do not sell
				or share your personal information with third parties.</span></li>
		<li><span>Exceptions
				include legal requirements, service providers, and business
				partners.</span></li>
	</ul>
	<h2 >
		<span>7. Your Rights</span>
	</h2>
	<ul >
		<li><span>You have the
				right to access, correct, or delete your personal data.</span></li>
		<li><span>To exercise
				these rights, please contact us at privacy@atholtonsolutions.com.</span></li>
	</ul>
	<h2>
		<span>8. Changes to this Notice</span>
	</h2>
	<ul>
		<li><span>We may update
				this Privacy Notice periodically. Check our website for the latest
				version.</span></li>
	</ul>
	<h2>
		<span>9. Contact Information</span>
	</h2>
	<p>
		<span>If you have any questions or concerns
			regarding your privacy, please reach out to us:</span>
	</p>
	<p >
		<span >Atholton Solutions<br>Email:
			<a href="mailto:atholtonsolution@gmail.com">atholtonsolution@gmail.com </a>
		</span>
	</p>
	</div>
	</div>

</body>
</html>