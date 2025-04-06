<%@include file="connection.jsp"%>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");
	
	PreparedStatement ps = con.prepareStatement("INSERT INTO farmer (f_name, f_gender, f_email, f_phone, f_address) VALUES(?,?,?,?,?)");
	ps.setString(1, name);
	ps.setString(2, gender);
	ps.setString(3, email);
	ps.setString(4, phone);
	ps.setString(5, addr);
	ps.executeUpdate();
%>
<script type="text/javascript">
	alert('Farmer saved successfully');
	location.href = 'farmer.jsp';
</script>