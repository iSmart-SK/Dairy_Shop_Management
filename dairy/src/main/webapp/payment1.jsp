<%@include file="connection.jsp"%>

<%
	String pdate = request.getParameter("pdate");
	String fid = request.getParameter("fid");

	String sql = "select * from farmer_payment where f_id="+fid+" and payment_date='"+pdate+"'";

	ResultSet rs = con.createStatement().executeQuery(sql);
	
	if(rs.next()){
%>
<script type="text/javascript">
	alert('Payment for farmer <%=fid%> already done.');
	location.href = 'payment.jsp';
</script>
<% 
	}
	else
	{
		sql = "select sum(qty*40) from collection where f_id="+fid+" and milk_type='Cow' and collection_date='"+pdate+"'";

		rs = con.createStatement().executeQuery(sql);
		rs.next();
		
		float amt1 = rs.getFloat(1);

		sql = "select sum(qty*50) from collection where f_id="+fid+" and milk_type='Buffalo' and collection_date='"+pdate+"'";

		rs = con.createStatement().executeQuery(sql);
		rs.next();
		float amt2 = rs.getFloat(1);
	
		float tot = amt1 + amt2;

		if(tot>0)
		{
			sql = "insert into farmer_payment(payment_date, amount, f_id) values('"+pdate+"', "+tot+", "+fid+")";
			con.createStatement().executeUpdate(sql);
		}
%>
<script type="text/javascript">
	alert('Payment for farmer <%=fid%> done.');
	location.href = 'payment.jsp';
</script>
<%
	}
%></body>
