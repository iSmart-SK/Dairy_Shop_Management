<%@include file="connection.jsp"%>

<%
	con.createStatement().executeUpdate("delete from customer where c_id="+request.getParameter("id"));
	response.sendRedirect("customer.jsp");
%>