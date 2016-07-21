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
<title>Delete Book</title>
<link rel="stylesheet" type="text/css" media="screen" href="css/css-table.css" />
<script type="text/javascript" src="css/js/jquery-1.2.6.min.js"></script>
<script type="text/javascript" src="css/js/style-table.js"></script>
</head>
<body>
<h1 style="text-align:center"> Delete Book</h1>
	<a	href="logout" style="float: right;"><button>logout</button></a><br>
		<form action="deleteBook" method="post">
		Book ID:<input type="text" name="bookid"><br>
		<input type="submit" value="Delete">
		</form>
</body>
</html>