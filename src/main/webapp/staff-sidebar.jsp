<div class="sidenav">
  	<a href="staff.jsp">Staff</a>
  	<a href="farmer.jsp">Farmer</a>
  	<a href="customer.jsp">Customer</a>
  	<a href="collection.jsp">Collection</a>
  	<a href="payment.jsp">Payment</a>
  	<a href="bill.jsp">Bill</a>
  	<a href="loan-request.jsp">Loan Request</a>
  	<a href="view-stock.jsp">View Stock</a>
  	<button class="dropdown-btn">Report 
    	<i class="fa fa-caret-down"></i>
  	</button>
  	<div class="dropdown-container">
    	<a href="daily-collection.jsp">Daily Collection</a>
    	<a href="daily-bills.jsp">Daily Bills</a>
    	<a href="staff-list.jsp">Staff List</a>
    	<a href="farmer-list.jsp">Farmers List</a>
		<a href="customer-list.jsp">Customers List</a>
  	</div>
  	<a href="logout.jsp">Logout</a>
</div>

<script>
	var dropdown = document.getElementsByClassName("dropdown-btn");
	var i;
	for (i = 0; i < dropdown.length; i++) {
		dropdown[i].addEventListener("click", function() {
			this.classList.toggle("active");
			var dropdownContent = this.nextElementSibling;
			if (dropdownContent.style.display === "block") {
				dropdownContent.style.display = "none";
   			} else {
  				dropdownContent.style.display = "block";
			}
		});
	}
</script>