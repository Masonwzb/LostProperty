<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>失物招领首页</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Lost&Found" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script src="js/jquery.min.js"></script>
<!-- //js -->
<!-- cart -->
<script src="js/simpleCart.min.js"></script>
<!-- cart -->
<!-- for bootstrap working -->
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //for bootstrap working -->
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<!-- timer -->
<link rel="stylesheet" href="css/jquery.countdown.css" />
<!-- //timer -->
<!-- animation-effect -->
<link href="css/animate.min.css" rel="stylesheet"> 
<script src="js/wow.min.js"></script>
<script>
 new WOW().init();
</script>
<!-- //animation-effect -->
</head>
	
<body>
<!-- header start-->
<jsp:include page="commons/header.jsp"/>
<!-- //header end-->

<!-- new-timer -->
	<div class="timer">
		<div class="container">
			<div class="timer-grids">
				<div class="col-md-8 timer-grid-left animated wow slideInLeft" data-wow-delay=".5s">
					<h3><a href="products.html">来 带 熊 猫 宝 宝 们 回 家 吧~</a></h3>
					<div class="rating">
						<div class="clearfix"> </div>
					</div>
					<div class="new-collections-grid1-left simpleCart_shelfItem timer-grid-left-price">
						<p><span class="item_price">本站简介</span></p>
						<h4>伴随社会科技的飞速发展，校园生活处于快节奏的环境里，更离不开诸多的卡、证之类的物品，不慎遗失以后，不但补办麻烦，更会让你寸步难行。
						失物招领网是一个专门开展网络寻人找物、失物招领的信息发布平台。致力于为我们嘉园提供方便、快捷的失物招领服务。
						 物归原主，弘扬助人为乐精神  拾金不昧 体现中华民族美德，每一个丢失物品的背后，都有一个着急寻找的身影．．．拒绝冷漠，传递温暖，
						 让爱在你我蔓延。</h4>
					</div>
					<script src="js/script.js"></script>
				</div>
				<div class="col-md-4 timer-grid-right animated wow slideInRight" data-wow-delay=".5s">
					<div class="timer-grid-right1">
						<img src="images/baby.jpg" alt=" " class="img-responsive" />
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
<!-- //new-timer -->


