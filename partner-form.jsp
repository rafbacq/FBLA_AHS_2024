<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Partner Management Application</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: green">
            <div>
            <img class="school-logo" src="https://ahs.hcpss.org/sites/default/files/atholtonhs.png" alt="Logo image" style="width:60px">
                <a href="https://www.javaguides.net" class="navbar-brand"> Partner Management App </a>
            </div>
            <ul class="navbar-nav">
                <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Register new partner</a></li>
            </ul>
        </nav>
    </header>
    <br>
    <div class="container col-md-5">
        <div class="card">
            <div class="card-body">
                <c:if test="${partner != null}">
                    <form action="update" method="post" onsubmit="return validateForm()">
                </c:if>
                <c:if test="${partner == null}">
                    <form action="insert" method="post" onsubmit="return validateForm()">
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
                    <label>Partner Name</label>
                    <input type="text" value="<c:out value='${partner.contactName}' />" class="form-control"
                        name="contactName" required="required" pattern="[A-Za-z\s]+" title="Only letters are allowed" autocomplete = "off">
                </fieldset>
                <fieldset class="form-group">
                    <label>Partner Organization Name</label>
                    <input type="text" value="<c:out value='${partner.orgName}' />" class="form-control" name="orgName"
                        required="required" pattern="[A-Za-z0-9\s]+" title="Alphanumeric characters and spaces only" autocomplete = "off">
                </fieldset>
                <fieldset class="form-group">
                    <label>Partner Type of Organization</label>
                    <input type="text" value="<c:out value='${partner.typOrg}' />" class="form-control" name="typOrg"
                        required="required" pattern="[A-Za-z\s]+" title="Only letters and spaces are allowed" autocomplete = "off">
                </fieldset>
                <fieldset class="form-group">
                    <label>Partner Email</label>
                    <input type="email" value="<c:out value='${partner.contactEmail}' />" class="form-control"
                        name="contactEmail" required="required" oninput="validateEmail()" autocomplete = "off">
                    <small class="form-text text-muted" id="emailValidationMsg"></small>
                </fieldset>
                <fieldset class="form-group">
                    <label>Partner Phone</label>
                    <input type="tel" value="<c:out value='${partner.contactPhone}' />" class="form-control"
                        name="contactPhone" required="required" pattern="[0-9]{10}"
                        title="Enter a 10-digit phone number" autocomplete = "off">
                </fieldset>
                <button type="submit" class="btn btn-success">Save</button>
                </form>
            </div>
        </div>
    </div>
    <script>
        function validateEmail() {
            var emailInput = document.getElementsByName("contactEmail")[0];
            var emailValidationMsg = document.getElementById("emailValidationMsg");
            var validDomains = ["@gmail.com", "@hotmail.com", "@yahoo.com", "@aol.com", "@icloud.com"];
            
            if (emailInput.checkValidity()) {
                var isValidDomain = false;
                for (var i = 0; i < validDomains.length; i++) {
                    if (emailInput.value.endsWith(validDomains[i])) {
                        isValidDomain = true;
                        break;
                    }
                }
                
                if (isValidDomain) {
                    emailValidationMsg.textContent = "";
                } else {
                    emailValidationMsg.textContent = "Please only use a gmail, hotmail, yahoo, aol, or icloud account.";
                }
            } else {
                emailValidationMsg.textContent = "Please enter a valid email address.";
            }
        }
        
        function validateForm() {
            // Additional validation logic if needed
            validateEmail(); // Validate email before submitting the form
            return document.getElementById("emailValidationMsg").textContent === ""; // Return false if validation fails
        }
    </script>
</body>
</html>
