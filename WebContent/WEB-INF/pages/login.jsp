<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="utf-8"> 
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link type="text/css" rel="stylesheet" href="css/stylesheet.css">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.5.0-beta.1/angular.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.5.0-beta.1/angular-route.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.0/angular-messages.js"></script>
	<script type="text/javascript" src="js/app.js"></script>
	<script src="js/angular.min.js"></script>
	<link href="css/landing-page.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
	<script type="text/javascript">
		$('#status').fadeOut(800);
		
		$("a[rel!='nofollow']a[rel!='external'][target!='_blank']a[class!='load']").click(function() {
		    $("#status").fadeIn(400);
		    setTimeout(function() {
		        $("#status").fadeOut(400)
		    },
		    4000)
		});
		
		$("a[href*='#'],a[rel='external nofollow'],a[href='javascript:void(0)'],a[href='javascript:reset_captcha('')']").click(function() {
		    $("#status").fadeOut(400)
		});
	</script>
	<style>
		.alert {
			color: red;
			background: #fdf1e5;
			font-size: 10px;
			line-height: 16px;
			width: 200px;
			margin: 10;
			position: relative;
		}
	</style>
	
	<!-- <base href="/Project1/"> -->
	
</head>
<body ng-app="main" data-spy="scroll" data-target=".navbar" data-offset="50" class="background">

	<div class="container-fluid">
		<div class="top headerLinks">
			<a href="#land">
				<img width="130" height="60" src="icon/icon.jpg">
				<sec:authorize access="hasRole('ROLE_ADMIN')">
				<h2>ADMIN PAGE</h2></sec:authorize>
			</a>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_USER')?false:true">
				<ul class="nav navbar-nav navbar-right col-md-2" >
			        <li style="float:right;">
	                  	<a href="#login_form" data-target="mylogin">
	                  	 	<span class="glyphicon glyphicon-log-in" ></span> Sign in
	                  	</a>
		        </li>
		    </ul>
		    </sec:authorize>
		</div>
	</div>
	<nav class="navbar navbar-default" data-spy="affix" data-offset-top="197">		
		<div class="container-fluid" ng-controller="MainController">
			<ul class="nav navbar-nav">
			    <li><a href="#land" class="nav-font">Home</a></li>
			    <li>
			    	<a href="#marketdata" class="nav-font">MarketData</a>
			    </li>
			   <!--  <li>
			    	<a href="#transaction" class="nav-font">Transaction</a>
			    </li> -->
			    <sec:authorize access="hasRole('ROLE_USER')">
                  <li>
                      <a class="nav-font" href="#portfolio">
                          <i class="icon_desktop"></i>
                          <span>My Portfolio</span>
                      </a>
                  </li>
                  <li>
                      <a class="nav-font" href="#history">
                          <i class="icon_document_alt"></i>
                          <span>History</span>
                      </a>
                  </li> 
                 </sec:authorize>
			</ul>
			<sec:authorize access="hasRole('ROLE_USER')">
			<ul class="nav navbar-nav pull-right">
					<li class="dropdown" ng-controller="headerCtrl">
                      <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                          <span class="profile-ava">
                              <img alt="" src="icon/user.png" width="30" height="30">
                          </span>
                          <span class="username">Hello, {{user.userName}}</span>
                          <b class="caret"></b>
                      </a>
                      <ul class="dropdown-menu extended logout">
                          <div class="log-arrow-up"></div>
                          <li class="prof-info-container">
                          	<div class="profile-ava prof-big"><img alt="" src="icon/user.png" width="50" height="50"></div>
                          	<div class="prof-info">
                          		<ul>
                          			<li>{{user.firstName}} {{user.lastName}}</li>
                          			<li>{{user.email}}
                          		</ul>                          	
                          	</div>
                          </li>
                          <li>
                          	<a href="<c:url value='/j_spring_security_logout'/>"><i class="icon_key_alt"></i>Logout</a>
                          </li>
                      </ul>
                  </li>
			</ul>
			</sec:authorize>
		</div>
	</nav>

	<div class="intro-header">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-message">
                        <h1>We see your Financial Life in total</h1>
                        <h3>Upgrade your Stock Trading with Yahoo Finance Trading System</h3>
                        <hr class="intro-divider">
                       <!--  <ul class="list-inline intro-social-buttons">
                            <li>
                                <a href="https://twitter.com/SBootstrap" class="btn btn-default btn-lg"><i class="fa fa-twitter fa-fw"></i> <span class="network-name">Twitter</span></a>
                            </li>
                            <li>
                                <a href="https://github.com/IronSummitMedia/startbootstrap" class="btn btn-default btn-lg"><i class="fa fa-github fa-fw"></i> <span class="network-name">Github</span></a>
                            </li>
                            <li>
                                <a href="#" class="btn btn-default btn-lg"><i class="fa fa-linkedin fa-fw"></i> <span class="network-name">Linkedin</span></a>
                            </li>
                        </ul> -->
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container -->
        <a  name="services"></a>
	    <div class="content-section-a">
	
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-5 col-sm-6">
	                    <hr class="section-heading-spacer">
	                    <div class="clearfix"></div>
	                    <h2 class="section-heading">Death to the Stock Photo:<br>Special Thanks</h2>
	                    <p class="lead">A special thanks to <a target="_blank" href="http://join.deathtothestockphoto.com/">Death to the Stock Photo</a> for providing the photographs that you see in this template. Visit their website to become a member.</p>
	                </div>
	                <div class="col-lg-5 col-lg-offset-2 col-sm-6">
	                    <img class="img-responsive" src="img/ipad.png" alt="">
	                </div>
	            </div>
	
	        </div>
	        <!-- /.container -->
	
	    </div>
    	<!-- /.content-section-a -->

	    <div class="content-section-b">
	
	        <div class="container">
	
	            <div class="row">
	                <div class="col-lg-5 col-lg-offset-1 col-sm-push-6  col-sm-6">
	                    <hr class="section-heading-spacer">
	                    <div class="clearfix"></div>
	                    <h2 class="section-heading">3D Device Mockups<br>by PSDCovers</h2>
	                    <p class="lead">Turn your 2D designs into high quality, 3D product shots in seconds using free Photoshop actions by <a target="_blank" href="http://www.psdcovers.com/">PSDCovers</a>! Visit their website to download some of their awesome, free photoshop actions!</p>
	                </div>
	                <div class="col-lg-5 col-sm-pull-6  col-sm-6">
	                    <img class="img-responsive" src="img/dog.png" alt="">
	                </div>
	            </div>
	
	        </div>
	        <!-- /.container -->
	
	    </div>
	    <!-- /.content-section-b -->

	    <div class="content-section-a">
	
	        <div class="container">
	
	            <div class="row">
	                <div class="col-lg-5 col-sm-6">
	                    <hr class="section-heading-spacer">
	                    <div class="clearfix"></div>
	                    <h2 class="section-heading">Google Web Fonts and<br>Font Awesome Icons</h2>
	                    <p class="lead">This template features the 'Lato' font, part of the <a target="_blank" href="http://www.google.com/fonts">Google Web Font library</a>, as well as <a target="_blank" href="http://fontawesome.io">icons from Font Awesome</a>.</p>
	                </div>
	                <div class="col-lg-5 col-lg-offset-2 col-sm-6">
	                    <img class="img-responsive" src="img/phones.png" alt="">
	                </div>
	            </div>
	
	        </div>
	        <!-- /.container -->
	
	    </div>

    </div>
	
	
	<!-- <div class="rtop_btn" id="rtop_btn">
		<a href="#0" class="toplink cd-top">
			<img src="icon/backtotop.png" class="totop" width="60" height="60">
		</a>
	</div> -->
	
	
	<footer class="container-fluid bg-4">
		<div class="row">
		<div class="social-follow col-md-4">
			<span class="follow">Follow Us</span>
			<div class="social-icons">
				<a href="https://twitter.com" class="twitter" target="_blank"><img src="icon/twitter.png" style=" height: 66px; width: 60px;"></a>
				<a href="https://www.facebook.com"  class="facebook" target="_blank"><img src="icon/facebook.png" style=" height: 66px; width: 60px;"></a>
				<a href="https://www.instagram.com" class="instagram" target="_blank"><img src="icon/instagram.png" style=" height: 66px; width: 60px;"></a>
			</div>
		</div>
		<div class="contact-us col-md-4">
			<span class="contact">Contact Us</span>
			<div>
				<p><span class="glyphicon glyphicon-map-marker"></span> Princeton, US</p>
      			<p><span class="glyphicon glyphicon-phone"></span> Phone: +01 1234567890</p>
      			<p><span class="glyphicon glyphicon-envelope"></span> Email: mail@mail.com</p>	
			</div>
		</div>
		<div class="contact-us col-md-3">
			<span class="contact">Contact Us</span>
			<div>
				<p><span class="glyphicon glyphicon-map-marker"></span> Princeton, US</p>
      			<p><span class="glyphicon glyphicon-phone"></span> Phone: +01 1234567890</p>
      			<p><span class="glyphicon glyphicon-envelope"></span> Email: mail@mail.com</p>	
			</div>
		</div>
		</div>
		<div class="row">
			<div class="text-center">
  			<p>Copyright © Your Website 2015</p> 
			</div>	
		</div>
		
	</footer>
	
</body>
</html>