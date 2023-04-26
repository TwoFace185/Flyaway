<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./style.css">
</head>
<link rel="stylesheet" href="./style.css">
<body>
<div class="navbar">
<h1>Flyaway</h1>
</div>
<div class="userlogin">
<a href="userloginpage.jsp">User Login</a></div>
<form action="adminloginpage.jsp" method="post">
<h3>Admin login</h3>
<h5>User &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" name="user"/></h5>
<h5>Password <input type="password" name="pass"/></h5>
<input type="submit" value="login"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="Clear">
</form><% String error=(String)session.getAttribute("uid");
%> <p><%=error %></p>
</body>
</html>