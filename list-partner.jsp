<%@ page language="java" contentType="text/html; charset=UTF-8"

 pageEncoding="UTF-8"%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

        <html>



        <head>

            <title>User Management Application</title>

            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        </head>



        <body>



            <header>

                <nav class="navbar navbar-expand-md navbar-dark" style="background-color: green">

                    <div>

                        <a href="https://ahs.hcpss.org/" class="navbar-brand"> Atholton High School Career Tech Education Department </a>

                    </div>



                    <ul class="navbar-nav">

                        <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Partners List</a></li>

                    </ul>

                </nav>

            </header>

            <br>       

            <div class="row">

                <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->



                <div class="container">

                    <h3 class="text-center">List of Partners</h3>

                    <hr>

                    <div class="container text-left">



                        <a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add

     New Partner</a>

                    </div>

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