<%@page import="com.candidateAsses.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Visitors an Admin Panel Category Bootstrap Responsive Website Template | Responsive_table :: w3layouts</title>
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
	int jid=Integer.parseInt(request.getParameter("jid"));
	int cid=Integer.parseInt(request.getParameter("cid"));
	Connection con = DbConnection.connect();
	PreparedStatement psmt = con.prepareStatement("select qid,qdesc from qna");
	ResultSet rs = psmt.executeQuery();
	int qno=1;
%>
<section class="wrapper">
		<div class="table-agile-info">
 <div class="panel panel-default">
    <div class="panel-heading">
     Personality Test
    </div>
    <div>
    <form action="calcResult.jsp?jid=<%=jid%>&cid=<%=cid%>" method="post">
      <table class="table" ui-jq="footable" ui-options='{
        "paging": {
          "enabled": true
        },
        "filtering": {
          "enabled": true
        },
        "sorting": {
          "enabled": true
        }}'>
        <thead>
          <tr>
            <th data-breakpoints="xs">QNo.</th>
            <th>Question</th>
            <th data-breakpoints="xs">Options</th>
          </tr>
        </thead>
        <tbody>
        <%while(rs.next()){ %>
          <tr data-expanded="true">
            <td><%=qno %></td>
            <td><%=rs.getString(2) %></td>
            <td>
            	<input type="radio" id="q<%=qno %>" name="q<%=rs.getInt(1) %>" value="ha" required="required">
				<label for="ha">Highly Agree</label>
				<input type="radio" id="q<%=qno %>" name="q<%=rs.getInt(1) %>" value="a" required="required">
				<label for="a">Agree</label>
				<input type="radio" id="q<%=qno %>" name="q<%=rs.getInt(1) %>" value="d" required="required">
				<label for="d">Disagree</label>
				<input type="radio" id="q<%=qno %>" name="q<%=rs.getInt(1) %>" value="hd" required="required">
				<label for="hd">Highly Disagree</label>
            </td>
            <%qno++; %>
          </tr>
          <%} %>
        </tbody>
      </table>
      <div style="text-align:center;">
      	<button type="submit" class="btn btn-info" style="width: 10%"><h3><b>Submit</b></h3></button>
      </div>
      </form>
    </div>
  </div>
</div>
</section>
</body>
</html>