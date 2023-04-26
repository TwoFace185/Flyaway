<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.flyaway.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page import="com.flyaway.Dao.user" %>
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

try{
Connection con = DbConnection.GetConnection();

String fid=request.getParameter("fid");
String name=request.getParameter("name");
String pass=request.getParameter("pass");


PreparedStatement ps = con.prepareStatement("select * from user");

ResultSet rs = ps.executeQuery();
List<user> users= new ArrayList();

while(rs.next()){
	String name1=rs.getString(1);
	String pass2=rs.getString(2);
	int user_id=rs.getInt(3);
	String email=rs.getString(4);
	
	user u= new user(name,pass,user_id,email);
	users.add(u);
	
}

for(user u:users){
	if(u.getName().equals(name) && u.getPass().equals(pass)){
		
		PreparedStatement ps1=con.prepareStatement("insert into booked(f_id,name) values(?,?)");
		ps1.setString(1,fid);
		ps1.setString(2, name);
		int i=ps1.executeUpdate();
		session.setAttribute("ins","Flight Booked");
		response.sendRedirect("welcome.jsp");
		break;
}
}
session.setAttribute("ins","Wrong Id or Password");
response.sendRedirect("welcome.jsp");
}catch(Exception e){
	System.out.println(e);
}
%>
</body>
</html>