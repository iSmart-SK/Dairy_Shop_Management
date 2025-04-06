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
	ResultSet rs = con.createStatement().executeQuery("SELECT AUTO_INCREMENT FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dairy' AND TABLE_NAME = 'customer_bill';");
	rs.next();
	int id = rs.getInt(1);
	
	rs = con.createStatement().executeQuery("select current_date");
	rs.next();
	String bdate = rs.getString(1);
		
	rs = con.createStatement().executeQuery("select bill_no, bill_date, bill_amt, c_name, cow_qty, buffalo_qty, pay_mode, card_no, card_holder, status from customer_bill, customer where customer_bill.cust_id = customer.c_id");
%>
			<div class="container">
				<button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#myModal">Add Bill</button>
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
						<td><a href="delete-bill.jsp?id=<%=rs.getInt(1)%>" class="btn btn-sm btn-danger" onclick="return confirm('Delete?');">Delete</a></td>
		      		</tr>
<% } %>		      		
				</tbody>
	  			</table>
			</div>
			
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
        	<div class="modal-header">
          		<button type="button" class="close" data-dismiss="modal">&times;</button>
          		<h4 class="modal-title">Bill Details</h4>
        	</div>
	        <div class="modal-body">

				<form method="post" action="bill1.jsp">
					<div class="form-group">
				    	<label>Bill No:</label>
				    	<input type="text" class="form-control" name="id" value="<%=id%>" readOnly>
				  	</div>
					<div class="form-group">
				    	<label>Bill Date:</label>
				    	<input type="text" class="form-control" name="bdate" value="<%=bdate%>" readOnly>
				  	</div>
					<div class="form-group">
				    	<label>Customer:</label>
						<select name='cid' class="form-control" required>
						<option value=''>Select Customer</option>
<% 
	rs = con.createStatement().executeQuery("select * from customer");
	while(rs.next()){
%>
						<option value='<%=rs.getInt(1)%>'><%=rs.getString(2)%></option>
<%
	}
%>
	</select>	
				  	</div>
					<div class="form-group">
				    	<label>Cow Qty:</label>
				    	<input type="number" min=0 class="form-control" name="cqty" required value="0">
				  	</div>
					<div class="form-group">
				    	<label>Buffalo Qty:</label>
				    	<input type="number" min=0 class="form-control" name="bqty" required value="0">
				  	</div>
				  	<button type="submit" class="btn btn-success" name="submit">Save</button>
				</form>	        
	        
        	</div>
        	<div class="modal-footer">
          		<button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
        	</div>
      	</div>      
   	</div>
</div>

		</div>		
	</body>
</html>