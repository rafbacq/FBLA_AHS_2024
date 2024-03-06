<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Atholton Solutions</title>
<link
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style>
* {
	box-sizing: border-box;
}

body {
	background-color: rgba(210, 255, 205); font-family : "Lato", sans-serif;
	height: 100vh;
	display: flex;
	flex-direction:column;
	align-items: center;
	justify-content: center;
	overflow: hidden;
	margin: 0;
	font-family: "Lato", sans-serif;
}

.container {
	background-color: rgba(245, 245, 245, 0.9);
	border-radius: 10px;
	padding: 30px;
	max-width: 1000px;
	text-align: center;
}

.digit-container {
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 40px 0;
}

.digit {
	caret-color: transparent;
	background-color: rgba(255, 255, 255, 0.6);
	border-radius: 10px;
	border: 1px solid #eee;
	font-size: 30px;
	font-family: "Lato", sans-serif;
	width: 75px;
	height: 80px;
	margin: 10px;
	text-align: center;
	font-weight: 300;
}

@media ( max-width : 600px) {
	.digit-container {
		flex-wrap: wrap;
	}
	.digit {
		font-size: 24px;
		height: 50px;
		max-width: 50px;
		font-size: bold;
	}
}

.digit::-webkit-outer-spin-button, .digit::-webkit-inner-spin-button {
	-webkit-appearance: none;
}

.digit:valid {
	border-color: ForestGreen;
	box-shadow: 0 10px 10px -5px rgba(0, 0, 0, 0.25);
}

.btn {
	font-family: "Lato", sans-serif;
	min-width: 400px;
	display: inline-block;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	user-select: none;
	cursor: pointer;
	border: 1px solid transparent;
	margin: 0px 0px 20px 0px;
	padding: 0.775rem 0.75rem;
	font-size: 1rem;
	line-height: 1.5;
	border-radius: 10px;
	text-transform: uppercase;
	letter-spacing: 0.7;
}

.btn-primary {
	color: white;
	background-color: ForestGreen;
	border-color: ForestGreen;
}
</style>
</head>
<body>
		
		<div class="container">
			<h2>Verify Your Account</h2>
			<p>
				We emailed you the six digit code to ${email} <br /> Enter
				the digit below to confirm your email address
			</p>
			<form action="${emailType}" method="post" onsubmit="return validate()">
			<div class="digit-container">
					<input type="number" class="digit" placeholder="0" min="0" max="9"
						required> <input type="number" class="digit"
						placeholder="0" min="0" max="9" required> <input
						type="number" class="digit" placeholder="0" min="0" max="9"
						required> <input type="number" class="digit"
						placeholder="0" min="0" max="9" required> <input
						type="number" class="digit" placeholder="0" min="0" max="9"
						required> <input type="number" class="digit"
						placeholder="0" min="0" max="9" required>
				
			</div>

			<div>
				<button type="submit" class="btn btn-primary">Verify</button>
			</div>
			</form>
			<small class="info"> If you didn't receive a code <strong>
					RESEND</strong>
			</small>

	<script> 
	const digits = document.querySelectorAll('.digit');
	
	digits[0].focus();
	
	digits.forEach((digit, ind) => {
	    digit.addEventListener('keydown', (e) => {
	        if(e.key >= 0 && e.key <=9) {
	            digits[ind].value = '';
	           	if(isChain(ind-1) == true && isLast(ind+1))
	            	setTimeout(() => digits[ind + 1].focus(), 10);
	        } else if(e.key === 'Backspace') {
	        	if(isChain(ind) == true && isLast(ind+1))
	            	setTimeout(() => digits[ind - 1].focus(), 10);
	        }
	    });
	});
	
	function isChain(ind){
		for(var i = ind; i >= 0; i--){
			if(digits[i].value == '')
				return false;
		}
		return true;
	}
	
	function isLast(ind){
		for(var i = ind; i <= 5; i++){
			if(digits[i].value != '')
				return false;
		}
		return true;
	}
	
	//code is a variable that will be passed trust
	function validate(){
		digits.forEach((digit, ind) => {
		    if(digit.value != code[ind])
		    	return false;
		});
		return true;
	}
</script>
</body>
</html>
