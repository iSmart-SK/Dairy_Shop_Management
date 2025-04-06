<%
	if(session.getAttribute("uid")==null){
		response.sendRedirect("index.jsp");
		return;
	}
%>

<%@include file="connection.jsp"%>

<%
	ResultSet rs = con.createStatement().executeQuery("select * from employee where eid="+request.getParameter("id"));
	rs.next();
	
	if(request.getParameter("submit")!=null){
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		float salary = Float.parseFloat(request.getParameter("salary"));
		String desgn = request.getParameter("desgn");
		String addr = request.getParameter("addr");
		
		PreparedStatement ps = con.prepareStatement("update employee set ename=?, gender=?, email=?, phno=?, salary=?, designation=?, address=? where eid=?");
		ps.setString(1, name);
		ps.setString(2, gender);
		ps.setString(3, email);
		ps.setString(4, phone);
		ps.setFloat(5, salary);
		ps.setString(6, desgn);
		ps.setString(7, addr);
		ps.setInt(8, id);
		ps.executeUpdate();
		out.print("<script type='text/javascript'>alert('Staff updated successfully');location.href = 'staff.jsp';</script>");		
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
				    	<label>Email:</label>
				    	<input type="email" class="form-control" name="email" value="<%=rs.getString(4)%>" required>
				  	</div>
					<div class="form-group">
				    	<label>Phone:</label>
				    	<input type="text" class="form-control" name="phone" pattern="^[6789]\d{9}$" value="<%=rs.getString(5)%>" required>
				  	</div>
					<div class="form-group">
				    	<label>Salary:</label>
				    	<input type="text" class="form-control" name="salary" value="<%=rs.getString(6)%>" required>
				  	</div>
					<div class="form-group">
				    	<label>Designation:</label>
				    	<select name="desgn" class="form-control" required>
				    	<option value="<%=rs.getString(7)%>"><%=rs.getString(7)%></option>
				    	<option value="">Designation</option>
				    	<option value="Manager">Manager</option>
				    	<option value="Staff">Staff</option>
				    	</select>
				  	</div>
					<div class="form-group">
				    	<label>Address:</label>
				    	<input type="text" class="form-control" name="addr" value="<%=rs.getString(8)%>" required>
				  	</div>				  	
				  	<button type="submit" class="btn btn-success" name="submit">Update</button>
				</form>	        

		</div>		
	</body>
</html>