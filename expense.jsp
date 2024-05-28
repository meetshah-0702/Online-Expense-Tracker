<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>online expense tracker</title>
<%@include file="WEB-INF/css/all_css_cdn.jsp"%>
<style>
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
ul > li > a:hover {
	background-color: #ffa31a;
}
</style>
</head>
<body class="color2-bg">
	<%@include file="WEB-INF/components/nav.jsp"%>
	<div class="p-4 sm:ml-64">
		<div class="p-4  dark:border-gray-700 mt-14">
			<div class="pt-2 pb-8">
				<p class="text-4xl text-white font-bold">Expenses</p>
			</div>
			<div class="grid grid-cols-1 sm:grid-cols-1 gap-4 mb-10">
				<div class="rounded color3-bg dark:bg-gray-800 stastics py-4 px-3">
					<div class="w-full flex flex-col gap-4">
						<p class="text-2xl text-white">Add Expenses</p>
						<div class="w-full">

							<form action="addExpense" method="post">
								<div class="grid gap-6 mb-6 md:grid-cols-1 mx-4">
									<div>
										<label for="full_name"
											class="block mb-2 text-gray-900 text-white text-1xl">Item
											Name</label> <input type="text" id="first_name" name="item_name"
											class="bg-black border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
											placeholder="item name" required />
									</div>
									<div>
										<label for="Price" class="block mb-2 text-1xl text-white">Price
										</label> <input type="numner" id="price" name="price"
											class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
											placeholder="price" required />
									</div>
									<div>
										<label for="full_name"
											class="block mb-2 text-gray-900 text-white text-1xl">Date
										</label>
										<input datepicker type="text" name="date"
											class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full ps-10 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
											placeholder="Select date">
									</div>
									
									<div>
										<label for="countries" class="block mb-2 text-1xl text-white">Select an option</label>
  <select id="countries" name="expense_type" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
    <option selected value="">Choose an expense type</option>
    <option value="Credit">Credit</option>
    <option value="Debit">Debit</option>
    
  </select>
									</div>
									<button type="submit"
										class="text-white color1-bg hover:color1-bg focus:ring-4 focus:outline-none  font-large rounded-lg text-xl w-full sm:w-auto px-5 py-2.5 text-center">Submit</button>
										
										<c:if test="${not empty Expmsg }">
											<div class="w-full text-center">
												<p class="text-green-700 text-lg">${Expmsg}</p>
												<c:remove var="Expmsg" />
											</div>
											</c:if>
											<c:if test="${not empty error }">
											<div class="w-full text-center">
												<p class="text-red-700 text-lg">${error}</p>
												<c:remove var="error" />
											</div>
											</c:if>

							
							</form>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>