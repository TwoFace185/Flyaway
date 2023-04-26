package com.flyaway.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.flyaway.Dao.user;
import com.flyaway.connection.DbConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class userLogin
 */
@WebServlet("/userLogin")
public class userLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String u_name=request.getParameter("name");
		String u_pass= request.getParameter("u_pass");
		HttpSession session = request.getSession();
		
		try {
			Connection con=DbConnection.GetConnection();
			PreparedStatement ps=con.prepareStatement("select * from user");
			ResultSet rs = ps.executeQuery();
			
			List<user> users = new ArrayList<>();
			while(rs.next()) {
				user u= new user();
				u.setName(rs.getString(0));
				u.setPass(rs.getString(1));
				users.add(u);
			}
			for(user u:users) {
				if(u.getName().equals(u_name) && u.getPass().equals(u_pass));
				{
					response.sendRedirect("welcome.jsp");
					
			
				}
				
			}
			session.setAttribute("uid", "Please Sign Up");
			response.sendRedirect("index.jsp");
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
}

