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
import java.util.*;

/**
 * Servlet implementation class AddJob
 */
public class AddJob extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddJob() {
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
		boolean O,C,E,A,N;
		String jobTitle = request.getParameter("jobtitle");
		String jobDesc = request.getParameter("jobdesc");
		int salaryMin = Integer.parseInt(request.getParameter("salarymin"));
		int salaryMax = Integer.parseInt(request.getParameter("salarymax"));
		String qualities="";
		try{
			if(request.getParameter("qual1").equals("openness")){
				O=true;
				qualities+=("Openness,");
			}
		}
		catch(java.lang.NullPointerException ne){
			O=false;
		}
		try{
			if(request.getParameter("qual2").equals("conscientiousness")){
				C=true;
				qualities+=("Conscientiousness,");
			}
		}
		catch(java.lang.NullPointerException ne){
			C=false;
		}
		try{
			if(request.getParameter("qual3").equals("extroversion")){
				E=true;
				qualities+=("Extroversion,");
			}
		}
		catch(java.lang.NullPointerException ne){
			E=false;
		}
		try{
			if(request.getParameter("qual4").equals("agreeableness")){
				A=true;
				qualities+=("Agreeableness,");
			}
		}
		catch(java.lang.NullPointerException ne){
			A=false;
		}
		try{
			if(request.getParameter("qual5").equals("neuroticism")){
				N=true;
				qualities+=("Neuroticism,");
			}
		}
		catch(java.lang.NullPointerException ne){
			N=false;
		}
		int exp = Integer.parseInt(request.getParameter("experience"));
		try {
			PreparedStatement psmt = con.prepareStatement("insert into jobs values(?,?,?,?,?,?,?,?)");
			psmt.setInt(1, 0);
			psmt.setInt(2, Pojo.getHid());
			psmt.setString(3,jobTitle);
			psmt.setString(4,jobDesc);
			psmt.setInt(5,salaryMin);
			psmt.setInt(6,salaryMax);
			psmt.setInt(7, exp);
			psmt.setString(8, qualities);
			
			if(psmt.executeUpdate()==1){
				response.sendRedirect("hrdashboard.jsp");
			}
			else{
				response.sendRedirect("failure.hml");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
