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
<style>
.version-item {
	background-color: #edf2faff;
}

.version-item:hover {
	background-color: #dde3eaff;
}
</style>
</head>
<body id = "demo">

	<script>
		
		
		function loadTable(table) {
			
			var name = table.textContent;
			document.getElementById("time").innerHTML = name;
			document.getElementById("invisInput").value= name;
			
			name = name.trim().replaceAll(",", "").replaceAll(" ", "_")
					.replaceAll(":", "_").toLowerCase();
			
			if(name.includes("today")){
				name = "partners";
				document.getElementById("restore").disabled = true;
			}else{
				document.getElementById("restore").disabled = false;
			}

			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					var partnersList = JSON.parse(this.responseText);
					var tableBody = document.getElementById("table-body");
					tableBody.innerHTML = '';
					
					for(var i = 0; i < partnersList.length; i++){
						var cur_row = document.createElement("tr");
						var partner = partnersList[i];
						
						for(var col in partner){
							var cur_cell = document.createElement("td");
							cur_cell.innerHTML = partner[col];
							cur_row.appendChild(cur_cell);
						}
						
						tableBody.appendChild(cur_row);
					}
				}
			};

			xhttp.open("POST", "display", true);
			xhttp.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			xhttp.send("tname=" + name);

		}
		
	</script>

	<div class="container-fluid p-0">
		<div class="row no-gutters">
			<div class="col flex-column">
				<nav class="navbar navbar-expand-md navbar-dark"
					style="background-color: green; align-items:center;">
					<span id="time" class="h2" style="color: white; text-transform: capitalize;">
					</span>
					<form class = "ml-auto" action="restore-table" method="post">
						<button type="submit" class="btn btn-dark ml-auto" id="restore">Restore this Version</button>
						<input style="display:none;" name="tableName" id="invisInput"></input>
					</form>
				</nav>

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

					<tbody id="table-body">

					</tbody>



				</table>


			</div>
			<div
				class="col-3 vh-100 nav flex-column list-group-flush border-left border-dark"
				style="background-color: #edf2faff;">
				<br>
				<h1 id = "test" style="text-align: center;">Version History</h1>
				<hr>

				<c:forEach var="table" items="${listTable}">
					<a href="#"
						class="list-group-item version-item text-secondary"
						onclick="loadTable(this)"> <c:if test="${table.length() <= 8}">
                            Today, <%=new java.util.Date()%>
						</c:if> <c:if test="${table.length() > 8}">
							<span style="text-transform: capitalize;"> ${table} </span>
						</c:if>

					</a>
				</c:forEach>
			</div>
			<div></div>
</body>
</html>
