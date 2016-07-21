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
<title>Add Book</title>
<meta charset="UTF-8">

</head>
<body>
	<h1>Add Book</h1>
	<a href="administrator.jsp"><button>Administrator Center</button></a>
	<a href="logout" style="float: right;"><button>LogOut</button></a>
	<form action="updateBook" method="post">
		Book ID:<input type="text" name="bookid"><br>
		Book Name:<input type="text" name="bookname"><br>
		Author:<input type="text" name="author"><br>
		Price:<input type="text" name="price"><br>
		<input type="submit" value="Update">
		</form>
</body>
</html>