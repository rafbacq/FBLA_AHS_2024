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
			 <div class="ml-auto" style="font-size: 120%;">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link active" href="#"><u>Register</u></a></li>
                    <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/login-page.jsp">Log In</a></li>
                    <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/privacy-notice.jsp">Privacy Notice</a></li>
                    <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/terms-and-conditions.jsp">Conditions of Use</a></li>
                </ul>
            </div>
		</nav>
	</header>
	
	<div class="container">
        <div class="card">
            <h2 class="text-center mb-4" id="test">Register</h2>
            <form name="registerForm" action="EmailServlet-verify" method="post" onsubmit="return validate()">
                <div class="form-group">
                    <label for="userEmail">Email as user name</label>
                    <input type="email" class="form-control" name="userEmail" id="userEmail"  required pattern="^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}" autocomplete="off" oninput="try{setCustomValidity('')}catch(e){}">

                	 <c:if test="${displayInvalidEmail == true}">
						<small id="validEmail" class="text-danger" style="display: block;">Are you sure this email exists?</small>
                	</c:if>
                </div>
                <div class="form-group">
                    <label for="userPassword">Password</label>
                    <input type="password" class="form-control" name="userPassword" id="userPassword" required title="Enter a password" autocomplete="off">
                </div>
                <div class="form-group">
                    <label for="retypePassword">Re-type Password</label>
                    <input type="password" class="form-control" id="retypePassword" required title="Retype your password" autocomplete="off">
                    <small id="passwordMatch" class="text-danger" style="display: none;">Passwords do not match</small>
                </div>
                <p>By creating an account you agree to Atholton Solutions's Conditions of Use and Privacy Notice.</p>
                <button type="submit" id="create-account" name="create-account"  class="btn btn-success btn-block">Create Account</button>
            </form>
            <hr>
            <p class="text-center">Already have an account? <a href="<%=request.getContextPath()%>/login-page.jsp" style="color: CornflowerBlue;">Sign In here.</a></p>
        </div>
    </div>
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
        
       
        document.getElementById('userEmail').addEventListener('input', function() {
           document.getElementById('validEmail').style.display = "none";
        });
        
        
        function validate() {
           if( document.getElementById('userPassword').value !== document.getElementById('retypePassword').value){
        		return false;
          }
        	
          /*
      	  const emailInput = document.getElementById("userEmail");
      	  document.getElementById("test").innerHTML = "hello";
      	  var email = emailInput.value;
      	  var flag = true;
      	  
      	  var xhttp = new XMLHttpRequest();
      		xhttp.onreadystatechange = function() {
      			if (this.readyState == 4 && this.status == 200 ) {
      				  //document.getElementById("test").innerHTML = this.responseText;
      				document.getElementById("test").innerHTML = "bye";
      				  if(this.responseText == "true"){
      					emailInput.setCustomValidity("");
      					//email should be fine otherwise its not
      				}else{
      					emailInput.setCustomValidity("Are you sure this email exists?");
      				    flag = false;
      				}
      				
      	
      				emailInput.reportValidity();
      			}
      		};

      		xhttp.open("POST", "EmailServlet", true);
      		xhttp.setRequestHeader("Content-type",
      				"application/x-www-form-urlencoded");
      		xhttp.send("email=" + email);
      	
			*/
      	  
      	  return true;
      	  
      	}
    </script>
</body>
</html>
