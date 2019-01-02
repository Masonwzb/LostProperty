<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>失物招领首页</title>
<!-- link start -->
<jsp:include page="commons/head-link.jsp"/>
<!-- link end -->

<!-- index script start -->
<script type="text/javascript" src="angular_js/js/base_pagination.js"></script>
<script type="text/javascript" src="angular_js/js/controller/baseController.js"></script>
<script type="text/javascript" src="angular_js/js/service/lostService.js"></script>
<script type="text/javascript" src="angular_js/js/controller/lostController.js"></script>
<script type="text/javascript" src="angular_js/js/service/foundService.js"></script>
<script type="text/javascript" src="angular_js/js/controller/foundController.js"></script>
<!-- index script end -->
</head>
	
<body ng-app="portalRest">
<!-- header start-->
<jsp:include page="commons/header.jsp"/>
<!-- //header end-->

<!-- new-timer -->
	<div class="timer">
		<div class="container">
			<div class="timer-grids">
				<div class="col-md-8 timer-grid-left animated wow slideInLeft" data-wow-delay=".5s">
					<h3><a href="#">等你来、领回去~</a></h3>
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
			<p class="est animated wow zoomIn" data-wow-delay=".5s">本页面仅显示最近一周内失物招领的信息，按发布时间排序。</p>
				
			<div class="grid_3 grid_5 animated wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="500ms">
				<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
					<ul id="myTab" class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">最新寻物资讯</a></li>
						<li role="presentation"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile">最新招领资讯</a></li>
					</ul>
					<div id="myTabContent" class="tab-content">
						<div ng-controller="lostController" role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
						
							    <div class="new-collections-grids">
							    <!-- 失物遍历开始 -->
									<div ng-repeat="entity in listNewest" class="custom-div new-collections-grid">
											<div class="new-collections-grid-sub-grids">
												<div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
													<div class="new-collections-grid1-image">
														<div class="new-collections-grid1-image-pos">
															<a href="lost/findOne/{{entity.id}}.html">查看 详情</a>
														</div>
													</div>
													<h4><a href="single.html">{{entity.infotitle}}</a></h4>
													<p><h5><b>{{entity.lostPlace | textLengthSet:true:10:'... '}} -寻物启事</b></h5></p>
													<p class="show-limit">{{entity.description | textLengthSet:true:45:'...'}}</p>
													<div class="new-collections-grid1-left simpleCart_shelfItem">
														<span class="time-type">丢失时间：{{entity.lostTime | date:'yyyy.MM.dd'}}</span>
													</div>
												</div> 
											</div>
									</div>
								<!-- 失物遍历结束 -->
									
								</div>
								
								<div class="clearfix"> </div>
								<!-- 分页处理开始 -->
									<tm-pagination conf="paginationConf"></tm-pagination>
								<!-- 分页处理结束 -->
								
						</div>
						
						<div ng-controller="foundController" role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
		
							<div class="new-collections-grids">
								<!-- 招领遍历开始 -->
									<div ng-repeat="entity in listNewest" class="custom-div new-collections-grid">
											<div class="new-collections-grid-sub-grids">
												<div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
													<div class="new-collections-grid1-image">
														<div class="new-collections-grid1-image-pos">
															<a href="found/findOne/{{entity.id}}.html">查看 详情</a>
														</div>
													</div>
													<h4><a href="single.html">{{entity.infotitle}}</a></h4>
													<p><h5><b>{{entity.foundPlace | textLengthSet:true:10:'... '}} -招领启事</b></h5></p>
													<p class="show-limit">{{entity.description | textLengthSet:true:45:'...'}}</p>
													<div class="new-collections-grid1-left simpleCart_shelfItem">
														<span class="time-type">拾取时间：{{entity.foundTime | date:'yyyy.MM.dd'}}</span>
													</div>
												</div> 
											</div>
									</div>
								<!-- 招领遍历结束 -->
								
							</div>
							<div class="clearfix"> </div>
							<!-- 分页处理开始 -->
									<tm-pagination conf="paginationConf"></tm-pagination>
							<!-- 分页处理结束 -->
							
						</div>
						
					</div>
				</div>
			</div>
			
		</div>
	</div>
	
<!-- //collections -->

<!-- fooer start-->
<jsp:include page="commons/footer.jsp"/>
<!-- //footer end-->
</body>
</html>