<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>No User Page</title>
</head>
<body>

<nav class="bg-white border-gray-200 px-2 sm:px-4 py-2.5 rounded dark:bg-gray-800">
		<div
			class="container flex flex-wrap justify-between items-center mx-auto">
			<a href="http://localhost:8080/stocks" class="flex"> <span
				class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">Trading Platform</span>
			</a>
			<!-- <button data-collapse-toggle="mobile-menu" type="button"
				class="inline-flex items-center p-2 ml-3 text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
				aria-controls="mobile-menu-2" aria-expanded="false">
				</button> -->
			<div class="hidden w-full md:block md:w-auto" id="mobile-menu">
				<ul
					class="flex flex-col mt-4 md:flex-row md:space-x-8 md:mt-0 md:text-sm md:font-medium">
					<li><a href="http://localhost:8080/stocks"
						class="block py-2 pr-4 pl-3 text-white bg-blue-700 text-1xl rounded md:bg-transparent md:text-blue-700 md:p-0 dark:text-white"
						aria-current="page">Stocks</a></li>
				</ul>
				
			</div>
		</div>
	</nav>

						
		<div class="flex items-center justify-center min-h-screen bg-blue-500">
    	<div class="px-8 py-6 mx-4 mt-4 text-left bg-white shadow-lg md:w-1/3 lg:w-1/3 sm:w-1/3  rounded-lg">
        <div class="flex justify-center">
        </div>
        <h3 class="text-3xl font-bold text-center">User doesn't Exist</h3> 
            <div class="mt-4">
                <div class="flex">
                    <a class="w-full px-6 py-2 mt-4 text-white bg-blue-600 rounded-lg hover:bg-blue-900 flex items-center justify-center"type="submit" name="Submit" href="http://localhost:8080/login">Try Login Again</a>
                </div>
                <div class="mt-6 text-grey-dark">
                    New Customer?
                    <a class="text-blue-600 hover:underline" href="/register">
                        Register
                    </a>
                </div>
            </div>
       
    </div>
</div> 
					
</body>
</html>