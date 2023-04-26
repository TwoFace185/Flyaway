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
<form action="addflightservlet.jsp" method="post">
<h5>flight id:<input type="text" name="id"></h5>
<h5>Flight Name:<input type="text" name="name"></h5>
<h5>Airport: <input type="text" name="from"></h5>
<h5>destination:<input type="text"  name="to"></h5>
<h5>Time: <input type="text" name="time"></h5>
<h5>Cost: <input type="text" name="cost"></h5>
<h5><input type="submit" value="Add Flight"></h5>

<h6><%String str=(String)session.getAttribute("in");
out.print(str);
%></h6>
</form>
</div>
</body>
</html>