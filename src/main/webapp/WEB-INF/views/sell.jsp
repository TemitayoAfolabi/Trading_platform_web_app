<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
     <%@ page import="com.ab.models.Customer" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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

.dropdown-content a:hover {background-color: white;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {/* background-color: #3e8e41; */}
</style>
<title>Stock Chart </title>
<script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.stock.min.js"></script>
<script type="text/javascript">
window.onload = function () {
  var dataPoints = [], currentDate = new Date(), rangeChangedTriggered = false;
   
  var stockChart = new CanvasJS.StockChart("chartContainer",{
    theme: "light2",
    /*title:{
      text:"LSEG StockChart with Stripline"
    },*/
    rangeChanged: function(e) {
        rangeChangedTriggered = true;
    },
    charts: [{
      axisX: {
         crosshair: {
          enabled: true,
          valueFormatString: "MMM DD, YYYY HH:mm:ss"
        }
      },
      axisY: {
        title: "Stock Prices",
        stripLines: [{
          showOnTop: true,
          lineDashType: "dash",
          color: "#ff4949",
          labelFontColor: "#ff4949",
          labelFontSize: 14
        }]
      },
      toolTip: {
        shared: true
      },
      data: [{
        type: "line",
        name: "Pageviews",
        xValueFormatString: "MMM DD, YYYY HH:mm:ss",
        xValueType: "dateTime",
        dataPoints : dataPoints
      }]
    }],
    navigator: {
      slider: {
        minimum: new Date(currentDate.getTime() - (90 * 1000))
      }
    },
    rangeSelector: {
      enabled: false
    }
  });
  var dataCount = 7000, ystart = 1.115, interval = 1000, xstart = (currentDate.getTime() - (7123 * 100));
  updateChart(xstart, ystart, dataCount, interval);
   
  
  function updateChart(xstart, ystart, length, interval) {
	const demo = document.getElementById('price');	
    var xVal = xstart, yVal = ystart;
    for(var i = 0; i < length; i++) {

      yVal = (yVal +  Math.round(5 + Math.random() *(-5-5))/53).toFixed(3);

      yVal = Math.min(Math.max(yVal, 5), 90);
      dataPoints.push({x: xVal,y: yVal});
      xVal += interval;
      
      demo.value =yVal;
    }
    if(!rangeChangedTriggered) {
        stockChart.options.navigator.slider.minimum = new Date(xVal - (90 * 1000));
    }
    stockChart.options.charts[0].axisY.stripLines[0].value =  dataPoints[dataPoints.length - 1].y;
    stockChart.options.charts[0].axisY.stripLines[0].label = stockChart.options.charts[0].axisY.stripLines[0]["value"];
    xstart = xVal;
    dataCount = 1;
    ystart = yVal;
    stockChart.render();
    setTimeout(function() { updateChart(xstart, ystart, dataCount, interval); }, 1000);
  }
}
</script>
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
					<li><a href="http://localhost:8080/stocks"
						class="block py-2 pr-4 pl-3 text-white bg-blue-700 rounded md:bg-transparent md:text-blue-700 md:p-0 dark:text-white"
						aria-current="page">Stocks</a></li>


					<%if (session.getAttribute("session_customer") != null) {%>
					<div class="dropdown">
						<button class="dropbtn block py-2 pr-4 pl-3 text-white bg-blue-700 rounded md:bg-transparent md:text-blue-700 md:p-0 dark:text-white"
						aria-current="page" disabled="disabled">
						<%Customer customer = (Customer)session.getAttribute("session_customer");
							String email =(String)customer.getEmail();
							out.print(customer.getEmail());%>
						</button>
					<div class="dropdown-content">
 					<a href="http://localhost:8080/portfolio">Portfolio</a>
 					<a href="http://localhost:8080/balance">Balance</a>
 					<a href="http://localhost:8080/logout">Logout</a>
					</div>
					</div>
						
					<% } else{%>
					<li><a href="http://localhost:8080/register" class="block py-2 pr-4 pl-3 text-white bg-blue-700 rounded md:bg-transparent md:text-blue-700 md:p-0 dark:text-white"
						aria-current="page"
						>Register</a>	
					</li>
						
						<li><a href="http://localhost:8080/login" class="block py-2 pr-4 pl-3 text-white bg-blue-700 rounded md:bg-transparent md:text-blue-700 md:p-0 dark:text-white"
						aria-current="page"
						>Login</a>
					</li>
					<% } %>
				</ul>
				
			</div>
		</div>
	</nav>
	<br>



<div class="overflow-x-auto relative shadow-md sm:rounded-lg ">
    <table class="w-full text-sm text-left text-black-900 dark:text-black-900 bg-blue-500">
        <thead class="text-xs text-black-700 uppercase dark:text-black-900">
            <tr>
            	<th scope="col" class="py-4 px-6 bg-black-50 dark:bg-black-800">
                    Stock Id
                </th>
                <th scope="col" class="py-4 px-6 bg-black-50 dark:bg-black-800">
                    Region
                </th>
                <th scope="col" class="py-4 px-6 bg-black-50 dark:bg-black-800">
                    StockName
                </th>
                <th scope="col" class="py-4 px-6 bg-black-50 dark:bg-black-800">
                    Quantity
                </th>
                
            </tr>
        </thead>
        <tbody>
            <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
            	<td class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                    <h1><b>${stock.stockId}</b></h1>
                </td>
                <th scope="row" class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                    <h1><b>${stock.stockRegion}</b></h1>
                </th>
                <td class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                    <h1><b>${stock.stockName}</b></h1>
                </td>
                <td class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                    <h1><b>available</b></h1>
                </td>
            </tr>
        </tbody>
    </table>
</div>


<!-- <!--  --> 

<div id="chartContainer" style="height: 450px; width: 100%;"></div>
  
  <div class="flex items-center justify-center min-h-screen bg-blue-500">
  <div class="px-8 py-6 mx-4 mt-4 text-left bg-white shadow-lg md:w-1/3 lg:w-1/3 sm:w-1/3  rounded-lg">
  
<form action="/Sell/stockId" method="POST">
<div class="mt-4">
  <label for="price"class="block">Stock Name: </label><strong class="flex items-center justify-center">${stock.stockName}</strong>
  <input class="w-full px-2 py-2 mt-2 border rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600 flex items-center" type="hidden" id="stockId" name="stockId" value="${stock.stockId}"><br>
  <input class="w-full px-2 py-2 mt-2 border rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600 flex items-center"  id="stockRegion" name="stockRegion" value="${stock.stockRegion}"><br>
  <label for="price"class="block">Stock Price:</label>
  <input class="w-full px-2 py-2 mt-2 border rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600 flex items-center"required type="text" id="price" name="price"><br>
  <label for="quantity"class="block">Quantity:</label>
  <input class="w-full px-2 py-2 mt-2 border rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600"required type="number" id="quantity" name="quantity"><br>
  <label for="order"class="block">Order Type:</label>
  <select name="order" id="order">
    <option value="sell" name="sell">Sell</option>
  </select>
  <br><br>
  <button class="w-full px-6 py-2 mt-4 text-white bg-blue-600 rounded-lg hover:bg-blue-900"type="submit" >Place Order</button>
  </div>
</form>
</div>
</div>
</body>
</html>