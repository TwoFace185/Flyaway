<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Flyaway</h1>
<div class="userlogin">
<a href="index.jsp">Admin login</a></div>
<form action="userLogin.jsp" method="post">

 <div class="login">
 
<h3>User login</h3>
<h5>User &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" name="user"/></h5>
<h5>Password <input type="password" name="pass"/></h5>
<input type="submit" value="login"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="Clear">
</form>
<div><% String error=(String)session.getAttribute("uid");
%> <p><%=error %></p>
</div>

<h3><a href="adduserdata.jsp">Register as User</a></h3>
</div>

</body>
</html>