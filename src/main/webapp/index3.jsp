<%@ page language="java" import="java.util.*"  contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%> 
<%@ page import="com.instrument.domain.Instrument" %>
<%@ page import="com.instrument.domain.InstrumentType" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	List<Instrument> instrumentList = (List<Instrument>)request.getAttribute("instrument");
	List<InstrumentType> instrumentTypeList = (List<InstrumentType>)request.getAttribute("instrumentType");

%>
<!--d
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
	<title>乐器管理系统</title>
	<!--for-mobile-apps-->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="Furniture Mart Responsive Website Template, Web Templates, Flat Web Templates, Android Compatible web template, 
		Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!--//for-mobile-apps-->
	
	<!-- Custom-Theme-Files -->
    <!-- Bootstrap-CSS --> 			<link rel="stylesheet" href="index/css/bootstrap.min.css">
    <!-- JQuery --> 				<script src="index/js/jquery-2.1.4.min.js"></script>
    <!-- Bootstrap-Main --> 		<script src="index/js/bootstrap.min.js">		</script>
    <!-- Index-Page-Styling --> 	<link rel="stylesheet" href="index/css/style.css" type="text/css" media="all">
	<!-- JS Box model -->			<script src="index/js/modernizr.custom.js"></script>
	
	<!-- JS for EasyResponsive tab -->
	<script src="index/js/easyResponsiveTabs.js" type="text/javascript"></script>
		<script type="text/javascript">
		$(document).ready(function() {
			$.get("localhost:8080/instrument/index3",function(){
			    });
			});
			$(document).ready(function () {
			$('#horizontalTab').easyResponsiveTabs({
			type: 'default', //Types: default, vertical, accordion           
			width: 'auto', //auto or any width like 600px
			fit: true   // 100% fit in a container
			});
			});
		</script>
		
	<!-- Start-Smooth-Scrolling -->
	<script type="text/javascript" src="index/js/move-top.js"></script>
	<script type="text/javascript" src="index/js/easing.js"></script>
		<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){     
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top},2000);
            });
			});
		</script>
	<!-- //End-Smooth-Scrolling -->

	<!--JS for animate-->
	<link href="index/css/animate.css" rel="stylesheet" type="text/css" media="all">
	<script src="index/js/wow.min.js"></script>
		<script>
			new WOW().init();
		</script>
	<!--//end-animate-->

</head>

<body>

<div class="header" id="home">
		
	<div class="menu">
		<nav class="navbar navbar-default ">
			<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				  <a class="navbar-brand logo" href="#"><img src="./index/images/mlogo.png" alt="logo image"></a>	
				</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#home" class="active scroll wow fadeInDownBig" data-wow-delay=".1s">主  頁</a></li>
						<li><a href="#new" class="scroll wow fadeInDownBig" data-wow-delay=".3s">新  品</a></li>
						<li><a href="#about" class="scroll wow fadeInDownBig" data-wow-delay=".5s">关于我们</a></li>
						<li><a href="#catalogue" class="scroll wow fadeInDownBig" data-wow-delay=".7s">产品目录</a></li>
						<li><a href="#contact" class="scroll wow fadeInDownBig" data-wow-delay=".9s">联系我们</a></li>
					</ul>
				</div><!-- navbar-collapse -->
					
				<div class="header-content">
					<h1 class="wow bounceIn" data-wow-delay="0.50s"> Musical Instruments </h1>
					<h2 class="wow fadeInUp" data-wow-delay="0.90s"> Some thing special </h2>
				</div> <!-- Header Content Ends Here -->
				  <div class="clearfix"> </div>			
			</div><!-- container -->
		</nav>
	</div> <!-- Menu Ends -->
				
</div> <!-- Header Ends -->


<div class="icon-info">
	<div class="container">
	
		<div class="col-md-4 icon">
			<div class="info">
				<div class="hi-icon-wrap hi-icon-effect-1 hi-icon-effect-1a ">
					<a href="#set-1" class="hi-icon hi-icon-sofa"> </a>
				</div>
					
				<p class="wow pulse">	
				</p>
			</div>
		</div>
		
		<div class="col-md-4 icon">
			<div class="info">
				<div class="hi-icon-wrap hi-icon-effect-1 hi-icon-effect-1a ">
					<a href="#set-1" class="hi-icon hi-icon-rack"> </a>
				</div>
					
				<p class="wow pulse">	
				</p>
			</div>
		</div>
		
		<div class="col-md-4 icon">
			<div class="info">
				<div class="hi-icon-wrap hi-icon-effect-1 hi-icon-effect-1a ">
					<a href="toLogin" class="hi-icon hi-icon-bed"> </a>
				</div>
					
				<p class="wow pulse">	后台登录<br>
										&nbsp;<br>
										&nbsp;<br>
										&nbsp;<br>
				</p>
			</div>
		</div>

	  <div class="clearfix"> </div>
	</div>
