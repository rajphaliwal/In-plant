<%-- 
    Document   : login
    Created on : 29 Mar, 2015, 6:27:53 PM
    Author     : rahul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="plant" scope="page" class="hibernate.helper.InsertPlant" />

<!DOCTYPE html>
<html style="overflow: hidden;">
    <head>
        <meta charset="utf-8">
        <meta content="IE=edge" http-equiv="X-UA-Compatible">
        <meta content="width=device-width, initial-scale=1" name="viewport">
        <title>Inplant</title>
		<!-- <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script> -->
        <link rel="stylesheet" href="css/animate.min.css">
        <link rel="stylesheet" href="css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="css/app.min.1.css">
        <link rel="stylesheet" href="css/app.min.2.css">
        
    </head>
    
    <body class="sw-toggled" style="padding-top:135px">
<!--     Header start -->
<!-- 	<header id="header"> -->
<!-- 		<div class="container"> -->
<!-- 			<div class="col-md-12"> -->
<!-- 				<ul class="header-inner"> -->
<!-- 					<li class="logo"><img src="images/Inplant_icon.png" style="height:50px;"></li> -->
<!-- 					<li> -->
<!-- 						<div class="col-xs-12"><h3>In-plant Tracking System</h3></div> -->
<!-- 					</li> -->
<!-- 					<div class="pull-right hidden-xs" style="margin: -1px 14px 0 0"> -->
<!-- 						<img src="images/logo.png"> -->
<!-- 					</div> -->
<!-- 				</ul> -->
<!-- 				<div id="top-search-wrap"> -->
<!-- 					<input type="text"> -->
<!-- 					<i id="top-search-close">×</i> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</header> -->
<!-- 	<!--Header end--> -->
    <jsp:include page="includes/header.jsp"></jsp:include>
    <div class="wrapper">
		<!-- Slider Start-->
		<div class="container">
			<div class="col-md-12">
				<div class="col-sm-8 col-md-8">
					<div class="card">
						<div class="card-body card-padding">
							<div id="carousel-example-generic" class="slide" data-ride="carousel">
								<!-- Indicators -->
								<ol class="carousel-indicators">
									<li class="active" data-slide-to="0" data-target="#carousel-example-generic"></li>
									<li class="" data-slide-to="1" data-target="#carousel-example-generic"></li>
									<li class="" data-slide-to="2" data-target="#carousel-example-generic"></li>
								</ol>
								<!-- Wrapper for slides -->
								<div class="carousel-inner" role="listbox">
									<div class="item active">
										<img src="images/inplant_map.png" style="height:250px;width:100%">
									</div>
									<div class="item">
										<img src="images/TubesInplant.jpg" style="height:250px;width:100%">
									</div>
									<div class="item">
										<img src="images/slide1.jpeg" style="height:250px;width:100%">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-sm-4 col-md-4">
					<div class="well center login-box">
						<div class="alert alert-info"> Login </div>
							<div id="l-login" class="lc-block toggled" style="margin-top: 25px">
								 <!-- Login -->
								<form id="login" class="form-horizontal" method="post" action="userLogin" name="loginForm">
									<fieldset>
										<div class="input-group input-group-lg">
											<span class="input-group-addon"><i class="glyphicon glyphicon-user red"></i></span>
											<div class="fg-line">
												<input class="form-control validate[required]" type="text" onblur="document.loginForm.password.focus();" placeholder="Username" name="loginName">
											</div>
										</div>
										<div class="input-group input-group-lg">
											<span class="input-group-addon"><i class="glyphicon glyphicon-lock red"></i></span>
											<div class="fg-line">
											<input id="password" class="form-control" type="password" tabindex="3" name="password" placeholder="Password">
											<input type="hidden" value="" name="hash">
											</div>
										</div>	
										<div class="clearfix"></div>
										<div class="input-prepend" style="margin:5px;">
											<button class="btn btn-primary waves-effect waves-button waves-float" onclick="doLogin();" style="float:right">Login</button>
										</div>
									</fieldset>
								</form>
							</div>
					</div>	
				</div>
			</div>
		</div>
		<div class="container">
		    <div class="row">
		      <div class="col-md-12">
		        <div class="section-header text-center">
		          <h1><span class="c-blue">Welcome to</span> <span class="c-green">Inplant Vehicle Tracking System</span></h1>
		          <div class="row">
		            <div class="col-md-10 col-md-push-1" style="min-height:100px;">
		              <h4 class="thin text-muted text-center">Inplant Tracking System</h4>
		            </div>
		          </div>
		          <hr>
		        </div>
		      </div>
		    </div>
	  </div>
	</div>
    
    <footer>
	  <div class="footer_bg">
	    <div class="container">
	      <div class="col-md-12">
	      	JSPL Patratu&copy;2016
	      	<!--<img width="50" height="50" alt="" src="img/headers/sm/u36.jpg">-->
	        <div style="float:right;">
	        Powered By eTrans Solutions Pvt Ltd
	        <!--<img width="88" height="24" alt="" src="img/headers/sm/u28.png">-->
	        </div>
	      </div>
	     </div>
	  </div>
	</footer>
    <!-- Javascript Libraries -->
        <script src="js/jquery-2.1.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="vendors/waves/waves.min.js"></script>
        <script src="js/functions.js"></script>
    
    
    
    
    
    
<!--     <div class="container"> -->
<!--         <div class="jumbotron"> -->
<!--             <h2 style="text-align: center">Login Here</h2> -->
<!--         </div> -->
<!--         <br><br><br> -->
<!--         <div class="row"> -->
<!--             <div class="col-md-4 col-md-offset-4">     -->
<!--                 <div class="jumbotron" style="background: background"> -->
<!--                     <form role="form" action="userLogin" method="post"> -->
<!--                         <div class="form-group"> -->
<!--                             <label for="text">Enter Username</label> -->
<!--                             <input type="text" class="form-control" name="loginName" id="text"/> -->
<!--                         </div> -->
<!--                         <div class="form-group"> -->
<!--                             <label for="pwd">Enter Password</label> -->
<!--                             <input type="password" class="form-control" name="password" /> -->
<!--                         </div> -->

<!--                             <input class="btn btn-success col-sm-12" type="submit" value="Login"/> -->
<!--                     </form> -->
<!--                     <br> -->
<!--                 </div> -->
<!--             </div>     -->
<!--         </div> -->
<!--     </div>  -->
     
    </body>
</html>
