<%@include file="connection.jsp" %>
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
		<title>Admin</title>

		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="css/dashboard.css">
	</head>

	<body>
		<jsp:include page="staff-sidebar.jsp"></jsp:include>
		
		<div class="main">
			<h1>Welcome - <%=session.getAttribute("uname").toString().toUpperCase()%></h1>

		<%
			ResultSet rs = con.createStatement().executeQuery("select * from stock");
			rs.next();
		%>
			<div class="container">
				<table border="1">
				<tr>
					<td><b>Cow:</b></td>
					<td><%=rs.getInt(1)%> Ltrs</td>
				</tr>
				<tr>
					<td><b>Buffalo:</b></td>
					<td><%=rs.getInt(2)%> Ltrs</td>
				</tr>
				</table>
			
			</div>

		</div>
		
				
	</body>
</html>