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
	String date = request.getParameter("date");
	ResultSet rs = con.createStatement().executeQuery("select bill_no, bill_date, bill_amt, c_name, cow_qty, buffalo_qty, pay_mode, card_no, card_holder, status from customer_bill, customer where customer_bill.cust_id = customer.c_id and bill_date='"+date+"'");
%>
			<div class="container">
				<table class="table table-hover">
	    		<thead>
		      		<tr>
		        		<th>Bill No</th>
			        	<th>Bill Date</th>
			        	<th>Bill Amount</th>
			        	<th>Customer</th>
			        	<th>Cow Qty</th>
			        	<th>Buffalo Qty</th>
			        	<th>Pay Mode</th>
			        	<th>Card No</th>
			        	<th>Card Holder</th>
			        	<th>Status</th>
			      	</tr>
	    		</thead>
	    		<tbody>
<% while(rs.next()) { %>	    		
		      		<tr>
		        		<td><%=rs.getString(1)%></td>
		        		<td><%=rs.getString(2)%></td>
		        		<td><%=rs.getString(3)%></td>
		        		<td><%=rs.getString(4)%></td>
		        		<td><%=rs.getString(5)%></td>
		        		<td><%=rs.getString(6)%></td>
		        		<td><%=rs.getString(7)%></td>
		        		<td><%=rs.getString(8)%></td>
		        		<td><%=rs.getString(9)%></td>
		        		<td><%=rs.getString(10)%></td>
		      		</tr>
<% } %>		      		
				</tbody>
	  			</table>
			</div>
		</div>		
	</body>
</html>