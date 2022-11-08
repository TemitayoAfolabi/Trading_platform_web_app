<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ page import="com.ab.models.Customer" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
<meta charset="ISO-8859-1">
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

.dropdown-content a:hover {background-color: white;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {/* background-color: #3e8e41; */}
</style>
<title>Insert title here</title>
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
					<li><a href="http://localhost:8080/login"
						class="block py-2 pr-4 pl-3 text-white bg-blue-700 rounded md:bg-transparent md:text-blue-700 md:p-0 dark:text-white"
						aria-current="page">Login</a></li>
					<li><a href="http://localhost:8080/register" class="block py-2 pr-4 pl-3 text-white bg-blue-700 rounded md:bg-transparent md:text-blue-700 md:p-0 dark:text-white"
						aria-current="page"
						>Register</a>
					</li>
					<% } else {%>
						<li><a href="http://localhost:8080/stocks/orderbook" class="block py-2 pr-4 pl-3 text-white bg-blue-700 rounded md:bg-transparent md:text-blue-700 md:p-0 dark:text-white"
						aria-current="page"
						>Order Book</a></li>
						<!-- dropdown -->
						<div class="dropdown">
						<button class="dropbtn block py-2 pr-4 pl-3 text-white bg-blue-700 rounded md:bg-transparent md:text-blue-700 md:p-0 dark:text-white">
						<%Customer customer = (Customer)session.getAttribute("session_customer");
							String email =(String)customer.getEmail();
							out.print(customer.getEmail());%>
						</button>
					<div class="dropdown-content opacity-75" >
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
<div class="overflow-x-auto relative shadow-md sm:rounded-lg  min-h-screen bg-white-500">
    <table class="w-full text-sm text-left text-black-500 dark:text-black-400">
        <thead class="text-xs text-black-700 uppercase dark:text-black-500">
            <tr>
                <th scope="col" class="py-3 px-6 bg-black-50 dark:bg-black-800">
                    Region
                </th>
                <th scope="col" class="py-3 px-6">
                    StockName
                </th>
                <th scope="col" class="py-3 px-6">
         
                </th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${stockList}" var="s">
            <tr class="border-b border-gray-200 dark:border-gray-700">
                <th scope="row" class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap bg-gray-50 dark:text-white dark:bg-gray-800">
                    <c:out value="${s.stockRegion}" />
                </th>
                <td class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap bg-gray-50 dark:text-white dark:bg-gray-800">
                    <c:out value="${s.stockName}" />
                </td>
                
                    <td class=" flex justify-center">
            			<form action="http://localhost:8080/stocks/chart/${s.stockId}/${s.stockName}/${s.stockQuantity}/${s.stockRegion}" method="GET">
            				<button class="font-medium text-black-700 dark:text-blue-500 hover:underline" type="submit">View</button>
            			</form>
            		</td>
            </tr>
           </c:forEach>
        </tbody>
    </table>
</div>
		
		
	
</div>		
</body>
</html>
