<%
	if(session.getAttribute("uid")==null){
		response.sendRedirect("index.jsp");
		return;
	}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="connection.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Admin</title>

		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="css/dashboard.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	</head>

	<body>
		<jsp:include page="staff-sidebar.jsp"></jsp:include>
		
		<div class="main">
			<h1>Welcome - <%=session.getAttribute("uname").toString().toUpperCase()%></h1>

<%
	ResultSet rs = con.createStatement().executeQuery("SELECT AUTO_INCREMENT FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dairy' AND TABLE_NAME = 'customer';");
	rs.next();
	int id = rs.getInt(1);
	
	rs = con.createStatement().executeQuery("select * from customer");
%>
			<div class="container">
				<button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#myModal">Add Customer</button>
				<table class="table table-hover">
	    		<thead>
		      		<tr>
		        		<th>ID</th>
				        <th>Name</th>
			        	<th>Address</th>
			        	<th>Phone</th>
			        	<th>Email</th>
			        	<th>Reg Date</th>
			        	<th></th>
			        	<th></th>
			      	</tr>
	    		</thead>
	    		<tbody>
<% while(rs.next()) { %>	    		
		      		<tr>
		        		<td><%=rs.getString("c_id")%></td>
		        		<td><%=rs.getString("c_name")%></td>
		        		<td><%=rs.getString("c_address")%></td>
		        		<td><%=rs.getString("c_phone")%></td>
		        		<td><%=rs.getString("c_email")%></td>
		        		<td><%=rs.getString("c_regdate")%></td>
						<td><a href="edit-customer.jsp?id=<%=rs.getInt(1)%>" class="btn btn-sm btn-danger">Edit</a></td>
						<td><a href="delete-customer.jsp?id=<%=rs.getInt(1)%>" class="btn btn-sm btn-danger" onclick="return confirm('Delete?');">Delete</a></td>
		      		</tr>
<% } %>		      		
				</tbody>
	  			</table>
			</div>
			
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
        	<div class="modal-header">
          		<button type="button" class="close" data-dismiss="modal">&times;</button>
          		<h4 class="modal-title">Customer Details</h4>
        	</div>
	        <div class="modal-body">

				<form action="add-customer.jsp" method="post">
					<div class="form-group">
				    	<label>ID:</label>
				    	<input type="text" class="form-control" name="id" value="<%=id%>" readOnly>
				  	</div>
					<div class="form-group">
				    	<label>Name:</label>
				    	<input type="text" class="form-control" name="name" required>
				  	</div>
					<div class="form-group">
				    	<label>Address:</label>
				    	<input type="text" class="form-control" name="addr" required>
				  	</div>				  	
					<div class="form-group">
				    	<label>Phone:</label>
				    	<input type="text" class="form-control" name="phone" pattern="^[6789]\d{9}$" required>
				  	</div>
					<div class="form-group">
				    	<label>Email:</label>
				    	<input type="email" class="form-control" name="email" required>
				  	</div>
				  	<button type="submit" class="btn btn-success" name="submit">Save</button>
				</form>	        
	        
        	</div>
        	<div class="modal-footer">
          		<button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
        	</div>
      	</div>      
   	</div>
</div>

		</div>		
	</body>
</html>