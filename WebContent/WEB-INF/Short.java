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
 * Servlet implementation class Short
 */
public class Short extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Short() {
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
		boolean O=false,C=false,E=false,A=false,N=false;
		int jid=(int)(request.getAttribute("value"));
		int cid=(int)(request.getAttribute("cid"));
		Connection con = DbConnection.connect();
		try {
			PreparedStatement psmt = con.prepareStatement("select * from jobs where jid=?");
			psmt.setInt(1,jid);
			ResultSet rs = psmt.executeQuery();
			rs.next();
			int exp=rs.getInt(7);
			if(rs.getString(7).contains("Openness")){
				O=true;
			}
			if(rs.getString(7).contains("Conscientiousness")){
				C=true;
			}
			if(rs.getString(7).contains("Extroversion")){
				E=true;
			}
			if(rs.getString(7).contains("Agreeableness")){
				A=true;
			}
			if(rs.getString(7).contains("Neuroticism")){
				N=true;
			}
			String query = "select * from result where jid="+jid+" and cid="+cid;
			if(O){
				query+=" and o>=14";
			}
			if(C){
				query+=" and c>=14";
			}
			if(E){
				query+=" and e>=14";
			}
			if(A){
				query+=" and a>=14";
			}
			if(N){
				query+=" and n>=14";
			}
			
			PreparedStatement psmt2 = con.prepareStatement(query);
			ResultSet rs2 = psmt2.executeQuery();
			if(rs2.next()){
				rs2.previous();
				PreparedStatement psmt3 = con.prepareStatement("select * from application where cid=? and exp>="+exp);
				
				while(rs2.next()){ 
					psmt3.setInt(1,rs2.getInt(2));
	            	ResultSet rs3 = psmt3.executeQuery();
	            	if(rs3.next()){
	            		PreparedStatement updt_st = con.prepareStatement("update application set status='PASSED' where cid=?");
	            		updt_st.setInt(1, rs3.getInt(2));
	            		updt_st.executeUpdate();
	            	}
	            	else{
	            		PreparedStatement updt_st = con.prepareStatement("update application set status='FAILED' where cid=?");
	            		updt_st.setInt(1, rs3.getInt(2));
	            		updt_st.executeUpdate();
	            	}
				}
			}
			else{
				PreparedStatement updt_st = con.prepareStatement("update application set status='FAILED' where cid=?");
        		updt_st.setInt(1, rs2.getInt(2));
        		updt_st.executeUpdate();
			}
			response.sendRedirect("index.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
