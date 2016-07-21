<%@ page language="java" import="java.util.*, java.sql.*,com.bean.Cart"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String username= (String) session.getAttribute("username");
	if (username == null) {
		response.sendRedirect("index.jsp");
	}
	out.print(username+",Welcome to DongLiang's BookStore!");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" media="screen" href="css/css-table.css" />
<script type="text/javascript" src="css/js/jquery-1.2.6.min.js"></script>
<script type="text/javascript" src="css/js/style-table.js"></script>
<title>BookStore</title>
</head>
<body>

<a href="profile.jsp" style="float:left;"><button>Profile</button></a>

<a href="logout" style="float: right;"><button>LogOut</button></a>
<h1 style="text-align:center;font-size:50px;margin-top:20px">Book On Sale</h1>
  <div style="width: 50%; float: left;">
<jsp:include page="browser.jsp"></jsp:include>	
<center>
 <form  action="AddtoCart" method="post" >
			BookID: <input type="text" name="id"><br><br>
			Number: <input type="text" name="number"><br><br>
			<input type="submit" value="Add to Cart">
		</form>
</center>

<div style="text-align: center">
		<form action="searchBookN" method="post">
					<b>Search:</b>
			<input type="text" name="bookname"> <input type="submit"
					value="Submit"><br> <br>

		</form>
	</div>
	<table border=1 align='center'>
				<tr>
					<td>Book ID</td>
					<td>Book Name</td>
					<td>Author</td>
					<td>Price</td>
				</tr>
				</tr>
				<s:iterator value="#request.bookn" id="book">
					<tr>
						<td><s:property value="#book.book_id" /></td>
						<td><s:property value="#book.name" /></td>
						<td><s:property value="#book.author" /></td>
						<td><s:property value="#book.price" /></td>
					</tr>
				</s:iterator>
			</table>
</div>
<div style="width: 50%; float: right;">
<h2 style="text-align:center;">Shopping Cart</h2>
<a href="history.jsp" style="float: right;"><button>Order History</button></a>
<%
		Cart cart=(Cart) session.getAttribute("cart");
		out.print("<table border=1 align='center'> ");
		out.print("<tr><td>Book ID</td><td>Number</td></tr>");
		int i=0;
		while(i<cart.getItem()){
		out.print("<td>" + cart.getBook(i) + "</td>");
		out.print("<td>" +cart.getNum(i) + "</td>");
		out.print("</tr>"); 
		i++;
		}
		%>	
</div>
<a  href='PayAction' style="float: right;"><button>Pay Now</button></a>
</body>
</html>