</div> <!-- icon-info -->


<div class="new-arrivals" >
  <div class="container">
	<div class="padding-new" id="new">  
	
		<h3> 产品上新 </h3>
			
		<div class="new-content">
			
			<div class="new-up">
			<%			
				for(int i = 0; i < 2; i++ ){
					Instrument instrument = instrumentList.get(i);
			%>	
				<div class="col-md-6 new-res">
					<div class="col-md-6 new-i wow fadeInLeft animated" data-wow-delay=".5s">
						<div class="new-image hovereffect">
							<img src="<%=basePath + instrument.getInstrumentphoto() %>" style="width:100%;height:100%;" alt="image">
						</div>
					</div>
					<div class="col-md-6 new-t">
						<div class="new-text wow fadeInRight animated" data-wow-delay=".5s">
							<h4><%=instrument.getInstrumentname() %> </h4>
							<p><%=instrument.getBarcode() %></p>
							<p><%=instrument.getInstrumenttype() %></p>
							<p><%=instrument.getCount() %></p>
							<p><%=instrument.getDate() %></p>
						</div>
					</div>
				  <div class="clearfix"> </div>
				</div>
			<%} %>					
			  <div class="clearfix"> </div>
			</div>
			
			<div class="new-down">
			<%			
				for(int i = 2; i < 4; i++ ){
					Instrument instrument = instrumentList.get(i);
			%>	
				<div class="col-md-6 new-res">				
					<div class="col-md-6 new-t">
						<div class="new-text wow fadeInLeft animated"  data-wow-delay=".5s">
							<h4><%=instrument.getInstrumentname() %> </h4>
							<p><%=instrument.getBarcode() %></p>
							<p><%=instrument.getInstrumenttype() %></p>
							<p><%=instrument.getCount() %></p>
							<p><%=instrument.getDate() %></p>
						</div>
					</div>
					<div class="col-md-6 new-i wow fadeInRight animated" data-wow-delay=".5s">
						<div class="new-image hovereffect">
							<img src="<%=basePath + instrument.getInstrumentphoto() %>" style="width:100%;height:100%;" alt="image">
						</div>
					</div>
				  <div class="clearfix"> </div>
				</div>
				<%} %>
				
			  <div class="clearfix"> </div>
			</div>
			
		</div> <!-- content ends here -->

	</div>
  </div>
</div> <!-- new arrivals ends here -->


<div class="about" id="about">
	<div class="container">
		<div class="about-content wow fadeInRight animated" data-wow-delay=".2s">
			<h3> 关于我们 </h3>
			<p>
				<%=request.getAttribute("aboutUs") %>
			</p>
		</div>
	</div>
</div> <!--  about Ends here -->


