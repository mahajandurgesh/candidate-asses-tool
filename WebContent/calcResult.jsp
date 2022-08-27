<%@page import="com.candidateAsses.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
	int jid=Integer.parseInt(request.getParameter("jid"));
	int cid=Integer.parseInt(request.getParameter("cid"));
	int O=0,C=0,E=0,A=0,N=0,qCount=0;
	Connection con=DbConnection.connect();
	PreparedStatement psmt_count = con.prepareStatement("select * from qna");
	ResultSet qna_count = psmt_count.executeQuery();
	
	//qCount=qna_count.getInt(1);
	PreparedStatement psmt = con.prepareStatement("select * from qna where qid=?");
	while(qna_count.next()){
		psmt.setInt(1, qna_count.getInt(1));
		ResultSet rs=psmt.executeQuery();
		rs.next();	
		String result=null;
		if(request.getParameter("q"+qna_count.getInt(1)).equals("ha")){
			result=rs.getString(3);
		}
		else if(request.getParameter("q"+qna_count.getInt(1)).equals("a")){
			result=rs.getString(4);
		}
		else if(request.getParameter("q"+qna_count.getInt(1)).equals("d")){
			result=rs.getString(5);
		}
		else if(request.getParameter("q"+qna_count.getInt(1)).equals("hd")){
			result=rs.getString(6);
		}
		//System.out.println(result);
		switch(result.charAt(0)){
		case 'o' : O+=Character.getNumericValue(result.charAt(1));
					break;
		case 'c' : C+=Character.getNumericValue(result.charAt(1));
					break;
		case 'e' : E+=Character.getNumericValue(result.charAt(1));
					break;
		case 'a' : A+=Character.getNumericValue(result.charAt(1));
					break;
		case 'n' : N+=Character.getNumericValue(result.charAt(1));
					break;
		}
	}
	
	PreparedStatement psmt2=con.prepareStatement("insert into result values(?,?,?,?,?,?,?,?)");
	psmt2.setInt(1, jid);
	psmt2.setInt(2, cid);
	psmt2.setInt(3, O);
	psmt2.setInt(4, C);
	psmt2.setInt(5, E);
	psmt2.setInt(6, A);
	psmt2.setInt(7, N);
	psmt2.setInt(8,0);
	
	if(psmt2.executeUpdate()==1){
		//response.sendRedirect("Short?value="+jid+"&cid="+cid);
		request.setAttribute("value", jid);
		request.setAttribute("cid", cid);
		//request.setAttribute("qcount", qCount);
		RequestDispatcher reqd = request.getRequestDispatcher("Short");
		reqd.forward(request, response);
	}
	else{
		response.sendRedirect("failure.jsp");
	}
%>
</body>
</html>