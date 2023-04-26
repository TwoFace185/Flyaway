<%@page import="org.apache.catalina.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.flyaway.connection.DbConnection" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.flyaway.Dao.user" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

String u_name=request.getParameter("user");
String u_pass= request.getParameter("pass");
 session = request.getSession();

try {
	Connection con=DbConnection.GetConnection();
	PreparedStatement ps=con.prepareStatement("select * from user");
	ResultSet rs = ps.executeQuery();
	List<user> users= new ArrayList();
	while(rs.next()){
		String name=rs.getString(1);
		String pass=rs.getString(2);
		int user_id=rs.getInt(3);
		String email=rs.getString(4);
		
		user u= new user(name,pass,user_id,email);
		users.add(u);
		
	}
	for(user usr:users){
		if(usr.getName().equals(u_name) && usr.getPass().equals(u_pass)){
			session.setAttribute("wel",u_name);
			response.sendRedirect("welcome.jsp");
			break;
		}
		
		
	}
	session.setAttribute("uid","Please check credentials");
	response.sendRedirect("userloginpage.jsp");
}catch(Exception e){
	System.out.println(e);
}
%>

</body>
</html>