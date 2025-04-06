<%@include file="connection.jsp"%>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");
	
	PreparedStatement ps = con.prepareStatement("INSERT INTO customer(c_name, c_email, c_phone, c_address) VALUES(?,?,?,?)");
	ps.setString(1, name);
	ps.setString(2, email);
	ps.setString(3, phone);
	ps.setString(4, addr);
	ps.executeUpdate();
%>
<script type="text/javascript">
	alert('Customer saved successfully');
	location.href = 'customer.jsp';
</script>