<!-- collections -->
	<div class="new-collections">
		<div class="container">
			<h3 class="animated wow zoomIn" data-wow-delay=".5s">最新失物招领资讯</h3>
			<p class="est animated wow zoomIn" data-wow-delay=".5s">等你来、领回去，本页面仅显示最近一周内失物招领的信息。</p>
				
			<div class="grid_3 grid_5 animated wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="500ms">
				<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
					<ul id="myTab" class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">最新寻物资讯</a></li>
						<li role="presentation"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile">最新招领资讯</a></li>
					</ul>
					<div id="myTabContent" class="tab-content">
					<div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
						    <div class="new-collections-grids">
								<div class="col-md-3 new-collections-grid">
										<div class="new-collections-grid-sub-grids">
											<div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
												<div class="new-collections-grid1-image">
													<div class="new-collections-grid1-image-pos">
														<a href="single.html">查看 详情</a>
													</div>
												</div>
												<h4><a href="single.html">寻物。有捡到请联系我。</a></h4>
												<p><h5><b>中区-寻物启事</b></h5></p>
												<p>黑色卡包。里面有三张银行卡保险卡。几百元现金。身份证（姓名。李慧、性别，女。19961010出生年）。有奶奶照片急寻</p>
												<div class="new-collections-grid1-left simpleCart_shelfItem">
													<span>18年12月19日 </span>
												</div>
											</div> 
										</div>
								</div>
								
								<div class="col-md-3 new-collections-grid">
										<div class="new-collections-grid-sub-grids">
											<div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
												<div class="new-collections-grid1-image">
													<div class="new-collections-grid1-image-pos">
														<a href="single.html">查看 详情</a>
													</div>
												</div>
												<h4><a href="single.html">寻物。有捡到请联系我。</a></h4>
												<p><h5><b>中区-寻物启事</b></h5></p>
												<p>黑色卡包。里面有三张银行卡保险卡。几百元现金。身份证（姓名。李慧、性别，女。19961010出生年）。有奶奶照片急寻</p>
												<div class="new-collections-grid1-left simpleCart_shelfItem">
													<span>18年12月19日 </span>
												</div>
											</div> 
										</div>
								</div>
								<div class="col-md-3 new-collections-grid">
										<div class="new-collections-grid-sub-grids">
											<div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
												<div class="new-collections-grid1-image">
													<div class="new-collections-grid1-image-pos">
														<a href="single.html">查看 详情</a>
													</div>
												</div>
												<h4><a href="single.html">寻物。有捡到请联系我。</a></h4>
												<p><h5><b>中区-寻物启事</b></h5></p>
												<p>黑色卡包。里面有三张银行卡保险卡。几百元现金。身份证（姓名。李慧、性别，女。19961010出生年）。有奶奶照片急寻</p>
												<div class="new-collections-grid1-left simpleCart_shelfItem">
													<span>18年12月19日 </span>
												</div>
											</div> 
										</div>
								</div>
								<div class="col-md-3 new-collections-grid">
										<div class="new-collections-grid-sub-grids">
											<div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
												<div class="new-collections-grid1-image">
													<div class="new-collections-grid1-image-pos">
														<a href="single.html">查看 详情</a>
													</div>
												</div>
												<h4><a href="single.html">寻物。有捡到请联系我。</a></h4>
												<p><h5><b>中区-寻物启事</b></h5></p>
												<p>黑色卡包。里面有三张银行卡保险卡。几百元现金。身份证（姓名。李慧、性别，女。19961010出生年）。有奶奶照片急寻</p>
												<div class="new-collections-grid1-left simpleCart_shelfItem">
													<span>18年12月19日 </span>
												</div>
											</div> 
										</div>
								</div>
								<div class="col-md-3 new-collections-grid">
										<div class="new-collections-grid-sub-grids">
											<div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
												<div class="new-collections-grid1-image">
													<div class="new-collections-grid1-image-pos">
														<a href="single.html">查看 详情</a>
													</div>
												</div>
												<h4><a href="single.html">寻物。有捡到请联系我。</a></h4>
												<p><h5><b>中区-寻物启事</b></h5></p>
												<p>黑色卡包。里面有三张银行卡保险卡。几百元现金。身份证（姓名。李慧、性别，女。19961010出生年）。有奶奶照片急寻</p>
												<div class="new-collections-grid1-left simpleCart_shelfItem">
													<span>18年12月19日 </span>
												</div>
											</div> 
										</div>
								</div>
								<div class="col-md-3 new-collections-grid">
										<div class="new-collections-grid-sub-grids">
											<div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
												<div class="new-collections-grid1-image">
													<div class="new-collections-grid1-image-pos">
														<a href="single.html">查看 详情</a>
													</div>
												</div>
												<h4><a href="single.html">寻物。有捡到请联系我。</a></h4>
												<p><h5><b>中区-寻物启事</b></h5></p>
												<p>黑色卡包。里面有三张银行卡保险卡。几百元现金。身份证（姓名。李慧、性别，女。19961010出生年）。有奶奶照片急寻</p>
												<div class="new-collections-grid1-left simpleCart_shelfItem">
													<span>18年12月19日 </span>
												</div>
											</div> 
										</div>
								</div>
								<div class="col-md-3 new-collections-grid">
										<div class="new-collections-grid-sub-grids">
											<div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
												<div class="new-collections-grid1-image">
													<div class="new-collections-grid1-image-pos">
														<a href="single.html">查看 详情</a>
													</div>
												</div>
												<h4><a href="single.html">寻物。有捡到请联系我。</a></h4>
												<p><h5><b>中区-寻物启事</b></h5></p>
												<p>黑色卡包。里面有三张银行卡保险卡。几百元现金。身份证（姓名。李慧、性别，女。19961010出生年）。有奶奶照片急寻</p>
												<div class="new-collections-grid1-left simpleCart_shelfItem">
													<span>18年12月19日 </span>
												</div>
											</div> 
										</div>
								</div>
								<div class="col-md-3 new-collections-grid">
										<div class="new-collections-grid-sub-grids">
											<div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
												<div class="new-collections-grid1-image">
													<div class="new-collections-grid1-image-pos">
														<a href="single.html">查看 详情</a>
													</div>
												</div>
												<h4><a href="single.html">寻物。有捡到请联系我。</a></h4>
												<p><h5><b>中区-寻物启事</b></h5></p>
												<p>黑色卡包。里面有三张银行卡保险卡。几百元现金。身份证（姓名。李慧、性别，女。19961010出生年）。有奶奶照片急寻</p>
												<div class="new-collections-grid1-left simpleCart_shelfItem">
													<span>18年12月19日 </span>
												</div>
											</div> 
										</div>
								</div>
								
							</div>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
							<div class="new-collections-grids">
								<div class="col-md-3 new-collections-grid">
										<div class="new-collections-grid-sub-grids">
											<div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
												<div class="new-collections-grid1-image">
													<div class="new-collections-grid1-image-pos">
														<a href="single.html">查看 详情</a>
													</div>
												</div>
												<h4><a href="#">寻物。有捡到请联系我。</a></h4>
												<p><h5><b>中区-寻物启事</b></h5></p>
												<p>黑色卡包。里面有三张银行卡保险卡。几百元现金。身份证（姓名。李慧、性别，女。19961010出生年）。有奶奶照片急寻</p>
												<div class="new-collections-grid1-left simpleCart_shelfItem">
													<span>18年12月19日</span>
												</div>
											</div>
										</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
				
			<!-- 自定义开始 -->
				 <div class="new-collections-grids">
								<div class="col-md-3 new-collections-grid">
										<div class="new-collections-grid-sub-grids">
											<div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
												<div class="new-collections-grid1-image">
													<div class="new-collections-grid1-image-pos">
														<a href="single.html">查看 详情</a>
													</div>
												</div>
												<h4><a href="single.html">寻物。有捡到请联系我。</a></h4>
												<p><h5><b>中区-寻物启事</b></h5></p>
												<p>黑色卡包。里面有三张银行卡保险卡。几百元现金。身份证（姓名。李慧、性别，女。19961010出生年）。有奶奶照片急寻</p>
												<div class="new-collections-grid1-left simpleCart_shelfItem">
													<p>18年12月19日 </p>
												</div>
											</div>
										</div>
								</div>
				</div>
			<!-- 自定义结束 -->
		</div>
	</div>
	
	
<!-- //collections -->

<!-- fooer start-->
<jsp:include page="commons/footer.jsp"/>
<!-- //footer end-->
</body>
</html>