<%@include file="connection.jsp"%>

<%
	con.createStatement().executeUpdate("delete from employee where eid="+request.getParameter("id"));
	response.sendRedirect("staff.jsp");
%>