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
<title>Book Management</title>
<meta charset="UTF-8">

</head>
<body>
	<h1 style='background-color: lavender; padding: 1%; margin-bottom: 8px;'>Book Management</h1>
	<a href="administrator.jsp"><button>Administrator Center</button></a>
	<a href="logout" style="float: right;"><button>LogOut</button></a>
	<div style="text-align: center">
		<a href="addbook.jsp"><button>Add</button></a>
		<a href="delbook.jsp"><button>Delete</button></a>
		<a href="updbook.jsp"><button>Update</button></a>
		<a href="serbook.jsp"><button>Search</button></a>
	</div>
</body>
</html>