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
 * Servlet implementation class AddQuestion
 */
public class AddQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddQuestion() {
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
		int hamarks = Integer.parseInt(request.getParameter("hamarks"));
		int amarks = Integer.parseInt(request.getParameter("amarks"));
		int dmarks = Integer.parseInt(request.getParameter("dmarks"));
		int hdmarks = Integer.parseInt(request.getParameter("hdmarks"));
		
		try {
			PreparedStatement psmt = con.prepareStatement("insert into qna values(?,?,?,?,?,?)");
			psmt.setInt(1, 0);
			psmt.setString(2, request.getParameter("que"));
			
			psmt.setString(3, request.getParameter("ha")+hamarks);
			psmt.setString(4, request.getParameter("a")+amarks);
			psmt.setString(5, request.getParameter("d")+dmarks);
			psmt.setString(6, request.getParameter("hd")+hdmarks);
			
			if(psmt.executeUpdate()==1){
				response.sendRedirect("AddQue.jsp?value=1");
			}
			else{
				response.sendRedirect("AddQue.jsp?value=-1");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
