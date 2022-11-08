<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.ab.models.Customer" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
<style>
.dropbtn {
  /* background-color: #04AA6D;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;  */
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  /* background-color: #f1f1f1; */
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {/* background-color: #3e8e41; */}
</style>
<title>Balance Page</title>
</head>
<body>
<!-- NAVBAR -->
	<nav
		class="bg-white border-gray-200 px-2 sm:px-4 py-2.5 rounded dark:bg-gray-800">
		<div
			class="container flex flex-wrap justify-between items-center mx-auto">
			<a href="http://localhost:8080/stocks" class="flex"> <span
				class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">Trading Platform</span>
			</a>
			 <%if (session.getAttribute("session_customer") != null) {%>
			 <a  class="flex" href="http://localhost:8080/stocks"> <span
				class="flex justify-center text-1xl font-semibold whitespace-nowrap dark:text-white bg-blue-300">
				Balance: <%Customer customer1 = (Customer)session.getAttribute("session_customer");
				   
							out.print(customer1.getBalance());
										
							/* if(customer1.getBalance() < (stk.getStockPrice()*stk.getStockQuantity())){
								
								out.print("Balance is insufficient to place an order!!!!");
							
							} */
									%>
				</span>
			</a>
			<% } else {%>
				<a  class="flex" href="http://localhost:8080/stocks"> <span
				class="flex justify-center text-1xl font-semibold whitespace-nowrap dark:text-white bg-blue-300">
				Balance: ------
				</span>
			</a>
			<% } %>
			<div class="hidden w-full md:block md:w-auto" id="mobile-menu">
				<ul
					class="flex flex-col mt-4 md:flex-row md:space-x-8 md:mt-0 md:text-sm md:font-medium">
					<%if (session.getAttribute("session_customer") == null) {%>
					<li><a href="http://localhost:8080/stocks"
						class="block py-2 pr-4 pl-3 text-white bg-blue-700 rounded md:bg-transparent md:text-blue-700 md:p-0 dark:text-white"
						aria-current="page">Stocks</a></li>
					<li><a href="http://localhost:8080/login"
						class="block py-2 pr-4 pl-3 text-white bg-blue-700 rounded md:bg-transparent md:text-blue-700 md:p-0 dark:text-white"
						aria-current="page">Login</a></li>
					<li><a href="http://localhost:8080/register" class="block py-2 pr-4 pl-3 text-white bg-blue-700 rounded md:bg-transparent md:text-blue-700 md:p-0 dark:text-white"
						aria-current="page"
						>Register</a>
					</li>
					<% } else {%>
					<li><a href="http://localhost:8080/stocks"
						class="block py-2 pr-4 pl-3 text-white bg-blue-700 rounded md:bg-transparent md:text-blue-700 md:p-0 dark:text-white"
						aria-current="page">Stocks</a></li>
						
						
						
					<div class="dropdown">
						<button class="dropbtn block py-2 pr-4 pl-3 text-white bg-blue-700 rounded md:bg-transparent md:text-blue-700 md:p-0 dark:text-white"
						aria-current="page">
						<%Customer customer = (Customer)session.getAttribute("session_customer");
							String email =(String)customer.getEmail();
							out.print(customer.getEmail());%>
						</button>
					<div class="dropdown-content opacity-75">
 					<a href="http://localhost:8080/portfolio">Portfolio</a>
 					<a href="http://localhost:8080/balance">Balance</a>
 					<a href="http://localhost:8080/stocks/tradinghistory">Trading History</a>
 					<a href="http://localhost:8080/logout">Logout</a>
					</div>
					</a></li>
					</div>
							<% } %>
							
				</ul>
				
			</div>
		</div>
	</nav>
	<div class="min-h-screen bg-blue-500">	
<h1>Balance Page</h1>
<div class="flex items-center bg-blue-500 text-center">
	<label>Account Balance:  </label> <h1><%Customer customer1 = (Customer)session.getAttribute("session_customer"); out.print(customer1.getBalance()); %></h1><br></br>
	</br>
	<button>Make a deposit</button>
	</br>
	<button>Widthraw money</button>
</div>
</div>
<h3></h3>

</body>
</html>