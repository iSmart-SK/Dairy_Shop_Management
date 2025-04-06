<%@include file="connection.jsp"%>

<%
	ResultSet rs = con.createStatement().executeQuery("select * from collection where trn_no="+request.getParameter("id"));
	rs.next();
	
	if(rs.getString(2).equals("Cow"))
		con.createStatement().executeUpdate("update stock set cow_qty=cow_qty-"+rs.getInt(3));
	else
		con.createStatement().executeUpdate("update stock set buffalo_qty=cow_qty-"+rs.getInt(3));
	
	con.createStatement().executeUpdate("delete from collection where trn_no="+request.getParameter("id"));
	response.sendRedirect("collection.jsp");
%>