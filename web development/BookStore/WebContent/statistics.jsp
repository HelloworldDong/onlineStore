<%@ page language="java" import="java.util.*, java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" media="screen" href="css/css-table.css" />
<script type="text/javascript" src="css/js/jquery-1.2.6.min.js"></script>
<script type="text/javascript" src="css/js/style-table.js"></script>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
<title>Statistics</title>
</head>
<body>
<form id="form" name="form" method="post" action="">
From<input type="text" readonly="readonly"  onclick="WdatePicker()" name="date1"/>
To<input type="text" readonly="readonly"  onclick="WdatePicker()" name="date2"/>
Mode<select id="select" name="select">
	<option>user</option>
	<option>book</option>
	<option>category</option>
	</select><br><br>
User Id/Book Id<input type="text" name="id"/>
<input type="submit" value="submit"/>
</form>
<h1 style="text-align:center;font-size:50px;margin-top:20px">Sales Statistics</h1>
  <%
  if (request.getMethod().equalsIgnoreCase("post")){
 			String url = "jdbc:mysql://localhost:3306/bookstore";
			Connection con=null;
			PreparedStatement stat = null;
			ResultSet rs = null;
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, "root", "0010");
			String choice=request.getParameter("select");
			if(choice.equals("user")){
				String uid=request.getParameter("id");
				stat = con.prepareStatement("select* from orders natural join orderdetail natural join book where user_id=? and date_format(time,'%Y-%m-%d') between ? and ?");
				stat.setString(1,uid);
				stat.setString(2,request.getParameter("date1"));
				stat.setString(3,request.getParameter("date2"));
				rs = stat.executeQuery();
				int total=0;
				out.print("<table border=1>");
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
					total+=rs.getInt("price")*rs.getInt("number");
				}
				out.print("<tr>");
				out.print("<td>Total Spend</td>");
				out.print("<td>"+total+"</td>");
				out.print("<tr>");
				out.print("</table>");
			}
			if(choice.equals("Book")){
				String bid=request.getParameter("id");
				stat = con.prepareStatement("select* from orders natural join orderdetail natural join book where book_id=? and date_format(time,'%Y-%m-%d') between ? and ?");
				stat.setString(1,bid);
				stat.setString(2,request.getParameter("date1"));
				stat.setString(3,request.getParameter("date2"));
				rs = stat.executeQuery();
				int total=0;
				out.print("<table border=1>");
				out.print("<tr><td>Order ID</td><td>Time</td><td>Number</td></tr>");
				while(rs.next())
				{
					out.print("<tr>");
					out.print("<td>" + rs.getInt("order_id") + "</td>");
					out.print("<td>" + rs.getString("time") + "</td>");
					out.print("<td>" + rs.getInt("number") + "</td>");
					out.print("</tr>");
					total+=rs.getInt("price")*rs.getInt("number");
				}
				out.print("<tr>");
				out.print("<td>Total Spend</td>");
				out.print("<td>"+total+"</td>");
				out.print("<tr>");
				out.print("</table>");
			}
			if(choice.equals("Category")){
				stat = con.prepareStatement("select sum(number) as nsum,category from orders natural join orderdetail natural join book where date_format(time,'%Y-%m-%d') between ? and ? group by category");
				stat.setString(1,request.getParameter("date1"));
				stat.setString(2,request.getParameter("date2"));
				rs = stat.executeQuery();
				out.print("<table border=1>");
				out.print("<tr><td>Category</td><td>Number</td></tr>");
				while(rs.next())
				{
					out.print("<tr>");
					out.print("<td>" + rs.getString("category") + "</td>");
					out.print("<td>" + rs.getInt("nsum") + "</td>");
					out.print("</tr>");
				}
				out.print("</table>");
			}
  }
%> 
</body>
</html>