<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header -->

	<div class="header">
		<div class="container">
			<div class="header-grid">
				<div class="header-grid-left animated wow slideInLeft" data-wow-delay=".5s">
					<ul>
						<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a href="mailto:info@example.com">@example.com</a></li>
						<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>+1234 567 567</li>
						<li><i class="glyphicon glyphicon-log-in" aria-hidden="true"></i><a href="login.html">登录</a></li>
						<li><i class="glyphicon glyphicon-book" aria-hidden="true"></i><a href="register.html">注册</a></li>
					</ul>
				</div>
				<div class="header-grid-right animated wow slideInRight" data-wow-delay=".5s">
					<ul class="social-icons">
						<!--<li><a href="#" class="facebook"></a></li>-->
						<li><a href="#" class="twitter"></a></li>
						<!--<li><a href="#" class="g"></a></li>-->
						<!--<li><a href="#" class="instagram"></a></li>-->
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="logo-nav">
				<div class="logo-nav-left animated wow zoomIn" data-wow-delay=".5s">
					<h1><a href="index.html">嘉园 失物招领<span>Lost&Found</span></a></h1>
				</div>
				<div class="logo-nav-left1">
					<nav class="navbar navbar-default">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header nav_2">
						<button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
					</div> 
					<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
						<ul class="nav navbar-nav">
							<li id="index" class=""><a href="index.html" class="">首页</a></li>	
							<!-- Mega Menu -->
							<li id="lost" class=""><a href="lost.html" class="">寻物 </a></li>
							<li id="found" class=""><a href="found.html" class="">招领 </a></li>
							<li id="short-codes" class=""><a href="short-codes.html" class="">寻&nbsp;&nbsp;人<i class="glyphicon glyphicon-heart" aria-hidden="true"></i></a></li>
							<li id="mail" class=""><a href="mail.html" class="">联系 我们</a></li>
						</ul>
					</div>
					</nav>
				</div>
				<div class="logo-nav-right">
					<div class="search-box">
						<div id="sb-search" class="sb-search">
							<form>
								<input class="sb-search-input" placeholder="输入查询信息..." type="search" id="search">
								<input class="sb-search-submit" type="submit" value="">
								<span class="sb-icon-search"> </span>
							</form>
						</div>
					</div>
						<!-- search-scripts -->
						<script src="js/classie.js"></script>
						<script src="js/uisearch.js"></script>
							<script>
								new UISearch( document.getElementById( 'sb-search' ) );
							</script>
						<!-- //search-scripts -->
				</div>
				<div class="header-right">
					<div class="cart box_1">
						<a href="addLost.html">
								<div>
									<button class="btn btn-default">发布->寻物信息</button>
								</div>
						</a>
						<br/>
						<a href="#">
							<div>
								<button class="btn btn-default"><span>发布->招领信息</span></button>
							</div>
						</a>
					</div>	
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	

<!-- 动态导航栏添加active start -->
<script type="text/javascript">
$(function () {

    var li = $("#bs-megadropdown-tabs ul").children("li");

    for (var i = 0; i < li.length; i++) {
    
        var url = window.location.pathname;
        var url = url.replace("/", "");
        if (url.indexOf(li[i].id)!=-1) {
        	li[i].className = "active";
            li[i].firstChild.className = "act";

        } else {
            li[i].firstChild.className = "";
            li[i].className = "";
        }
    }
})
</script>
<!-- 动态导航栏添加active end -->	
<!-- //header -->