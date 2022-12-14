<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Visitors an Admin Panel Category Bootstrap Responsive Website Template | Home :: w3layouts</title>
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
<link rel="stylesheet" href="css/morris.css" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" type="text/css"/>
<!-- calendar -->
<link rel="stylesheet" href="css/monthly.css">
<!-- //calendar -->
<!-- //font-awesome icons -->
<script src="js/jquery2.0.3.min.js"></script>
<script src="js/raphael-min.js"></script>
<script src="js/morris.js"></script>
</head>
<body>
<%
	int value=0;
	try{
		value = Integer.parseInt(request.getParameter("value"));	
	}
	catch(Exception e){
		response.sendRedirect("AddQue.jsp?value=0");
	}
	if(value==1){
%>
<script type="text/javascript">
	alert('Question Added Successfully!!');
</script>
<%}else if(value==-1){ %>
<script type="text/javascript">
	alert('Question Was Not Added!');
</script>
<%} %>
<section id="container">
<!--header start-->
<header class="header fixed-top clearfix">
<!--logo start-->
<div class="brand">
    <a href="index.jsp" class="logo">
        HIREX
    </a>
    <!-- <div class="sidebar-toggle-box">
        <div class="fa fa-bars"></div>
    </div> -->
</div>
<!--logo end-->
<div class="top-nav clearfix">
    <!--search & user info start-->
    <ul class="nav pull-right top-menu">
        <!-- <li>
            <input type="text" class="form-control search" placeholder=" Search">
        </li> -->
        <!-- user login dropdown start-->
        <li class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                <!-- <img alt="" src="images/2.png"> -->
				<i class="fa fa-user"></i>
                <span class="username">Admin</span>
                <b class="caret"></b>
            </a>
            <ul class="dropdown-menu extended logout">
                <!-- <li><a href="#"><i class=" fa fa-suitcase"></i>Profile</a></li>
                <li><a href="#"><i class="fa fa-cog"></i> Settings</a></li> -->
                <li><a href="index.jsp"><i class="fa fa-key"></i> Log Out</a></li>
            </ul>
        </li>
        <!-- user login dropdown end -->
    </ul>
    <!--search & user info end-->
</div>
</header>
<!--header end-->
<!--sidebar start-->

<aside>
    <div id="sidebar" class="nav-collapse">
        <!-- sidebar menu start-->
        <div class="leftside-navigation">
            <ul class="sidebar-menu" id="nav-accordion">
                <li>
                    <a class="active" href="admindashboard.jsp">
                        <i class="fa fa-dashboard"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                
                <li class="sub-menu">
                    <a href="addHr.html">
                        <i class="fa-solid fa-user-plus"></i>
                        <span>Add HR</span>
                    </a>
                    <a href="AddQue.jsp">
                        <i class="fa-solid fa-circle-question"></i>
                        <span>Add Question</span>
                    </a>
                    <!-- <ul class="sub">
						<li><a href="typography.html">Typography</a></li>
						<li><a href="glyphicon.html">glyphicon</a></li>
                        <li><a href="grids.html">Grids</a></li>
                    </ul> -->
                </li>
                <!-- <li>
                    <a href="withdraw.html">
                        <i class="fa fa-usd"></i>
                        <span>Withdraw </span>
                    </a>
                </li> -->
                <!-- <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-th"></i>
                        <span>Data Tables</span>
                    </a>
                    <ul class="sub">
                        <li><a href="basic_table.html">Basic Table</a></li>
                        <li><a href="responsive_table.html">Responsive Table</a></li>
                    </ul>
                </li> -->
                <!-- <li class="sub-menu"> -->
                    <!-- <a href="transfer.html">
                        <i class="fa fa-users"></i>
                        <span>Fund Transfer</span>
                    </a> -->
                    <!-- <ul class="sub">
                        <li><a href="form_component.html">Form Elements</a></li>
                        <li><a href="form_validation.html">Form Validation</a></li>
						<li><a href="dropzone.html">Dropzone</a></li>
                    </ul> -->
                <!-- </li> -->
                <!-- <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-envelope"></i>
                        <span>Mail </span>
                    </a>
                    <ul class="sub">
                        <li><a href="mail.html">Inbox</a></li>
                        <li><a href="mail_compose.html">Compose Mail</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class=" fa fa-bar-chart-o"></i>
                        <span>Charts</span>
                    </a>
                    <ul class="sub">
                        <li><a href="chartjs.html">Chart js</a></li>
                        <li><a href="flot_chart.html">Flot Charts</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class=" fa fa-bar-chart-o"></i>
                        <span>Maps</span>
                    </a>
                    <ul class="sub">
                        <li><a href="google_map.html">Google Map</a></li>
                        <li><a href="vector_map.html">Vector Map</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-glass"></i>
                        <span>Extra</span>
                    </a>
                    <ul class="sub">
                        <li><a href="gallery.html">Gallery</a></li>
						<li><a href="404.html">404 Error</a></li>
                        <li><a href="registration.html">Registration</a></li>
                    </ul>
                </li>
                <li>
                    <a href="login.html">
                        <i class="fa fa-user"></i>
                        <span>Login Page</span>
                    </a>
                </li> -->
            </ul>            </div>
        <!-- sidebar menu end-->
    </div>
