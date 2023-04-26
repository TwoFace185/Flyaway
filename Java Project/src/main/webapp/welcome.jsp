<%@page import="com.flyaway.connection.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="./style.css">
<body>
<div class="navbar">
<h1>Flyaway</h1>
<h2><a href="userloginpage.jsp">Logout</a></h2>
</div>
<%
Connection con=DbConnection.GetConnection();
PreparedStatement ps = con.prepareStatement("Select * from flight");
ResultSet rs = ps.executeQuery();

String str=(String)session.getAttribute("wel"); %>
<h1>Welcome <%out.print(str); %></h1>

<div>
<h3>Available Flight</h3>
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
<div>



</div>
<div>

<h1>Your Booked Flights</h1>
<% PreparedStatement ps1= con.prepareStatement("select Booked.f_id,Booked.name,flight.f_name,flight.airport,flight.destination,flight.departure from booked inner join flight on booked.f_id=flight.f_id where name=?");
   ps1.setString(1,str);
   ResultSet rs1=ps1.executeQuery();

   %>
   <table width="50%" border="1">
   <tr>
   <th>F.no</th>
   <th>Name</th>
   <th>Flight</th>
   <th>Airport</th>
   <th>Destination</th>
   <th>Departure</th>
   </tr>
   <%
while(rs1.next()){
	%><tr>
	<td><%out.print(rs1.getInt(1)); %></td>
	<td><%out.print(rs1.getString(2));%></td>
	<td><%out.print(rs1.getString(3)); %></td>
	<td><%out.print(rs1.getString(4));%></td>
	<td><%out.print(rs1.getString(5)); %></td>
	<td><%out.print(rs1.getString(6));%></td>
	
	</tr>
	<% }
 
%>
   </table>

</div>

<div>
<h2>Book a Flight</h2>
<form action="Bookflightform.jsp" method="post">
<h3>Flight Id:<input type="text" name="fid" placeholder="Enter Flight Number"></h3>
<h3>Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="name" placeholder="Enter you name"></h3>
<h3>Pass:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password"name="pass" placeholder="Enter your Pass"></h3>
<h3><input type="submit" value="Book"></h3>

<div><%String str1=(String)session.getAttribute("ins");
     out.print(str1);
%></div>
</form>
</div>
</div>
</body>
</html>