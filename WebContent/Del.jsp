<%@page import="com.candidateAsses.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.*" %>
<%
	Connection con =  DbConnection.connect();
	int id = Integer.parseInt(request.getParameter("value"));
	
	PreparedStatement psmt = con.prepareStatement("delete from hr where hid=?");
	psmt.setInt(1, id);
	if(psmt.executeUpdate()==1){
		response.sendRedirect("admindashboard.jsp");
	}
	else{
		response.sendRedirect("failure.html");
	}
%>
</body>
</html>