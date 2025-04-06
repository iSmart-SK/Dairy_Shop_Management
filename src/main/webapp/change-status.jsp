<%@include file="connection.jsp"%>

<%
	String no = request.getParameter("id");
	String status = request.getParameter("status");
	con.createStatement().executeUpdate("update loan_application set status='"+status+"' where application_no="+no);
	response.sendRedirect("loan-request.jsp");
%>
