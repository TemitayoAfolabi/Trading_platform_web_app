<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.ab.models.Customer" %>
        <%@ page import="com.ab.models.Stock" %>
    <%@ page import="java.util.List" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
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
<link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Portfolio</title>


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
						 	<li><a href="http://localhost:8080/stocks/orderbookCustomerId" class="block py-2 pr-4 pl-3 text-white bg-blue-700 rounded md:bg-transparent md:text-blue-700 md:p-0 dark:text-white"
						aria-current="page"
						>
						<button class="dropbtn">
						<%Customer customer = (Customer)session.getAttribute("session_customer");
							String email =(String)customer.getEmail();
							out.print(customer.getEmail());%>
						</button>
					<div class="dropdown-content">
 					<a href="http://localhost:8080/portfolio">Portfolio</a>
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
<%Customer customer = (Customer)session.getAttribute("session_customer");
							String email =(String)customer.getEmail();
							
									%>
									

<div class="flex items-center justify-center min-h-screen bg-blue-500">
    	<div class="px-8 py-6 mx-4 mt-4 text-left bg-white shadow-lg md:w-1/3 lg:w-1/3 sm:w-1/3  rounded-lg">
        <div class="flex justify-center">
        </div>
        <h3 class="text-3xl font-bold text-center">Deposit</h3> 
        <form action="http://localhost:8080/depositBalance" method="post">
            <div class="mt-4">
                <div class="mt-4">
                    <label class="block" for="deposit">Amount</label>
                            <input type="number" placeholder="Amount"
                                class="w-full px-4 py-2 mt-2 border rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600" name="deposit">
                         
                </div> 
                <div class="flex">
                    <button class="w-full px-6 py-2 mt-4 text-white bg-blue-600 rounded-lg hover:bg-blue-900"type="submit" name="Submit">Deposit</button>
                </div>
            </div>
        </form>
        <h3 class="text-3xl font-bold text-center">Withdraw</h3> 
        <form action="http://localhost:8080/withdrawBalance" method="post">
            <div class="mt-4">
                <div class="mt-4">
                    <label class="block" for="withdraw">Amount</label>
                            <input type="number" placeholder="Amount"
                                class="w-full px-4 py-2 mt-2 border rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600" name="withdraw">
                </div> 
                <div class="flex">
                    <button class="w-full px-6 py-2 mt-4 text-white bg-blue-600 rounded-lg hover:bg-blue-900"type="submit" name="Submit">Withdraw</button>
                </div>
            </div>
        </form>
       
    </div>
</div> 


<div class="overflow-x-auto relative shadow-md sm:rounded-lg  min-h-screen bg-blue-500">
<form action="http://localhost:8080/portfolio" method="get">
    <table class="w-full text-sm text-left text-black-500 dark:text-black-400">
        <thead class="text-xs text-black-700 uppercase dark:text-black-500">
            <tr>
                <th scope="col" class="py-3 px-6 bg-black-50 dark:bg-black-800">
                    ID
                </th>
                <th scope="col" class="py-3 px-6">
                    STOCK ID
                </th>
                <th scope="col" class="py-3 px-6 bg-gray-50 dark:bg-gray-800">
                    REGION
                </th>
                <th scope="col" class="py-3 px-6 bg-gray-50 dark:bg-gray-800">
                    PRICE
                </th>
                <th scope="col" class="py-3 px-6 bg-gray-50 dark:bg-gray-800">
                    QUANTITY
                </th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${orderBookCustomerList}" var="od">
            <tr class="border-b border-gray-200 dark:border-gray-700">
                <th scope="row" class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap bg-gray-50 dark:text-white dark:bg-gray-800">
                    <c:out value="${od.orderId}" />
                </th>
                <td class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap bg-gray-50 dark:text-white dark:bg-gray-800">
                    <c:out value="${od.stockId}" />
                </td>
                <td class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap bg-gray-50 dark:text-white dark:bg-gray-800">
                    <c:out value="${od.stockRegion}" />
                </td>
                <td class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap bg-gray-50 dark:text-white dark:bg-gray-800">
                    <c:out value="${od.orderPrice}" />
                </td>
                <td class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap bg-gray-50 dark:text-white dark:bg-gray-800">
                    <c:out value="${od.orderQuantity}" />
                </td>
                 <td class=" flex justify-center">
            			<a href="http://localhost:8080/Sell/${od.stockId}/${od.stockRegion}/${od.stockName}" class="font-medium text-black-700 dark:text-blue-500 hover:underline"  >Sell</a>
            		</td>
            </tr>
           </c:forEach>
        </tbody>
    </table>
    </form>
</div> 






</body>
</html>