<div class="catalogue" id="catalogue">
	<div class="container">
		<div class="padding-catalogue">
			<h3>产品目录</h3>
			<div class="sap_tabs">	
		 
				<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
		 
					<ul>
						<%
		            		for(int i=0;i < instrumentTypeList.size();i++) {
								InstrumentType type = instrumentTypeList.get(i);
						%>
							<li class="resp-tab-item"  role="tab"><span><%=type.getInstrumenttypename() %></span></li>
						<% } %>
					</ul>		
					
					<div class="tab-1 resp-tab-content" >    <!-- ********** Chairs Tab **********  -->
						<div class="facts">
							<div class="chairs">
					
								<div class="wrapper">
									<ul class="stage clearfix">

										<li class="col-md-3 scene">
											<div class="frontview" onclick="return true">
												<div class="price-tag"> <img src="./index/images/c1.jpg" alt="image"></div>
													<div class="info">
														<header>
															<h4>Balance Chair</h4>
															<span class="dollar">$</span>
															<span class="rating">356</span>
															<p>Many desktop publishing packages and web model text, and a search Lorem Ipsum has been the industry's standard</p>
														</header>
													</div>
											</div>
										</li>

										<li class="col-md-3 scene">
											<div class="frontview" onclick="return true">
												<div class="price-tag"> 
													<img src="./index/images/c2.jpg" alt="image">
												</div>
												<div class="info">
													<header>
														<h4>Bardic chair</h4>
														<span class="dollar">$</span>
														<span class="rating">219</span>
														<p>Many desktop publishing packages and web model text, and a search Lorem Ipsum has been the industry's standard</p>
													</header>
												</div>
											</div>
										</li>
					
										<li class="col-md-3 scene">
											<div class="frontview" onclick="return true">
												  <div class="price-tag"><img src="./index/images/c3.jpg" alt="image"></div>
												<div class="info">
													<header>
														<h4>Curule chair</h4>
														<span class="dollar">$</span>
														<span class="rating">399</span>
														<p>Many desktop publishing packages and web model text, and a search Lorem Ipsum has been the industry's standard</p>
													</header>
												</div>
											</div>
										</li>
										
										<li class="col-md-3 scene">
											<div class="frontview" onclick="return true">
												  <div class="price-tag"><img src="./index/images/c4.jpg" alt="image"></div>
												<div class="info">
													<header>
														<h4>Valley Chair</h4>
														<span class="dollar">$</span>
														<span class="rating">158</span>
														<p>Many desktop publishing packages and web model text, and a search Lorem Ipsum has been the industry's standard</p>
													</header>
												</div>
											</div>
										</li>
										<li class="col-md-3 scene">
											<div class="frontview" onclick="return true">
												  <div class="price-tag"><img src="./index/images/c5.jpg" alt="image"></div>
												<div class="info">
													<header>
														<h4>Curule chair</h4>
														<span class="dollar">$</span>
														<span class="rating">257</span>
														<p>Many desktop publishing packages and web model text, and a search Lorem Ipsum has been the industry's standard</p>
													</header>
												</div>
											</div>
										</li>
										<li class="col-md-3 scene">
											<div class="frontview" onclick="return true">
												  <div class="price-tag"><img src="./index/images/c6.jpg" alt="image"></div>
												<div class="info">
													<header>
														<h4>Bubble Chair</h4>
														<span class="dollar">$</span>
														<span class="rating">455</span>
														<p>Many desktop publishing packages and web model text, and a search Lorem Ipsum has been the industry's standard</p>
													</header>
												</div>
											</div>
										</li>
														
									</ul>
								</div><!-- /wraspanper -->
							  <div class="clearfix"> </div>
							</div>
						</div>
					</div>	
								  
				</div>
			</div>
		</div>
	</div>  <div class="clearfix"> </div>
</div>		<!-- catalogue Ends here -->

<div class="contact" id="contact">
	<div class="container">
		<div class="padding-contact">
			<h3> 联系我们 </h3>
			<div class="col-md-3 address services wow fadeInLeft animated" data-wow-delay=".6s">
				<h4>地址</h4>
					<address>
						<%=request.getAttribute("address") %><br>
						<%=request.getAttribute("phone") %><br>
						<span>手机 : <%=request.getAttribute("telephone") %></span>
					</address>
			</div>
			
			<div class="col-md-6 c-form wow fadeInUp animated" data-wow-delay=".2s">
				<div class="register">
					<form onsubmit="sendMessage()">	
						<input id="proposer" name="proposer" placeholder="姓名" type="text" required="">
						<input id="Email" name="Email" placeholder="邮箱" type="text" required="">
						<div class="您的建议">
							<input id="message" name="message" placeholder="Message" type="message" required="">
						</div>
						
						<div class="sign-up">
							<input type="submit" id="submit" value="Submit"/>
						</div>
					</form>
				</div>
			</div>
			
			<div class="col-md-3 quick wow fadeInRight animated" data-wow-delay=".6s">
				<h4>快速链接</h4>
					<ul>
						<li><a href="#home" class="active scroll">主頁</a></li>
						<li><a href="#new" class="scroll">新品</a></li>
						<li><a href="#about" class="scroll">关于我们</a></li>
						<li><a href="#catalogue" class="scroll">产品目录</a></li>
					</ul>
					
			</div>
			
		  <div class="clearfix"> </div>
		</div>
		
			<!--start-copyright-->
			<div class="copy-right">
				
					<p>&copy; 2017 Musical Instruments.  版权所有　| 设计者:</p>
					<p>未经授权不得使用</p>
			</div>
			<!--//end-copyright-->
	</div>
</div><!-- Contact Ends here -->

	<!-- Slide-To-Top JavaScript (No-Need-To-Change) -->
		<script type="text/javascript">
			$(document).ready(function() {
			$().UItoTop({ easingType: 'easeOutQuart' });
				});
		</script>
		<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
	<!-- //Slide-To-Top JavaScript -->
<script type="text/javascript">
function sendMessage(){		
	
	var proposer = $('#proposer').val();
	var email = $('#Email').val();
	var message = $('#message').val();
		
	$.ajax({
		url: 'sendMesage',
		type: 'POST',
		data: {'proposer':proposer,'email':email,'message':message},
		dataType: 'JSON',
		success: function(data){
			// result 就是服务器发送回来
			// 的JsonResult对象
			//console.log(data)
			alert(data.result);
			
		}
	});	
}

</script>
</body>
</html>