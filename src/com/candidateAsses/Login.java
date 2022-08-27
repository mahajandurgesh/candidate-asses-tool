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
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		Connection con=DbConnection.connect();
		PreparedStatement psmt;
		String uname=request.getParameter("Username");
		String pass=request.getParameter("Password");
		String choice=request.getParameter("login_type");
		if(choice.equals("admin")){
			try {
				psmt = con.prepareStatement("select * from admin where username=? and password=?");
				psmt.setString(1, uname);
				psmt.setString(2, pass);
				ResultSet rs = psmt.executeQuery();
				if(rs.next()){
					response.sendRedirect("admindashboard.jsp");
				}
				else{
					response.sendRedirect("login.jsp?value=-1");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(choice.equals("hr")){
			try {
				psmt = con.prepareStatement("select * from hr where email=? and pass=?");
				psmt.setString(1, uname);
				psmt.setString(2, pass);
				ResultSet rs = psmt.executeQuery();
				if(rs.next()){
					PreparedStatement psmt1=con.prepareStatement("select hid from hr where email=?");
					psmt1.setString(1,uname);
					ResultSet rs1=psmt1.executeQuery();
					rs1.next();
					int hid=rs1.getInt(1);
					Pojo.setHid(hid);
					response.sendRedirect("hrdashboard.jsp");
				}
				else{
					response.sendRedirect("login.jsp?value=-1");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		/*
		else{
			try {
				psmt = con.prepareStatement("select * from candidate where email=? and pass=?");
				psmt.setString(1, uname);
				psmt.setString(2, pass);
				ResultSet rs = psmt.executeQuery();
				if(rs.next()){
					response.sendRedirect("candidatedashboard.jsp");
				}
				else{
					response.sendRedirect("index.html");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		*/
	}

}
