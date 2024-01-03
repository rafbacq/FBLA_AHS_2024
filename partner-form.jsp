<%@ page language="java" contentType="text/html; charset=UTF-8"

 pageEncoding="UTF-8"%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

        <html>



        <head>

            <title>Partner Management Application</title>

            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        </head>



        <body>



            <header>

                <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">

                    <div>

                        <a href="https://www.javaguides.net" class="navbar-brand"> Partner Management App </a>

                    </div>



                    <ul class="navbar-nav">

                        <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Partners</a></li>

                    </ul>

                </nav>

            </header>

            <br>

             <div class="container col-md-5">

                <div class="card">

                    <div class="card-body">

                        <c:if test="${partner != null}">

                            <form action="update" method="post">

                        </c:if>

                        <c:if test="${partner == null}">

                            <form action="insert" method="post">

                        </c:if>



                        <caption>

                            <h2>

                                <c:if test="${partner != null}">

                                    Edit Partner

                                </c:if>

                                <c:if test="${partner == null}">

                                    Add New Partner

                                </c:if>

                            </h2>

                        </caption>



                        <c:if test="${partner != null}">

                            <input type="hidden" name="id" value="<c:out value='${partner.id}' />" />

                        </c:if>



                        <fieldset class="form-group">

                            <label>Partner Name</label> <input type="text" value="<c:out value='${partner.contactName}' />" class="form-control" name="contactName" required="required">

                        </fieldset>



                        <fieldset class="form-group">

                            <label>Partner Organization Name</label> <input type="text" value="<c:out value='${partner.orgName}' />" class="form-control" name="orgName">

                        </fieldset>
                        
                        <fieldset class="form-group">

                            <label>Partner Type of Organization</label> <input type="text" value="<c:out value='${partner.typOrg}' />" class="form-control" name="typOrg">

                        </fieldset>
                        
                        <fieldset class="form-group">

                            <label>Partner Email</label> <input type="text" value="<c:out value='${partner.contactEmail}' />" class="form-control" name="contactEmail">

                        </fieldset>
                        
                        <fieldset class="form-group">

                            <label>Partner Phone</label> <input type="text" value="<c:out value='${partner.contactPhone}' />" class="form-control" name="contactPhone">

                        </fieldset>



                        



                        <button type="submit" class="btn btn-success">Save</button>

                        </form>

                    </div>

                </div>

            </div>

        </body>



        </html>