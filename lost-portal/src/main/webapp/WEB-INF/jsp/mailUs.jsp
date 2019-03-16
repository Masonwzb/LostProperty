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

</head>
	
<body>
<!-- header start-->
<jsp:include page="commons/header.jsp"/>
<!-- //header end-->

<!-- breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>首页</a></li>
				<li class="active">联系我们</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->

<!-- mail -->
	<div class="mail animated wow zoomIn" data-wow-delay=".5s">
		<div class="container">
			<h3>联系我们</h3>
			<p class="est">如果您对我们有什么更好的建议或者有什么问题，请联系我们！</p>
			<div class="mail-grids">
				<div class="col-md-8 mail-grid-left animated wow slideInLeft" data-wow-delay=".5s">
					<form>
						<input type="text" placeholder="姓名" required="">
						<input type="email" placeholder="邮箱" required="">
						<input type="text" placeholder="主题" required="">
						<textarea type="text" placeholder="内容..." required=""></textarea>
						<input type="submit" value="提交" >
					</form>
				</div>
				<div class="col-md-4 mail-grid-right animated wow slideInRight" data-wow-delay=".5s">
					<div class="mail-grid-right1">
						<img src="images/baby2.jpg" alt=" " class="img-responsive" />
						<h4>Binea Wu <span>管理员</span></h4>
						<ul class="phone-mail">
							<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>手机号码: +1234 567 893</li>
							<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i>邮箱: <a href="mailto:info@example.com">info@example.com</a></li>
						</ul>
						<ul class="social-icons">
							<li><a href="#" class="twitter"></a></li>
						</ul>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
<!-- //mail -->

<!-- fooer start-->
<jsp:include page="commons/footer.jsp"/>
<!-- //footer end-->
</body>
</html>