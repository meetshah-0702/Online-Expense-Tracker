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
<style>
.container2 {
  width: 100%;
  height: 100%;
  --color: #E1E1E1;
  background-color: #F3F3F3;
  background-image: linear-gradient(0deg, transparent 24%, var(--color) 25%, var(--color) 26%, transparent 27%,transparent 74%, var(--color) 75%, var(--color) 76%, transparent 77%,transparent),
      linear-gradient(90deg, transparent 24%, var(--color) 25%, var(--color) 26%, transparent 27%,transparent 74%, var(--color) 75%, var(--color) 76%, transparent 77%,transparent);
  background-size: 55px 55px;
}
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

</style>
</head>
<body>
	<div class="w-full h-screen">
		<div
			class="container2 w-full bg-white shadow-md flex items-center h-screen justify-center">
			<div class="w-1/2 shadow-xl rounded-md  bg-white-500 rounded-md bg-clip-padding backdrop-filter backdrop-blur-sm bg-opacity-10 border border-gray-100">
				<p class="text-center text-black text-4xl font-bold my-3">Registration</p>
				<div class="w-full">

					<form action="userRegister" method="post">
						<div class="grid gap-6 mb-6 md:grid-cols-1 mx-4">
							<div>
								<label for="full_name"
									class="block mb-2 text-gray-900 text-black text-1xl">User
									Name</label> <input type="text" id="first_name" name="user_name"
									class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-black dark:focus:ring-blue-500 dark:focus:border-blue-500"
									placeholder="user name" required />
							</div>
							<div>
								<label for="email" class="block mb-2 text-1xl text-black">Email
									Address</label> <input type="email" id="last_name" name="user_email"
									class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-black dark:focus:ring-blue-500 dark:focus:border-blue-500"
									placeholder="email address" required />
							</div>
							<div>
								<label for="contact" class="block mb-2 text-1xl text-black">Contact
									Number</label> <input type="tel" id="company" name="user_contact"
									class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-black dark:focus:ring-blue-500 dark:focus:border-blue-500"
									placeholder="+91" required />
							</div>
							<div>
								<label for="password" class="block mb-2 text-1xl text-black">Password</label>
								<input type="password" id="phone" name="user_password"
									class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-black dark:focus:ring-blue-500 dark:focus:border-blue-500"
									placeholder="passwpord"
									required />
							</div>
							<div>
								<label for="confirm"
									class="block mb-2 text-1xl text-gray-900 text-black">Confirm
									Password</label> 
									<input type="password" id="website" name="user_confirm_password"
									class="bg-gray-50 border border-gray-300 text-gray-900 text-md rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-black dark:focus:ring-blue-500 dark:focus:border-blue-500"
									placeholder="confirm password" required />
							</div>
							
							<button type="submit"
								class="text-black color1-bg hover:color1-bg focus:ring-4 focus:outline-none  font-large rounded-lg text-xl w-full sm:w-auto px-5 py-2.5 text-center">Submit</button>
							<div class="w-full text-center">
								<c:if test="${not empty Regmsg }">
								<p class="text-green-700 text-lg">${Regmsg}</p>
								<c:remove var="Regmsg"/>
								</c:if>
								
							</div>
							<div class="w-full text-center">
								<c:if test="${not empty errmsg }">
								<p class="text-green-700 text-lg">${errmsg}</p>
								<c:remove var="errmsg"/>
								</c:if>
								
							</div>
							<div class="w-full text-center text-xl">Already have account ? <a href="login.jsp" class="text-blue-700 text-xl">Sign-in</a></div>
					</form>

				</div>
			</div>

		</div>
	</div>
</body>
</html>