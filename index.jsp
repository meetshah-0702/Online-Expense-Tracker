
<%@page import="com.entity.Expense"%>
<%@page import="java.util.List"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.db.HibernetUtil"%>
<%@page import="com.dao.ExpenseDao"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<!DOCTYPE html>
<html>
	<header>
		<title>online expense tracker</title>
		<%@include file="WEB-INF/css/all_css_cdn.jsp" %>
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

.stastics:hover {
	background-color: #ffa31a;
	color: #000000 !important;
}
ul > li > a:hover {
	background-color: #ffa31a;
}
</style>
	</header>
<body class="color2-bg">

	<%@include file="WEB-INF/components/nav.jsp" %>
	
	<%
		User user = (User) session.getAttribute("user_details");
		ExpenseDao dao = new ExpenseDao(HibernetUtil.getSessionFactory());
		java.util.List<BigDecimal> current_day = dao.getCurrentDayExpense(user);
		java.util.List<BigDecimal> yesterday_day = dao.getYesterdayExpense(user);
		java.util.List<BigDecimal> day_7 = dao.getLast7dayExpense(user);
		java.util.List<BigDecimal> current_year = dao.getCurrentYearExpense(user);
		java.util.List<BigDecimal> totla_expense = dao.getTotalExpense(user);
		java.util.List<BigDecimal> last_month = dao.getMonthExpense(user);
	
		List<Expense> list = dao.getChartData(user);
		List<Expense> debit_list = dao.getChartDataDebit(user);
		ObjectMapper mapper = new ObjectMapper();
	    String jsonData = mapper.writeValueAsString(list);
	    
	    ObjectMapper mapper1 = new ObjectMapper();
	    String jsonData1 = mapper.writeValueAsString(debit_list);
		
	%>

	
	<div class="p-4 sm:ml-64">
		<div class="p-4  dark:border-gray-700 mt-14">
			<div class="pt-2 pb-8">
				<p class="text-4xl text-white font-bold">Dashboard</p>
				
			</div>
			<div class="grid grid-cols-1 sm:grid-cols-3 gap-4 mb-10">
				<div class="rounded color3-bg dark:bg-gray-800 stastics py-4 hover:text-white">
					<p class="w-full text-center text-4xl font-bold text-white pb-2"><%= current_day.get(0) %></p>
					<p class="w-full text-center text-2xl text-white">Today's
						Expense</p>
				</div>
				<div class="rounded color3-bg dark:bg-gray-800 stastics py-4">
					<p class="w-full text-center text-4xl font-bold text-white pb-2"><%= yesterday_day.get(0) %></p>
					<p class="w-full text-center text-2xl text-white">Yesterday's
						Expense</p>
				</div>
				<div class="rounded color3-bg dark:bg-gray-800 stastics py-4">
					<p class="w-full text-center text-4xl font-bold text-white pb-2"><%= day_7.get(0) %></p>
					<p class="w-full text-center text-2xl text-white">Last 7day's
						Expense</p>
				</div>
				<div class="rounded color3-bg dark:bg-gray-800 stastics py-4">
					<p class="w-full text-center text-4xl font-bold text-white pb-2"><%= last_month.get(0) %></p>
					<p class="w-full text-center text-2xl text-white">last Month's
						Expense</p>
				</div>
				<div class="rounded color3-bg dark:bg-gray-800 stastics py-4">
					<p class="w-full text-center text-4xl font-bold text-white pb-2"><%= current_year.get(0) %></p>
					<p class="w-full text-center text-2xl text-white">Current Year
						Expense</p>
				</div>
				<div class="rounded color3-bg dark:bg-gray-800 stastics py-4">
					<p class="w-full text-center text-4xl font-bold text-white pb-2"><%= totla_expense.get(0) %></p>
					<p class="w-full text-center text-2xl text-white">Total Expense</p>
				</div>
			</div>
			<div class="grid grid-cols-2 gap-4 mb-4 ">
				<div class="flex flex-col rounded color3-bg dark:bg-gray-800 px-4 py-4">
					<div class="w-full mb-2">
						<p class="text-white text-2xl text-center">Last Month's Credits</p>
					</div>
					<div class="text-center w-full">
						<canvas id="myChart" width="200" height="200"></canvas>
					</div>
				</div>
				<div class="flex flex-col rounded color3-bg px-4 py-4">
					<div class="w-full mb-2">
						<p class="text-white text-2xl text-center">Last Month's Debits</p>
						
					</div>
					<div class="text-center w-full">
						<canvas id="myChart2" width="200" height="200"></canvas>
					</div>
				</div>
			</div>
		</div>
	</div>

	
	<script>
        // Example data
        var jsonData = '<%=jsonData%>';
    	var chartdata = JSON.parse(jsonData);
    	var jsonData1 = '<%=jsonData1%>';
    	var chartdata2 = JSON.parse(jsonData1);
    	
    	console.log(chartdata)
        const data = {
            labels: chartdata.map(function(item) { return item[0]; }),
            datasets: [{
                label: 'Credits',
                backgroundColor: '#28fc03',
                borderColor: '#28fc03',
                data: chartdata.map(function(item) { return item[1]; })
            }]
        };
    	
    	const data2 = {
                labels: chartdata2.map(function(item) { return item[0]; }),
                datasets: [{
                    label: 'Debits',
                    backgroundColor: '#fc4103',
                    borderColor: '#fc4103',
                    data: chartdata2.map(function(item) { return item[1]; })
                }]
            };

        // Create Chart.js chart
        const ctx = document.getElementById('myChart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: data
        });
        const ctx2 = document.getElementById('myChart2').getContext('2d');
        var myChart = new Chart(ctx2, {
            type: 'bar',
            data: data2
        });
    </script>	
	
</body>
</html>
