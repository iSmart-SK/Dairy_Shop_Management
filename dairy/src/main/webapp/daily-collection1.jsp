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
<%@include file="connection.jsp"%>

<% 
	String type = request.getParameter("type");
	String when = request.getParameter("when");
	String date = request.getParameter("date");
	
	String sql = "select trn_no,qty,f_name from collection,farmer where collection.f_id = farmer.f_id and collection_date = '"+date+"' and collection_time='"+when+"' and milk_type='"+type+"'";
	
	ResultSet rs = con.createStatement().executeQuery(sql);
	
%>
<table border=1 width=400>
<tr>
	<th>Trn No</th>
	<th>Qty</th>
	<th>Farmer Name</th>
</tr>
<% 
	while(rs.next()){
%>
<tr>
	<td align='center'><%=rs.getString(1)%></td>
	<td align='center'><%=rs.getString(2)%></td>
	<td align='center'><%=rs.getString(3)%></td>
</tr>
<% 
	}
%>
</table>


		</div>		
	</body>
</html>