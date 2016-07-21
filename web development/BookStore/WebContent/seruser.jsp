<%@ page language="java" import="java.util.*, java.sql.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags"%>
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

</head>
<body >
	<h1>Search User </h1>
	<a href="administrator.jsp"><button>Administrator Center</button></a>
	<a href="umanage.jsp"><button>Return</button></a>
	<a href="logout" style="float: right;"><button>LogOut</button></a>
	<div style="text-align: center">
		<form action="searchUser" method="post">
					<b>Search:</b>
			<input type="text" name="id" placeholder="User ID "> <input type="submit"
					value="Submit"><br> <br>

		</form>
	</div>
	<table border=1 align='center'>
				<tr>
					<td>User ID</td>
					<td>UserName</td>
					<td>Password</td>
				</tr>
				</tr>
				<s:iterator value="#request.User" id="user">
					<tr>
						<td><s:property value="#user.id" /></td>
						<td><s:property value="#user.username" /></td>
						<td><s:property value="#user.password" /></td>
					</tr>
				</s:iterator>
			</table>
</body>
</html>