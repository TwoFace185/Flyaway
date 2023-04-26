<%@page import="java.sql.ResultSet"%>
<%@page import="com.flyaway.Dao.user"%>
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
</head>
<body>
<%
String name = request.getParameter("name");
String id = request.getParameter("id");
String email= request.getParameter("email");
String pass=request.getParameter("pass");
user u=new user();

u.setName(name);
u.setUser_id(Integer.parseInt(id));
u.setPass(pass);
u.setEmail(email);

try{

Connection con= DbConnection.GetConnection();
PreparedStatement ps =con.prepareStatement("insert into user(name,pass,user_id,email) values(?,?,?,?)");
ps.setString(1,u.getName());
ps.setString(2, u.getPass());
ps.setInt(3, u.getUser_id());
ps.setString(4, u.getEmail());

int i=ps.executeUpdate();
if(i>0){
session.setAttribute("insert" ,"User Added");
response.sendRedirect("adduserdata.jsp");}
else{
	session.setAttribute("insert" , "Something is wrong ");
	response.sendRedirect("adduserdata.jsp");
}
}catch(Exception e){
	System.out.println(e);
}
%>

</body>
</html>