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
	</head>

	<body>
		<jsp:include page="farmer-sidebar.jsp"></jsp:include>
		
		<div class="main">
			<h1>Welcome - <%=session.getAttribute("uname").toString().toUpperCase()%></h1>
<%@include file="connection.jsp"%>

<%
	ResultSet rs = con.createStatement().executeQuery("select * from loan_application where f_id="+session.getAttribute("uid"));
%>
<table border=1 width=500>
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
</tr>
<%} %>
</table>

		</div>		
	</body>
</html>