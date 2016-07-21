<%@ page language="java" import="java.util.*, java.sql.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%
	String username= (String) session.getAttribute("username");
	if (!username.equals("admin")) {
		response.sendRedirect("index.jsp");
	}
	out.print("welcome!admin!");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Delete User</title>

</head>
<body>
<h1 style="text-align:center"> Delete User</h1>
	<a	href="logout" style="float: right;"><button>logout</button></a><br>
		<form action="deleteUser" method="post">
		User ID:<input type="text" name="id"><br>
		<input type="submit" value="Delete">
		</form>
</body>
</html>