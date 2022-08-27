package com.candidateAsses;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CheckStat
 */
public class CheckStat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckStat() {
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
		String email=request.getParameter("Email");
		try {
			PreparedStatement psmt = con.prepareStatement("select * from application where cemail=?");
			psmt.setString(1, email);
			ResultSet rs = psmt.executeQuery();
			if(rs.next()){
				if(rs.getString(7).equals("PASSED")){
					response.sendRedirect("passed.html");
				}
				else if(rs.getString(7).equals("FAILED")){
					response.sendRedirect("failed.html");
				}
				else{
					response.sendRedirect("invalid_user.html");
				}
			}
			else{
				response.sendRedirect("invalid_user.html");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
