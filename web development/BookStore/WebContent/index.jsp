<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Login</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<section class="container">
	<div class="login">
		<h1>Login</h1>
		<form method="post" action="login">
			<p>
				<input type="text" name="username" value="" placeholder="Username"
					validate="{required:true}">
			</p>
			<p>
				<input type="password" name="password" value=""
					placeholder="Password" validate="{required:true}">
			</p>
			<p class="submit">
				<input type="submit" value="Login">
			</p>
		</form>
	</div>
	<div class="login-help">
		<p>
			Don't have an account? <a href="register.jsp">Click here to
				register</a>
		</p>
	</div>
	</section>

</body>
</html>