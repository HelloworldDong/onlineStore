<%@ page language="java" import="java.util.*, java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" media="screen" href="css/css-table.css" />
<script type="text/javascript" src="css/js/jquery-1.2.6.min.js"></script>
<script type="text/javascript" src="css/js/style-table.js"></script>
<title>Shopping History</title>
</head>
<body>
<h1 style="text-align:center;font-size:50px;margin-top:20px">History</h1>
<%
 			String url = "jdbc:mysql://localhost:3306/bookstore";
			Connection con=null;
			PreparedStatement stat = null;
			ResultSet rs = null;
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, "root", "0010");
			stat = con.prepareStatement("select order_id,time,book_id,name,author,price,number from orders natural join orderdetail natural join book where user_id=? order by order_id desc");
			stat.setInt(1,(Integer)session.getAttribute("userid"));
			rs = stat.executeQuery();
			out.print("<table id='history' border=2> ");
			out.print("<tr><td>Order ID</td><td>Time</td><td>Book ID</td><td>BookName</td><td>Author</td><td>Price</td><td>Number</td></tr>");
			while(rs.next())
			{
				out.print("<tr>");
				out.print("<td>" + rs.getInt("order_id") + "</td>");
				out.print("<td>" + rs.getString("time") + "</td>");
				out.print("<td>" + rs.getString("book_id") + "</td>");
				out.print("<td>" + rs.getString("name") + "</td>");
				out.print("<td>" + rs.getString("author") + "</td>");
				out.print("<td>" + rs.getInt("price") + "</td>");
				out.print("<td>" + rs.getInt("number") + "</td>");
				out.print("</tr>");
			}
			out.print("</table>");
%>
</body>
</html>