<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirmation</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
    <style>
        body {
            background-color: #ffffff;
            color: #333333;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .confirmation-container {
            max-width: 600px;
            width: 100%;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            margin: 20px;
            opacity: 0; /* Initial opacity set to 0 */
            animation: fadeIn 0.5s forwards; /* Animation to fade in */
        }

        .confirmation-header {
            background-color: #007bff;
            color: #ffffff;
            padding: 20px;
            text-align: center;
        }

        .confirmation-content {
            padding: 20px;
        }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #dee2e6;
        }

        th {
            background-color: #007bff;
            color: #ffffff;
        }

        button {
            margin-top: 20px;
        }

        .btn-confirm {
            background-color: #dc3545;
            border-color: #dc3545;
        }

        .btn-confirm:hover {
            background-color: #c82333;
            border-color: #bd2130;
        }

        .btn-cancel {
            background-color: #6c757d;
            border-color: #6c757d;
        }

        .btn-cancel:hover {
            background-color: #5a6268;
            border-color: #545b62;
        }

        @keyframes fadeIn {
            to {
                opacity: 1;
            }
        }
    </style>
</head>

<body>

    <div class="confirmation-container">
        <div class="confirmation-header">
            <h3>Confirmation</h3>
        </div>

        <div class="confirmation-content">
            <p class="lead">Are you sure you want to delete the following partner?</p>

            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead class="thead-light">
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
                        <tr>
                            <td><c:out value="${partner.id}" /></td>
                            <td><c:out value="${partner.contactName}" /></td>
                            <td><c:out value="${partner.orgName}" /></td>
                            <td><c:out value="${partner.typOrg}" /></td>
                            <td><c:out value="${partner.contactEmail}" /></td>
                            <td><c:out value="${partner.contactPhone}" /></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <form action="<%=request.getContextPath()%>/delete" method="post">
                <input type="hidden" name="id" value="${partner.id}" />
                <input type="hidden" name="confirmDelete" value="true" />
                <button type="submit" class="btn btn-confirm btn-block">Yes, Delete</button>
                <a href="<%=request.getContextPath()%>/list" class="btn btn-cancel btn-block">No, Cancel</a>
            </form>
        </div>
    </div>

</body>

</html>