</aside>
<!--sidebar end-->

<section id="main-content">
    
	<section class="wrapper">
        <div class="log-w3">
            <div class="w3layouts-main-2" style="margin-top: 0%;">
                    <!-- <p>Don't Have an Account ?<a href="registration.html">Create an account</a></p> -->
                    <section class="panel">
                        <header class="panel-heading">
                            ADD QUESTION
                        </header>
                        <div class="panel-body">
                            <div class="position-center">
                                <form role="form" action="AddQuestion" method="post">
                                <div class="form-group">
                                    <label for="que">Write Question</label>
                                    <input type="text" class="form-control" id="que" name="que" placeholder="Write Question">
                                </div>
                                <br>
                                <div class="form-group">
                                    <b>Enter Marks :</b><br><br>
                                    <label for="ha">Highly Agree</label>
                                    <input type="number" class="form-control" id="ha" name="hamarks" placeholder="Enter Marks" min="0">
                                    <input type="radio" id="o" name="ha" value="o">
                                    <label for="o">Openness</label><br>
                                    <input type="radio" id="c" name="ha" value="c">
                                    <label for="c">Conscientiousness</label><br>
                                    <input type="radio" id="e" name="ha" value="e">
                                    <label for="e">Extroversion</label><br>
                                    <input type="radio" id="a" name="ha" value="a">
                                    <label for="a">Agreeableness</label><br>
                                    <input type="radio" id="n" name="ha" value="n">
                                    <label for="n">Neuroticism</label><br>
                                </div>
                                <div class="form-group">
                                    <label for="a">Agree</label>
                                    <input type="number" class="form-control" id="a" name="amarks" placeholder="Enter Marks" min="0">
                                    <input type="radio" id="o" name="a" value="o">
                                    <label for="o">Openness</label><br>
                                    <input type="radio" id="c" name="a" value="c">
                                    <label for="c">Conscientiousness</label><br>
                                    <input type="radio" id="e" name="a" value="e">
                                    <label for="e">Extroversion</label><br>
                                    <input type="radio" id="a" name="a" value="a">
                                    <label for="a">Agreeableness</label><br>
                                    <input type="radio" id="n" name="a" value="n">
                                    <label for="n">Neuroticism</label><br>
                                </div>
                                <div class="form-group">
                                    <label for="d">Disagree</label>
                                    <input type="number" class="form-control" id="d" name="dmarks" placeholder="Enter Marks" min="0">
                                    <input type="radio" id="o" name="d" value="o">
                                    <label for="o">Openness</label><br>
                                    <input type="radio" id="c" name="d" value="c">
                                    <label for="c">Conscientiousness</label><br>
                                    <input type="radio" id="e" name="d" value="e">
                                    <label for="e">Extroversion</label><br>
                                    <input type="radio" id="a" name="d" value="a">
                                    <label for="a">Agreeableness</label><br>
                                    <input type="radio" id="n" name="d" value="n">
                                    <label for="n">Neuroticism</label><br>
                                </div>
                                <div class="form-group">
                                    <label for="hd">Highly Disagree</label>
                                    <input type="number" class="form-control" id="hd" name="hdmarks" placeholder="Enter Marks" min="0">
                                    <input type="radio" id="o" name="hd" value="o">
                                    <label for="o">Openness</label><br>
                                    <input type="radio" id="c" name="hd" value="c">
                                    <label for="c">Conscientiousness</label><br>
                                    <input type="radio" id="e" name="hd" value="e">
                                    <label for="e">Extroversion</label><br>
                                    <input type="radio" id="a" name="hd" value="a">
                                    <label for="a">Agreeableness</label><br>
                                    <input type="radio" id="n" name="hd" value="n">
                                    <label for="n">Neuroticism</label><br>
                                </div>
                                <div class="form-group" style="text-align: center;">
                                    <button type="submit" class="btn btn-info" style="width: 20%;">ADD</button>
                                </div>
                            </form>
                            </div>
                        </div>
                    </section>
            </div>
            </div>
		<!-- <div class="table-agile-info">
        <div class="panel panel-default">
        <div class="panel-heading">
     HR
    </div>
    <div>
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
            <th data-breakpoints="xs">HR ID</th>
            <th>Name</th>
            <th>Designation</th>
            <th data-breakpoints="xs">Email</th>
           
            <th data-breakpoints="xs sm md" data-title="DOB">Action</th>
          </tr>
        </thead>
        <tbody>
        </tbody>
      </table>
    </div>
  </div>
