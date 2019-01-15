<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>失物招领-失物启事详情信息</title>
<!-- link start -->
<jsp:include page="commons/head-link.jsp"/>
<!-- link end -->
</head>
<body>
<!-- header start-->
<jsp:include page="commons/header.jsp"/>
<!-- //header end-->

<!-- breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="${pageContext.request.contextPath}/index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>首页</a></li>
				<li class="active">失物启事 详情信息</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->
<!-- single -->
	<div class="single">
		<div class="container">
			<div class="col-md-4 products-left">
				<div class="categories animated wow slideInUp" data-wow-delay=".5s">
					<h3>文章详情信息</h3>
					<ul class="cate">
						<li><a href="#">信息编号：</a><span>${lost.id }</span></li>
						<li><a href="#">浏览次数：</a><span>${lostTextInfo.pageView}次</span></li>
						<li><a href="#">当前状态：</a><span>寻找中...</span></li>
						<c:if test="${!empty lost.contacts }">
							<li><a href="#">联系人：</a><span>${lost.contacts }</span></li>
						</c:if>
						<c:if test="${!empty lost.tel }">
							<li><a href="#">手机号码：</a><span>${lost.tel }</span></li>
						</c:if>
						<c:if test="${!empty lost.qq }">
							<li><a href="#">QQ号码：</a><span>${lost.qq }</span></li>
						</c:if>
						<li><a href="#">联系邮箱：</a><span>${lost.email }</span></li>
						<c:if test="${!empty lost.address }">
							<li><a href="#">联系地址：</a><span>${lost.address }</span></li>
						</c:if>
						<li><a href="#">发布时间：</a> <span><fmt:formatDate pattern="yyyy年MM月dd日 HH:mm:ss" 
            					value="${lostTextInfo.publishTime}" /></span></li>
					</ul>
				</div>
				<div class="men-position animated wow slideInUp" data-wow-delay=".5s">
					<a href="#"><img src="${pageContext.request.contextPath}/images/hamburger.jpg" alt=" " class="img-responsive" /></a>
					<div class="men-position-pos">
						<!-- 放置文字位置点 -->
					</div>
				</div>
			</div>
			<div class="col-md-8 single-right">
				<div class="col-md-5 single-right-left animated wow slideInUp" data-wow-delay=".5s">
					<div class="men-position animated wow slideInUp" data-wow-delay=".5s">
							<c:choose>
								<c:when test="${!empty lost.images }">
									<a href="#"><img src="${pageContext.request.contextPath}/${lost.images }" alt=" " class="img-responsive" /></a>
								</c:when>
								<c:otherwise>
									<a href="#"><img src="${pageContext.request.contextPath}/images/ocean.jpg" alt=" " class="img-responsive" /></a>
								</c:otherwise>
							</c:choose>
						<div class="men-position-pos">
							<!-- 放置文字位置点 -->
						</div>
					</div>
				</div>
				<div class="col-md-7 single-right-left simpleCart_shelfItem animated wow slideInRight" data-wow-delay=".5s">
					<h3>${lost.infoTitle }</h3>
					<h4><span class="item_price">失物类别：</span> ${lost.categoryName }</h4>
					<div class="detail">
						<h5>丢失地点：  </h5>
						<p>${lost.lostPlace }</p>
					</div>
					<c:if test="${!empty lost.rewards }">
						<div class="detail">
							<h5>悬赏金额：  </h5>
							<p>${lost.rewards } </p>
						</div>
					</c:if>
					<div class="detail">
						<h5>丢失时间：  </h5>
						<p><fmt:formatDate pattern="yyyy年MM月dd日" 
            					value="${lost.lostTime1}" /></p>
					</div>
				</div> 
				<div class="clearfix"> </div>
				<div class="bootstrap-tab animated wow slideInUp" data-wow-delay=".5s">
					<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
						<ul id="myTab" class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">详情描述</a></li>
							<li role="presentation"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile">评论</a></li>
						</ul>
						<div id="myTabContent" class="tab-content">
							<div role="tabpanel" class="tab-pane fade in active bootstrap-tab-text" id="home" aria-labelledby="home-tab">
								<p>${lost.description }</p>
							</div>
							<div role="tabpanel" class="tab-pane fade bootstrap-tab-text" id="profile" aria-labelledby="profile-tab">
								<div class="bootstrap-tab-text-grids">
									<div class="bootstrap-tab-text-grid">
										<div class="bootstrap-tab-text-grid-right">
											<ul>
												<li><a href="#">网友21301231</a></li>
												<li class="time-type2">2018-12-31 15:35:23</li>
											</ul>
											<p>生活总是这样，不能叫人处处都满意。但我们还要热情地活下去。——路遥。再见，2018；你好，2019!</p>
										</div>
										<div class="clearfix"> </div>
									</div>
									<div class="bootstrap-tab-text-grid">
										<div class="bootstrap-tab-text-grid-right">
											<ul>
												<li><a href="#">网友34241543</a></li>
												<li class="time-type2">2018-12-31 12:39:03</li>
											</ul>
											<p>这一年，生活没有想象中那么好，但也没想象中那么糟，2018，最后跟你说一次，早安。</p>
										</div>
										<div class="clearfix"> </div>
									</div>
									<div class="add-review">
										<h4>回复</h4>
										<form>
											<textarea type="text" placeholder="评论信息..." required=""></textarea>
											<input type="submit" value="发送" >
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="clearfix"> </div>
			<!-- 返回上一页 -->
			<div class="checkout-left">	
				<div class="checkout-right-basket animated wow slideInRight" data-wow-delay=".5s">
				<a href="#" onClick="javascript:history.back(-1);"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>返回 上一页</a>
				</div>
				<div class="clearfix"> </div>
			</div>
			
		</div>
	</div>
<!-- //single -->



<!-- fooer start-->
<jsp:include page="commons/footer.jsp"/>
<!-- //footer end-->
</body>
</html>