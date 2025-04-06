<%@include file="connection.jsp"%>

<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String type = request.getParameter("type");
	
	if(type.equals("Staff")){
		PreparedStatement ps = con.prepareStatement("select * from employee where email=? and passwd=?");
		ps.setString(1, email);
		ps.setString(2, password);
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			session.setAttribute("uid", rs.getString(1));
			session.setAttribute("uname", rs.getString(2));
			session.setAttribute("desgn", rs.getString(7));
			out.print("<script>alert('Staff login successful.');location.href='staff-dashboard.jsp';</script>");
		}
		else{
			out.print("<script>alert('Staff login failed. Please try again');location.href='index.jsp';</script>");
		}
	}

	if(type.equals("Farmer")){
		PreparedStatement ps = con.prepareStatement("select * from farmer where f_email=? and f_pwd=?");
		ps.setString(1, email);
		ps.setString(2, password);
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			session.setAttribute("uid", rs.getString(1));
			session.setAttribute("uname", rs.getString(2));
			out.print("<script>alert('Farmer login successful.');location.href='farmer-dashboard.jsp';</script>");
		}
		else{
			out.print("<script>alert('Farmer login failed. Please try again');location.href='index.jsp';</script>");
		}		
	}

	if(type.equals("Customer")){
		PreparedStatement ps = con.prepareStatement("select * from customer where c_email=? and c_pwd=?");
		ps.setString(1, email);
		ps.setString(2, password);
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			session.setAttribute("uid", rs.getString(1));
			session.setAttribute("uname", rs.getString(2));
			out.print("<script>alert('Customer login successful.');location.href='customer-dashboard.jsp';</script>");
		}
		else{
			out.print("<script>alert('Customer login failed. Please try again');location.href='index.jsp';</script>");
		}				
	}	
%>