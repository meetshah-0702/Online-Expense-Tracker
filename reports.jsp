<%@page import="com.entity.Expense"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online expense tracker</title>
<%@include file="WEB-INF/css/all_css_cdn.jsp"%>
<Style>
.color1-txt {
	color: #ffa31a;
}

.color1-bg {
	background-color: #ffa31a;
}

.color2-txt {
	color: #808080;
}

.color2-bg {
	background-color: #808080;
}

.color3-txt {
	color: #292929;
}

.color3-bg {
	background-color: #292929;
}

.color4-txt {
	color: #1b1b1b;
}

.color4-bg {
	background-color: #1b1b1b;
}

ul>li>a:hover {
	background-color: #ffa31a;
}
table > tbody > tr:hover {
	background-color: #ffa31a;
	color:black;
}
</Style>
</head>
<body class="color2-bg">
	<%@include file="WEB-INF/components/nav.jsp"%>
	<div class="p-4 sm:ml-64">
		<div class="p-4  dark:border-gray-700 mt-14">
			<div class="pt-2 pb-8">
				<p class="text-4xl text-white font-bold">Expenses Report</p>
			</div>
			<div class="w-full rounded-md color3-bg">
				<div class="w-full color1-bg px-3 py-3 rounded-md">
					<p class="text-xl font-bold text-black">Reports</p>
				</div>
				<form class="w-full py-3 px-3" action="report" method="post">
					<div date-rangepicker class="flex items-center justify-center">
						<div class="relative">
							<label for="email" class="block mb-2 text-1xl text-white">Start
								Date</label>
							<div
								class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none"
								style="top: 30px">
								<svg class="w-4 h-4 text-gray-500 dark:text-gray-400"
									aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
									fill="currentColor" viewBox="0 0 20 20">
          <path
										d="M20 4a2 2 0 0 0-2-2h-2V1a1 1 0 0 0-2 0v1h-3V1a1 1 0 0 0-2 0v1H6V1a1 1 0 0 0-2 0v1H2a2 2 0 0 0-2 2v2h20V4ZM0 18a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V8H0v10Zm5-8h10a1 1 0 0 1 0 2H5a1 1 0 0 1 0-2Z" />
        </svg>
							</div>
							<input name="start" type="text" 
								class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full ps-10 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
								placeholder="Select date start" />
						</div>
						<span class="mx-4 text-gray-500 mt-8">to</span>
						<div class="relative">
							<label for="email" class="block mb-2 text-1xl text-white">End
								Date</label>
							<div
								class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none"
								style="top: 30px">
								<svg class="w-4 h-4 text-gray-500 dark:text-gray-400"
									aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
									fill="currentColor" viewBox="0 0 20 20">
          <path
										d="M20 4a2 2 0 0 0-2-2h-2V1a1 1 0 0 0-2 0v1h-3V1a1 1 0 0 0-2 0v1H6V1a1 1 0 0 0-2 0v1H2a2 2 0 0 0-2 2v2h20V4ZM0 18a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V8H0v10Zm5-8h10a1 1 0 0 1 0 2H5a1 1 0 0 1 0-2Z" />
        </svg>
							</div>
							<input name="end" type="text" 
								class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full ps-10 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
								placeholder="Select date end">
						</div>
						<div class="relative mx-4 mt-8">
							
								<button type="submit"
									class="text-black color1-bg hover:color1-bg focus:ring-4 focus:outline-none  font-large rounded-lg text-md w-full sm:w-auto px-8 py-2.5 text-center">Login</button>
						</div>
					</div>

				</form>
			</div>
	
	<div class="w-full rounded-md color3-bg mt-5">
				<div class="w-full color1-bg px-3 py-3 rounded-md">
					<p class="text-xl font-bold text-black">Reports</p>
				</div>
				<div class="w-full py-3 px-3">

					<div class="relative overflow-x-auto shadow-md sm:rounded-lg">
        
        <c:if test="${not empty report }">
    		<table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400 color3-bg">
        <thead class="text-xs text-gray-700 uppercase bg-black dark:bg-gray-700 dark:text-gray-400 border-b ">
            <tr>
                <th scope="col" class="px-6 py-3 text-white">
                    Item Name
                </th>
                <th scope="col" class="px-6 py-3 text-white">
                    Date 
                </th>
                <th scope="col" class="px-6 py-3 text-white">
                    Price
                </th>
                <th scope="col" class="px-6 py-3 text-white">
                    Expense Type
                </th>
            </tr>
        </thead>
        <tbody class="">
        	<%
        		List<Expense> list = (List<Expense>) session.getAttribute("report");
        		for(Expense ex : list){
        		
        			%>
        		<tr class="bg-black border-b :bg-gray-800 border-gray-500">
                <th scope="row" class="px-6 py-4 text-md text-white whitespace-nowrap">
                    <%= ex.getItem_name() %>
				</th>
                <td class="px-6 py-4 text-md text-white">
                    <%= ex.getDate() %>
                </td>
                <td class="px-6 py-4 text-md text-white">
                    <%= ex.getPrice() %>
                </td>
              
              
                <td class="px-6 py-4 text-md text-white">
                    <%= ex.getExpense_type() %>
                </td>	
                
            </tr>		
        			<% 
        		}
        	%>
        	<tr class="bg-black border-b :bg-gray-800 border-gray-500">
        		<td colspan="2" class="px-6 py-4 text-md text-white text-center text-xl">Credit</td>
        		<td colspan="2" class="px-6 py-4 text-md text-white text-start text-xl">
        			<c:out value="${credit }"></c:out>
        		</td>
        	</tr>
        	<tr class="bg-black border-b :bg-gray-800 border-gray-500">
        		<td colspan="2" class="px-6 py-4 text-md text-white text-center text-xl">Debit</td>
        		<td colspan="2" class="px-6 py-4 text-md text-white text-start text-xl">
        			<c:out value="${debit }"></c:out>
        		</td>
        	</tr>
        </tbody>
    </table>    
    	<c:remove var="report"/>
        </c:if>
    
</div>

				</div>
			</div>
		</div>
	</div>
	
</body>
</html>