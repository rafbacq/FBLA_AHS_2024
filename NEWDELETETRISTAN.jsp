<%@ page language="java" contentType="text/html; charset=UTF-8"

 pageEncoding="UTF-8"%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirmation</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <style>
        

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

        
         .btn-confirm {
         	margin-top: 20px;
            background-color: #dc3545;
            border-color: #dc3545;
        }

        .btn-confirm:hover {
            background-color: #b62a38ff;
            border-color: #bd2130;
        }
    </style>
</head>

<body>
 <div class="container">
 
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#deleteModal"  oncontextmenu="return showModal();">Right Click me or Left Click me</button>

  <div class="modal fade" aria-hidden="true" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Confirm Deletion</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p class="lead">Are you sure you want to delete the following partner?</p>

            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead class="thead-light">
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Organization Name</th>
                            <th>Organization Type</th>
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
                <button type="submit" class="btn btn-confirm btn-block text-white h1">Yes, Delete</button>
               
            </form>
           
        </div>
      </div>
    </div>
  </div>
</div>
  
</div>
<script>
	function showModal(){
		$('#deleteModal').modal('show');
		return false;
	}
</script>
</body>

</html>
