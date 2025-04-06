<%@include file="connection.jsp" %>

<%
	String id = request.getParameter("id");
	String bdate = request.getParameter("bdate");
	String cid = request.getParameter("cid");
	String cqty = request.getParameter("cqty");
	String bqty = request.getParameter("bqty");
	String mode = request.getParameter("mode");

	int amt = Integer.parseInt(cqty)*40 + Integer.parseInt(bqty)*50;

	String sql = "insert into customer_bill values("+id+",'"+bdate+"',"+amt+","+cqty+","+bqty+","+cid+",'-','-','-','Pending')";

	con.createStatement().executeUpdate(sql);

	sql = "update stock set cow_qty=cow_qty-"+cqty+", buffalo_qty=buffalo_qty-"+bqty;
	
	con.createStatement().executeUpdate(sql); 
	
	response.sendRedirect("bill.jsp");
%>