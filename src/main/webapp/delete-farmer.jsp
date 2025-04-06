<%@include file="connection.jsp"%>

<%
	con.createStatement().executeUpdate("delete from farmer where f_id="+request.getParameter("id"));
	response.sendRedirect("farmer.jsp");
%>