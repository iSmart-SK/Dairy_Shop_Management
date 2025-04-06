<%@include file="connection.jsp"%>

<%
	con.createStatement().executeUpdate("delete from farmer_payment where payment_id="+request.getParameter("id"));
	response.sendRedirect("payment.jsp");
%>