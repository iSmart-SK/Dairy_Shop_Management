<%@include file="connection.jsp"%>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	float salary = Float.parseFloat(request.getParameter("salary"));
	String desgn = request.getParameter("desgn");
	String addr = request.getParameter("addr");
	
	PreparedStatement ps = con.prepareStatement("INSERT INTO employee (ename, gender, email, phno, salary, designation, address) VALUES(?,?,?,?,?,?,?)");
	ps.setString(1, name);
	ps.setString(2, gender);
	ps.setString(3, email);
	ps.setString(4, phone);
	ps.setFloat(5, salary);
	ps.setString(6, desgn);
	ps.setString(7, addr);
	ps.executeUpdate();
%>
<script type="text/javascript">
	alert('Staff saved successfully');
	location.href = 'staff.jsp';
</script>