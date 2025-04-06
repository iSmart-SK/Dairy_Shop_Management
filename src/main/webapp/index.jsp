<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Home</title>
		<link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/login.css">
	</head>

	<body>
	
		<jsp:include page="header.jsp"></jsp:include>

		<div class="login">
			<div class="login-triangle"></div>
		  
		  	<h2 class="login-header">LOGIN</h2>
		
		  	<form class="login-container" method="post" action="login.jsp">
		    	<p><input type="email" name="email" placeholder="Email"></p>
		    	<p><input type="password" name="password" placeholder="Password"></p>
		    	<p>
		    	<select name="type" required>
		    	<option value="">User Type</option>
		    	<option value="Staff">STAFF</option>
		    	<option value="Farmer">FARMER</option>
		    	<option value="Customer">CUSTOMER</option>
		    	</select>
		    	</p>
		    	<p><input type="submit" value="Log in"></p>
		    	<p><input type="reset" value="Reset"></p>
		  	</form>
		</div>
		
		<jsp:include page="footer.jsp"></jsp:include>
	
	</body>
</html>