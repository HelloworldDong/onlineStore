
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
<title>Administrator Page</title>

</head>
<body>
	<h1>Book Store - Administrator Page</h1>
	<div style="width: 50%; float: left;">
		<a href="umanage.jsp"><button>User Management</button></a> 
		<div style="text-align: center; margin-left: auto; margin-right: auto;">
			Users:<br> <br>
			<a href="listUser"><button>view Users</button></a> 
			<table border=1 align='center'>
				<tr>
					<td>User ID</td>
					<td>User Name</td>
					<td>Password</td>
				</tr>
				<s:iterator value="#request.users" id="user">
					<tr>
						<td><s:property value="#user.id" /></td>
						<td><s:property value="#user.username" /></td>
						<td><s:property value="#user.password" /></td>
					</tr>
				</s:iterator>
			</table>
		</div>
	</div>
	<div style="width: 50%; float: left;">
		<a href="bmanage.jsp"><button>Book Management</button></a> 
		<a href="statistics.jsp"><button>Statistics</button></a> 
		<a	href="logout" style="float: right;"><button>logout</button></a><br>
		<div
			style="text-align: center; margin-left: auto; margin-right: auto;">
			Book In Stock:<br> <br>
			<jsp:include page="browser.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>