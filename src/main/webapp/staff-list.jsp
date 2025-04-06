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
	ResultSet rs = con.createStatement().executeQuery("select * from employee");
%>
			<div class="container">
				<table class="table table-hover">
	    		<thead>
		      		<tr>
		        		<th>ID</th>
				        <th>Name</th>
			        	<th>Gender</th>
			        	<th>Email</th>
			        	<th>Phone</th>
			        	<th>Salary</th>
			        	<th>Designation</th>
			        	<th>Address</th>
			        	<th></th>
			        	<th></th>
			      	</tr>
	    		</thead>
	    		<tbody>
<% while(rs.next()) { %>	    		
		      		<tr>
		        		<td><%=rs.getString("eid")%></td>
		        		<td><%=rs.getString("ename")%></td>
		        		<td><%=rs.getString("gender")%></td>
		        		<td><%=rs.getString("email")%></td>
		        		<td><%=rs.getString("phno")%></td>
		        		<td><%=rs.getString("salary")%></td>
		        		<td><%=rs.getString("designation")%></td>
		        		<td><%=rs.getString("address")%></td>
		      		</tr>
<% } %>		      		
				</tbody>
	  			</table>
			</div>			
		</div>		
	</body>
</html>