</div> -->
</section>
<section>
	<footer>
			 <div class="footer">
			   <div class="wthree-copyright">
				 <p>? Developed by Durgesh Mahajan</p>
			   </div>
			 </div>
	</footer>
   </section>
</section>


<!--main content end-->
</section>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.dcjqaccordion.2.7.js"></script>
<script src="js/scripts.js"></script>
<script src="js/jquery.slimscroll.js"></script>
<script src="js/jquery.nicescroll.js"></script>
<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="js/flot-chart/excanvas.min.js"></script><![endif]-->
<script src="js/jquery.scrollTo.js"></script>
<!-- morris JavaScript -->	
<script>
	$(document).ready(function() {
		//BOX BUTTON SHOW AND CLOSE
	   jQuery('.small-graph-box').hover(function() {
		  jQuery(this).find('.box-button').fadeIn('fast');
	   }, function() {
		  jQuery(this).find('.box-button').fadeOut('fast');
	   });
	   jQuery('.small-graph-box .box-close').click(function() {
		  jQuery(this).closest('.small-graph-box').fadeOut(200);
		  return false;
	   });
	   
	    //CHARTS
	    function gd(year, day, month) {
			return new Date(year, month - 1, day).getTime();
		}
		
		graphArea2 = Morris.Area({
			element: 'hero-area',
			padding: 10,
        behaveLikeLine: true,
        gridEnabled: false,
        gridLineColor: '#dddddd',
        axes: true,
        resize: true,
        smooth:true,
        pointSize: 0,
        lineWidth: 0,
        fillOpacity:0.85,
			data: [
				{period: '2015 Q1', iphone: 2668, ipad: null, itouch: 2649},
				{period: '2015 Q2', iphone: 15780, ipad: 13799, itouch: 12051},
				{period: '2015 Q3', iphone: 12920, ipad: 10975, itouch: 9910},
				{period: '2015 Q4', iphone: 8770, ipad: 6600, itouch: 6695},
				{period: '2016 Q1', iphone: 10820, ipad: 10924, itouch: 12300},
				{period: '2016 Q2', iphone: 9680, ipad: 9010, itouch: 7891},
				{period: '2016 Q3', iphone: 4830, ipad: 3805, itouch: 1598},
				{period: '2016 Q4', iphone: 15083, ipad: 8977, itouch: 5185},
				{period: '2017 Q1', iphone: 10697, ipad: 4470, itouch: 2038},
			
			],
			lineColors:['#eb6f6f','#926383','#eb6f6f'],
			xkey: 'period',
            redraw: true,
            ykeys: ['iphone', 'ipad', 'itouch'],
            labels: ['All Visitors', 'Returning Visitors', 'Unique Visitors'],
			pointSize: 2,
			hideHover: 'auto',
			resize: true
		});
		
	   
	});
	</script>
<!-- calendar -->
	<script type="text/javascript" src="js/monthly.js"></script>
	<script type="text/javascript">
		$(window).load( function() {

			$('#mycalendar').monthly({
				mode: 'event',
				
			});

			$('#mycalendar2').monthly({
				mode: 'picker',
				target: '#mytarget',
				setWidth: '250px',
				startHidden: true,
				showTrigger: '#mytarget',
				stylePast: true,
				disablePast: true
			});

		switch(window.location.protocol) {
		case 'http:':
		case 'https:':
		// running on a server, should be good.
		break;
		case 'file:':
		alert('Just a heads-up, events will not work when run locally.');
		}

		});
	</script>
	<!-- //calendar -->
</body>
</html>