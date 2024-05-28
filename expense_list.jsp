<%@page import="com.entity.Expense"%>
<%@page import="java.util.List"%>
<%@page import="com.db.HibernetUtil"%>
<%@page import="com.dao.ExpenseDao"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>online expense tracker</title>
<%@include file="WEB-INF/css/all_css_cdn.jsp" %>
</head>
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
table > tbody > tr:hover {
	background-color: #ffa31a;
	color:black;
}
</style>
<body class="color2-bg">
	<%@include file="WEB-INF/components/nav.jsp"%>
	<div class="p-4 sm:ml-64">
		<div class="p-4  dark:border-gray-700 mt-14">
			<div class="pt-2 pb-8">
				<p class="text-4xl text-white font-bold">Expenses List</p>
			</div>
<div class="relative overflow-x-auto shadow-md sm:rounded-lg">
    <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400 color3-bg">
        <thead class="text-xs text-gray-700 uppercase color3-bg dark:bg-gray-700 dark:text-gray-400">
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
                <th scope="col" class="px-6 py-3 text-white text-right">
                    Actions
                </th>
            </tr>
        </thead>
        <tbody class="">
        <%
        	User user = (User) session.getAttribute("user_details");
        	ExpenseDao dao = new ExpenseDao(HibernetUtil.getSessionFactory());
        	List<Expense> list = dao.getAllExpenseByUser(user);
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
                <td class="px-6 py-4 text-right text-md text-white">
                    <a href="deleteExpense?id=<%= ex.getId() %>" class="font-medium text-blue-600 dark:text-blue-500 hover:underline text-red-700">Delete</a>
                </td>
            </tr>
        	<% 
        	}
        %>
        </tbody>
    </table>
</div>
		</div>
	</div>
</body>
</html>