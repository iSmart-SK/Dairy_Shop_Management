<%
	if(session.getAttribute("uid")==null){
		response.sendRedirect("index.jsp");
		return;
	}
%>

<%@include file="connection.jsp"%>

<%
	ResultSet rs = con.createStatement().executeQuery("select * from farmer where f_id="+request.getParameter("id"));
	rs.next();
	
	if(request.getParameter("submit")!=null){
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String addr = request.getParameter("addr");
		
		PreparedStatement ps = con.prepareStatement("update farmer set f_name=?, f_gender=?, f_email=?, f_phone=?, f_address=? where f_id=?");
		ps.setString(1, name);
		ps.setString(2, gender);
		ps.setString(3, email);
		ps.setString(4, phone);
		ps.setString(5, addr);
		ps.setInt(6, id);
		ps.executeUpdate();
		out.print("<script type='text/javascript'>alert('Farmer updated successfully');location.href = 'farmer.jsp';</script>");		
	}
%>
	

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				    	<label>Gender:</label>
				    	<select name="gender" class="form-control" required>
				    	<option value='<%=rs.getString(3)%>'><%=rs.getString(3)%></option>
				    	<option value="">Gender</option>
				    	<option value="Male">Male</option>
				    	<option value="Female">Female</option>
				    	</select>
				  	</div>
					<div class="form-group">
				    	<label>Address:</label>
				    	<input type="text" class="form-control" name="addr" value="<%=rs.getString(4)%>" required>
				  	</div>				  	
					<div class="form-group">
				    	<label>Phone:</label>
				    	<input type="text" class="form-control" name="phone" pattern="^[6789]\d{9}$" value="<%=rs.getString(5)%>" required>
				  	</div>
					<div class="form-group">
				    	<label>Email:</label>
				    	<input type="email" class="form-control" name="email" value="<%=rs.getString(6)%>" required>
				  	</div>
				  	<button type="submit" class="btn btn-success" name="submit">Update</button>
				</form>	        
		</div>		
	</body>
</html>