package com.candidateAsses;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddHr
 */
public class AddHr extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddHr() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		Connection con = DbConnection.connect();
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		long mob = Long.parseLong(request.getParameter("mob"));
		String desig=request.getParameter("desig");
		String pass=request.getParameter("pass");
		
		try {
			PreparedStatement psmt=con.prepareStatement("insert into hr values(?,?,?,?,?,?)");
			psmt.setInt(1, 0);
			psmt.setString(2, name);
			psmt.setLong(3, mob);
			psmt.setString(4, desig);
			psmt.setString(5, email);
			psmt.setString(6, pass);
			
			if(psmt.executeUpdate()==1){
				response.sendRedirect("admindashboard.jsp");
			}
			else{
				response.sendRedirect("failure.html");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
