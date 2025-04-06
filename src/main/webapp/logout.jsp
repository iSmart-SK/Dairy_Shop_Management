<%
	session.removeAttribute("uid");
	session.removeAttribute("uname");
	session.invalidate();
%>
<script type="text/javascript">
	alert("You are logged out successfully");
	location.href = "index.jsp";
</script>