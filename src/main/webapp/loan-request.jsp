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
		<jsp:include page="staff-sidebar.jsp"></jsp:include>
		
		<div class="main">
			<h1>Welcome - <%=session.getAttribute("uname").toString().toUpperCase()%></h1>
<%@include file="connection.jsp"%>

<%
	ResultSet rs = con.createStatement().executeQuery("select * from loan_application");
%>
<table class="table table-bordered">
<tr>
	<th>Application No</th>
	<th>Application Date</th>
	<th>Amount</th>
	<th>Reason</th>
	<th>Status</th>
</tr>
<%
	while(rs.next()){
%>
<tr>
	<th><%=rs.getString(1)%></th>
	<th><%=rs.getString(2)%></th>
	<th><%=rs.getString(4)%></th>
	<th><%=rs.getString(5)%></th>
	<th><%=rs.getString(6)%></th>
	<th><a href='change-status.jsp?id=<%=rs.getInt(1)%>&status=Accept' class="btn btn-success">Accept</th>
	<th><a href='change-status.jsp?id=<%=rs.getInt(1)%>&status=Reject' class="btn btn-success">Reject</th>
</tr>
<%} %>
</table>

		</div>		
	</body>
</html>