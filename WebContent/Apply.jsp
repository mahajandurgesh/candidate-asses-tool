<%@page import="java.sql.Connection"%>
<%@page import="com.candidateAsses.Pojo"%>
<%@page import="com.candidateAsses.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Visitors an Admin Panel Category Bootstrap Responsive Website Template | Login :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Visitors Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap-css -->
<link rel="stylesheet" href="css/bootstrap.min.css" >
<!-- //bootstrap-css -->
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/style-responsive.css" rel="stylesheet"/>
<!-- font CSS -->
<link href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<!-- font-awesome icons -->
<link rel="stylesheet" href="css/font.css" type="text/css"/>
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<script src="js/jquery2.0.3.min.js"></script>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
	Connection con=DbConnection.connect();
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	long mob=Long.parseLong(request.getParameter("mob"));
	int exp=Integer.parseInt(request.getParameter("exp"));
	PreparedStatement psmt = con.prepareStatement("insert into application values(?,?,?,?,?,?,?)");
	psmt.setInt(1, Pojo.getJobId());
	psmt.setInt(2, 0);
	psmt.setString(3, name);
	psmt.setString(4, email);
	psmt.setLong(5, mob);
	psmt.setInt(6,exp);
	psmt.setString(7,"PENDING");
	if(psmt.executeUpdate()==1){
		psmt=con.prepareStatement("select jid,cid from application where cemail=?");
		psmt.setString(1, email);
		ResultSet rs = psmt.executeQuery();
		int jid=-1, cid=-1;
		while(rs.next()){
			jid=rs.getInt(1);
			cid=rs.getInt(2); 
		}
		response.sendRedirect("exam.jsp?jid="+Integer.toString(jid)+"&cid="+Integer.toString(cid));
	}
	else{
		response.sendRedirect("failure.jsp");
	}
%>
</body>
</html>