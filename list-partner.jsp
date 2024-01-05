<%@ page language="java" contentType="text/html; charset=UTF-8"

 pageEncoding="UTF-8"%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

        <html>
      
        <head>
            <title>Partner Management Application</title>

            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
       		
       		<style>
				.dropbtn {
				  background-color: #04AA6D;
				  color: white;
				  padding: 16px;
				  font-size: 16px;
				  border: none;
				  cursor: pointer;
				}
				.gobtn {
				  border: none;
				  color: black;
				  padding: 10px 10px;
				  font-size: 16px;
				  cursor: pointer;
				  text-align: center;
				  cursor: pointer;
				  width: 35%;
				  box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
				  position: relative;
				  top:15px; 
				}
				
				.dropbtn:hover, .dropbtn:focus {
				  background-color: #3e8e41;
				}
				
				#myInput {
				  box-sizing: border-box;
				  background-image: url('searchicon.png');
				  background-position: 14px 12px;
				  background-repeat: no-repeat;
				  font-size: 16px;
				  padding: 14px 20px 12px 45px;
				  border: none;
				  border-bottom: 1px solid #ddd;
				  box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
				  width: 100%; 
				  height:85%;
				  position: relative;
				  left:2px; 
				  top:12px;
				}
				
				#myInput:focus {outline: 3px solid #ddd;}
				
				.dropdown {
				  position: relative;
				  display: inline-block;
				}
				
				.dropdown-content {
				  display: none;
				  position: absolute;
				  background-color: #f6f6f6;
				  min-width: 230px;
				  overflow: auto;
				  border: 1px solid #ddd;
				  z-index: 1;
				}
				
				.dropdown-content a {
				  color: black;
				  padding: 12px 16px;
				  text-decoration: none;
				  display: block;
				  position: relative;
				  left:10px; 
				}
				
				.dropdown a:hover {background-color: #ddd;}
				
				.show {display: block;}   		
				.left-btn { float: left; }
				.right-btn { float: right; }
       		</style>
 
        </head>
        
        <body>

            <header>

                <nav class="navbar navbar-expand-md navbar-dark" style="background-color: green">

                    <div>

      					<img class="school-logo" src="https://ahs.hcpss.org/sites/default/files/atholtonhs.png" alt="Logo image" style="width:60px">
    
                        <a href="https://ahs.hcpss.org/" class="navbar-brand"> Atholton High School Career Tech Education Department </a>

                    </div>



                    <ul class="navbar-nav">

                        <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Partners List</a></li>

                    </ul>

                </nav>

            </header>
			<script>
				/* When the user clicks on the button,
				toggle between hiding and showing the dropdown content */
				function myFunction() {
				  document.getElementById("myDropdown").classList.toggle("show");
				  document.getElementById("goSubmit").style.visibility="hidden"
				}
				function onSelectByName(checkBox) {
					document.getElementById("goSubmit").style.visibility="hidden"
					
					if (checkBox.checked == true) { 
						document.getElementById("byOrgName").checked = false; 
						document.getElementById("byOrgType").checked = false;
						document.getElementById("byEmail").checked = false; 
						document.getElementById("byPhone").checked = false;
						
						
						if ( document.getElementById("myInput").value.length >0) {
							document.getElementById("goSubmit").style.visibility="visible"
						}
					}
				}
				function onSelectByOrgName(checkBox) {
					document.getElementById("goSubmit").style.visibility="hidden"
					
					if (checkBox.checked == true) { 
						document.getElementById("byName").checked = false; 
						document.getElementById("byOrgType").checked = false;
						document.getElementById("byEmail").checked = false; 
						document.getElementById("byPhone").checked = false; 
						
						if ( document.getElementById("myInput").value.length >0) {
							document.getElementById("goSubmit").style.visibility="visible"
						}
					}
				}
				function onSelectByOrgType(checkBox) {
					document.getElementById("goSubmit").style.visibility="hidden"
					
					if (checkBox.checked == true) { 
						document.getElementById("byName").checked = false; 
						document.getElementById("byOrgName").checked = false;
						document.getElementById("byEmail").checked = false; 
						document.getElementById("byPhone").checked = false; 
						
						if ( document.getElementById("myInput").value.length >0) {
							document.getElementById("goSubmit").style.visibility="visible"
						}
					}
				}
				function onSelectByEmail(checkBox) {
					document.getElementById("goSubmit").style.visibility="hidden"
					if (checkBox.checked == true) { 
						document.getElementById("byName").checked = false; 
						document.getElementById("byOrgName").checked = false;
						document.getElementById("byOrgType").checked = false; 
						document.getElementById("byPhone").checked = false;
						if ( document.getElementById("myInput").value.length >0) {
							document.getElementById("goSubmit").style.visibility="visible"
						}
							
					}
				}
				function onSelectByPhone(checkBox) {
					document.getElementById("goSubmit").style.visibility="hidden"
					if (checkBox.checked == true) { 
						document.getElementById("byName").checked = false; 
						document.getElementById("byOrgName").checked = false;
						document.getElementById("byOrgType").checked = false; 
						document.getElementById("byEmail").checked = false;
						if ( document.getElementById("myInput").value.length >0) {
							document.getElementById("goSubmit").style.visibility="visible"
						}
					}
				}
				function checkInput(input) {
					document.getElementById("goSubmit").style.visibility="hidden"
					if (input.value.length >0) {
						if (document.getElementById("byName").checked  ||
							document.getElementById("byOrgName").checked ||
							document.getElementById("byOrgType").checked ||
							document.getElementById("byEmail").checked ||
							document.getElementById("byPhone").checked ) {
							
							document.getElementById("goSubmit").style.visibility="visible"
						}
					}
					
				}
			
			</script>
            <br>       

            <div class="row">

                <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->



                <div class="container">

                    <h3 class="text-center">List of Partners</h3>

                    <hr>

                    <div class="container text-left">

					 	<a href="<%=request.getContextPath()%>/new" class="btn btn-success"  style="float: left;width:160px">Add New Partner</a>
                        <a href="<%=request.getContextPath()%>/" class="btn btn-success" style="position: relative; left: 12px; width:160px" >List All Partners</a>

                    

					<div class="dropdown" style="float: right">
						<button onclick="myFunction()" class="btn btn-success" class="btn btn-success"  style="width:160px; height:50px">Filter..</button>
						<div id="myDropdown" class="dropdown-content">
						  

			            <form action="${pageContext.request.contextPath}/" method="post">
			            
	
                           
			                <div class="form-check" style="left: 12px" >
			                    <input class="form-check-input" type="checkbox" id="byName" name="byName" onclick="onSelectByName(this)" />
			                    <label class="form-check-label" for="byName">By name</label>
			                </div>
			          
			            	<div class="form-check" style="left: 12px" >
			                    <input class="form-check-input" type="checkbox" id="byOrgName" name="byOrgName" onclick="onSelectByOrgName(this)" />
			                    <label class="form-check-label" for="byOrgName">By organization name</label>
			                </div>
			                
			              <div class="form-check" style="left: 12px" >
			                    <input class="form-check-input" type="checkbox" id="byOrgType" name="byOrgType" onclick="onSelectByOrgType(this)" />
			                    <label class="form-check-label" for="byOrgType">By organization type</label>
			                </div>
			                
			                <div class="form-check" style="left: 12px">
			                    <input class="form-check-input" type="checkbox"  id="byEmail"  name="byEmail" onclick="onSelectByEmail(this)"  />
			                    <label class="form-check-label" for="byEmail">By email</label>
			                </div>
			            
			                <div class="form-check" style="left: 12px">
			                    <input class="form-check-input" type="checkbox"   id="byPhone"  name="byPhone" onclick="onSelectByPhone(this)" />
			                    <label class="form-check-label" for="byPhone">By phone</label>
			                </div>
			                 
			              
							<input type="text"  placeholder="Find.." id="myInput" name="myInput" onkeyup="checkInput(this)" />
							<input type="submit" width = "20px" name="submit" id="goSubmit" value="Go" class="gobtn"  />
							 
						 
			    	  </form>
       
						   </div>
						  
						</div> 
						
				
					<br>
                    </div>
                  
                    <br>
                    <br>

                    <table class="table table-bordered">

                        <thead>

                            <tr>

                                <th>ID</th>

                                <th>Name</th>

                                <th>Organization Name</th>

                                <th>Type of Organization</th>

                                <th>Email</th>
                                
                                <th>Phone</th>


                            </tr>

                        </thead>

                        <tbody>

                            <!--   for (Todo todo: todos) {  -->

					<c:forEach var="partner" items="${listPartner}">



						<tr>

							<td><c:out value="${partner.id}" /></td>

							<td><c:out value="${partner.contactName}" /></td>

							<td><c:out value="${partner.orgName}" /></td>

							<td><c:out value="${partner.typOrg}" /></td>
							
							<td><c:out value="${partner.contactEmail}" /></td>
							
							<td><c:out value="${partner.contactPhone}" /></td>

							<td><a href="edit?id=<c:out value='${partner.id}' />">Edit</a>

								&nbsp;&nbsp;&nbsp;&nbsp; <a

								href="delete?id=<c:out value='${partner.id}' />">Delete</a></td>

						</tr>

					</c:forEach>

					<!-- } -->

                        </tbody>



                    </table>

                </div>

            </div>

        </body>



        </html>