<%@include file="connection.jsp"%>

<%
	String id = request.getParameter("id");
	String cdate = request.getParameter("cdate");
	String fid = request.getParameter("fid");
	String type = request.getParameter("type");
	String qty = request.getParameter("qty");
	String when = request.getParameter("when");
	
	con.createStatement().executeUpdate("insert into collection values("+id+",'"+type+"',"+qty+",'"+cdate+"','"+when+"',"+fid+")");
	
	if(type.equals("Cow"))
		con.createStatement().executeUpdate("update stock set cow_qty=cow_qty+"+qty);
	else
		con.createStatement().executeUpdate("update stock set buffalo_qty=buffalo_qty+"+qty);
	
	response.sendRedirect("collection.jsp");
%>