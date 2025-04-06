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
		<title>Farmer</title>

		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="css/dashboard.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	</head>

	<body>
		<jsp:include page="farmer-sidebar.jsp"></jsp:include>
		
		<div class="main">
			<h1>Welcome - <%=session.getAttribute("uname").toString().toUpperCase()%></h1>
<%@include file="connection.jsp"%>

<%	
	if(request.getParameter("submit")!=null){
		String bdate = request.getParameter("bdate");
		String id = request.getParameter("id");
		String amt = request.getParameter("amt");
		String reason = request.getParameter("reason");
		
		con.createStatement().executeUpdate("insert into loan_application values("+id+",'"+bdate+"',"+session.getAttribute("uid")+","+amt+",'"+reason+"','Pending')");
		out.print("<script>alert('Your loan application is submitted. Wait for admin approval');location.href='farmer-dashboard.jsp'</script>");
	}
ResultSet rs = con.createStatement().executeQuery("SELECT AUTO_INCREMENT FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dairy' AND TABLE_NAME = 'loan_application';");
rs.next();
int id = rs.getInt(1);
rs = con.createStatement().executeQuery("select current_date");
rs.next();
String bdate = rs.getString(1);

%>

				<form method="post">
					<div class="form-group">
				    	<label>Application No:</label>
				    	<input type="text" class="form-control" name="id" value="<%=id%>" readOnly>
				  	</div>
					<div class="form-group">
				    	<label>Application Date:</label>
				    	<input type="text" class="form-control" name="bdate" value="<%=bdate%>" required>
				  	</div>
					<div class="form-group">
				    	<label>Loan Amount:</label>
				    	<input type="number" min=1000 class="form-control" name="amt"  required>
				  	</div>				  	
					<div class="form-group">
				    	<label>Reason:</label>
				    	<input type="text" class="form-control" name="reason"  required>
				  	</div>				  	
				  	<button type="submit" class="btn btn-success" name="submit">Apply</button>
				</form>	        

		</div>		
	</body>
</html>