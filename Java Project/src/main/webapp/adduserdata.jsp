<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.flyaway.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./style.css">
</head>
<body>

<div class="navbar">
<h1>Flyaway</h1>
<h2><a href="userloginpage.jsp">Logout</a></h2>
</div>
<div>
<form action="adduserServlet.jsp" method="post">
<h5>Name:<input type="text" name="name"></h5>
<h5>email:<input type="email" name="email"></h5>
<h5>id:<input type="text" name="id"></h5>
<h5>Password:<input type="password" name="pass"></h5>

<h5><input type="submit" value="Register"/></h5>
<div>
<%
String str=(String)session.getAttribute("insert");
out.print(str);
%>
</div>
</form>
</div>
</body>
</html>