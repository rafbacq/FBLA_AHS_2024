<!DOCTYPE html>

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
						required> <input onfocus="this.value = this.value;" type="number" class="digit"
						placeholder="0" min="0" max="9" required>
				
			</div>

			<div>
				<button type="submit" class="btn btn-primary">Verify</button>
			</div>
			</form>
			<!--<small class="info"> If you didn't receive a code <strong>
					RESEND</strong>
			</small>-->

	<script> 
	const digits = document.querySelectorAll('.digit');
    var num = 0;
	
	digits[0].focus();
	
	digits.forEach((digit, ind) => {
	    digit.addEventListener('keydown', (e) => {
	        if(e.key >= 0 && e.key <= 9) {
	            digits[ind].value = '';
        		num = num & ((1 << 6)-1) - (1 << ind);
	           	if(num == (1 << ind)-1)
	            	setTimeout(() => digits[ind + 1].focus(), 10);
                    num |= 1 << ind;
	        } else if(e.key === 'Backspace') {
            	digits[ind].value ='';
            	num = num & ((1 << 6)-1) - (1 << ind);
	           	if(num == (1 << ind)-1)
	            	setTimeout(() => digits[ind - 1].focus(), 10);
                    
                
	        }
	    });
        
        digit.addEventListener('paste', (e) => {
        	e.stopPropagation();
  			e.preventDefault();
            
            var clipboard = e.clipboardData || window.clipboardData;
  			var pasted = clipboard.getData('Text');
            
            if(Number(paste) == NaN){
            	return;
            }
            
            for(var i = ind; i < 6 && i - ind < pasted.length; i++){
            	digits[i].value = pasted[i - ind];
                num = num | (1 << i);
            }
            
            setTimeout(() => digits[i-1].focus(), 10);
        
        });
	});
	
	
	//code is a variable that will be passed trust
	function validate(){
		let number = ${code};
		
		let codeArray = number.toString().split("");
		let ret = true; 
		debugger;
		digits.forEach((digit, ind) => {
		    if(digit.value !== codeArray[ind]) {
		    	ret = false; 
		    }
		});
		return ret;
	}
</script>
</body>
</html>
