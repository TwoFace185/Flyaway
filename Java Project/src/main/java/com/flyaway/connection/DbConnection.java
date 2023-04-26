package com.flyaway.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
	
	public static Connection GetConnection() {
		
		
		Connection con=null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway","root","!@#Shivam123");
		}catch(Exception e) {
			System.out.println(e);
		}
		return con;
	}

}
