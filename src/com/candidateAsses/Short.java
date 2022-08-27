package com.candidateAsses;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Short
 * 
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
		//int qCount=(int)(request.getAttribute("qcount"));
		int totalO=0,totalC=0,totalE=0,totalA=0,totalN=0;
		Connection con = DbConnection.connect();
		
		try {
			PreparedStatement totQna = con.prepareStatement("select * from qna");
			ResultSet allQna = totQna.executeQuery();
			PreparedStatement countTotal = con.prepareStatement("select * from qna where qid=?");
			while(allQna.next()){
				countTotal.setInt(1, allQna.getInt(1));
				ResultSet ques = countTotal.executeQuery();
				ques.next();
				int maxO=0, maxC=0, maxE=0, maxA=0, maxN=0;
				for(int j=3; j<=6; j++){
					String marks = ques.getString(j);
					switch(marks.charAt(0)){
					case 'o' : if(Character.getNumericValue(marks.charAt(1))>maxO){
									maxO=Character.getNumericValue(marks.charAt(1));
								}
								break;
					case 'c' : if(Character.getNumericValue(marks.charAt(1))>maxC){
									maxC=Character.getNumericValue(marks.charAt(1));
								}
								break;
					case 'e' : if(Character.getNumericValue(marks.charAt(1))>maxE){
									maxE=Character.getNumericValue(marks.charAt(1));
								}
								break;
					case 'a' : if(Character.getNumericValue(marks.charAt(1))>maxA){
									maxA=Character.getNumericValue(marks.charAt(1));
								}
								break;
					case 'n' : if(Character.getNumericValue(marks.charAt(1))>maxN){
									maxN=Character.getNumericValue(marks.charAt(1));
								}
								break;
					}
				}
				totalO+=maxO;
				totalC+=maxC;
				totalE+=maxE;
				totalA+=maxA;
				totalN+=maxN;
			}
//			System.out.println(totalO);
//			System.out.println(totalC);
//			System.out.println(totalE);
//			System.out.println(totalA);
//			System.out.println(totalN);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			PreparedStatement psmt = con.prepareStatement("select * from jobs where jid=?");
			psmt.setInt(1,jid);
			ResultSet rs = psmt.executeQuery();
			rs.next();
			int exp=rs.getInt(7);
			if(rs.getString(8).contains("Openness")){
				O=true;
			}
			if(rs.getString(8).contains("Conscientiousness")){
				C=true;
			}
			if(rs.getString(8).contains("Extroversion")){
				E=true;
			}
			if(rs.getString(8).contains("Agreeableness")){
				A=true;
			}
			if(rs.getString(8).contains("Neuroticism")){
				N=true;
			}
			String query = "select * from result where jid="+jid+" and cid="+cid;
			if(O){
				query+=(" and o>="+Integer.toString((int)(0.7*totalO)));
			}
			if(C){
				query+=(" and c>="+Integer.toString((int)(0.7*totalC)));
			}
			if(E){
				query+=(" and e>="+Integer.toString((int)(0.7*totalE)));
			}
			if(A){
				query+=(" and a>="+Integer.toString((int)(0.7*totalA)));
			}
			if(N){
				query+=(" and n>="+Integer.toString((int)(0.7*totalN)));
			}
			//System.out.println(query);
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
	            		updt_st.setInt(1, cid);
	            		updt_st.executeUpdate();
	            	}
				}
				response.sendRedirect("index.jsp");
			}
			else{
				PreparedStatement updt_st2 = con.prepareStatement("update application set status='FAILED' where cid=?");
        		updt_st2.setInt(1, cid);
        		if(updt_st2.executeUpdate()==1){
        			response.sendRedirect("index.jsp");
        		}
        		else{
        			response.sendRedirect("failure.jsp");
        		}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
