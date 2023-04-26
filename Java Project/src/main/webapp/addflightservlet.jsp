<%@page import="com.flyaway.connection.DbConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id= request.getParameter("id");
String name= request.getParameter("name");
String from= request.getParameter("from");
String to= request.getParameter("to");
String time= request.getParameter("time");
String cost= request.getParameter("cost");
int paisa=Integer.parseInt(cost);

try{
Connection con = DbConnection.GetConnection();

PreparedStatement ps = con.prepareStatement("insert into flight(f_id,f_name,airport,destination,departure,cost) values(?,?,?,?,?,?)");
ps.setString(1,id);
ps.setString(2,name);
ps.setString(3,from);
ps.setString(4,to);
ps.setString(5,time);
ps.setInt(6,paisa);

int i=ps.executeUpdate();
if(i>0){
session.setAttribute("in" ,"Flight Added");
response.sendRedirect("addflightdata.jsp");}
else{
	session.setAttribute("in" , "Something is wrong ");
	response.sendRedirect("addflightdata.jsp");
}


}
catch(Exception e){
	System.out.println(e);
}
%>
</body>
</html>