<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.flyaway.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FlyawayPortal</title>
</head>
<link rel="stylesheet" href="./style.css">
<body>
<div class="navbar">
<h1 > Flyaway </h1>

<h4><a href="adduserdata.jsp">Add User</a></h4>
<h4><a href="addflightdata.jsp">Add Flight</a></h4>
<h4><a href="index.jsp">Logout</a></h4>
</div>
<div class="flights">
<%
Connection con= DbConnection.GetConnection();
PreparedStatement ps = con.prepareStatement("Select * from Flight");
ResultSet rs = ps.executeQuery();
%>
<div class="flighttable">
<h1>Flights</h1>
<table width="50%" border="1">
<tr>
<th>Flight</th>
<th>From</th>
<th>Destination</th>
<th>Time</th>
<th>Cost</th>
<th>flight Number</th>
</tr>
<%
while(rs.next()){
	%><tr>
	<td><%out.print(rs.getString(1)); %></td>
	<td><%out.print(rs.getString(2));%></td>
	<td><%out.print(rs.getString(3)); %></td>
	<td><%out.print(rs.getString(4));%></td>
	<td><%out.print(rs.getInt(5)); %></td>
	<td><%out.print(rs.getString(6));%></td>
	
	</tr>
	<% }
%>
</table>
</div>
</div>

<div class="Users">
<%

PreparedStatement ps1 = con.prepareStatement("Select * from user");
ResultSet rs1 = ps1.executeQuery();
%>
<div class="user">
<h1>Users</h1>
<table width="50%" border="1">
<tr>
<th>User Name</th>
<th>User Pass</th>
<th>User Id</th>
<th>User Email</th>
</tr>
<%
while(rs1.next()){
	%><tr>
	<td><%out.print(rs1.getString(1)); %></td> 
	<td><%out.print(rs1.getString(2));%></td>
	<td><%out.print(rs1.getInt(3)); %></td>
	<td><%out.print(rs1.getString(4));%></td>
	</tr>
	<% }
%>
</table>
</div>
</body>
</html>