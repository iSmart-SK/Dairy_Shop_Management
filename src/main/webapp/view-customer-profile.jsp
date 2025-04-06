<%
	if(session.getAttribute("uid")==null){
		response.sendRedirect("index.jsp");
		return;
	}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Customer</title>

		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="css/dashboard.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		
		
	</head>

	<body>
		<jsp:include page="customer-sidebar.jsp"></jsp:include>
		
		<div class="main">
			<h1>Welcome - <%=session.getAttribute("uname").toString().toUpperCase()%></h1>
<%@include file="connection.jsp" %>			
<%
	ResultSet rs = con.createStatement().executeQuery("select * from customer where c_id="+session.getAttribute("uid"));
	rs.next();
	
	if(request.getParameter("submit")!=null){
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String addr = request.getParameter("addr");
		
		PreparedStatement ps = con.prepareStatement("update customer set c_name=?, c_email=?, c_phone=?, c_address=? where c_id=?");
		ps.setString(1, name);
		ps.setString(2, email);
		ps.setString(3, phone);
		ps.setString(4, addr);
		ps.setInt(5, id);
		ps.executeUpdate();
		out.print("<script type='text/javascript'>alert('Customer updated successfully');location.href = 'customer-dashboard.jsp';</script>");		
	}
%>


				<form method="post">
					<div class="form-group">
				    	<label>ID:</label>
				    	<input type="text" class="form-control" name="id" value="<%=rs.getString(1)%>" readOnly>
				  	</div>
					<div class="form-group">
				    	<label>Name:</label>
				    	<input type="text" class="form-control" name="name" value="<%=rs.getString(2)%>" required>
				  	</div>
					<div class="form-group">
				    	<label>Address:</label>
				    	<input type="text" class="form-control" name="addr" value="<%=rs.getString(3)%>" required>
				  	</div>				  	
					<div class="form-group">
				    	<label>Phone:</label>
				    	<input type="text" class="form-control" name="phone" pattern="^[6789]\d{9}$" value="<%=rs.getString(4)%>" required>
				  	</div>
					<div class="form-group">
				    	<label>Email:</label>
				    	<input type="email" class="form-control" name="email" value="<%=rs.getString(5)%>" required>
				  	</div>
				  	<button type="submit" class="btn btn-success" name="submit">Update</button>
				</form>	        

			
		</div>		
	</body>
</html>