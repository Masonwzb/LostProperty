<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>changeForm page</title>
<!-- link start -->
<jsp:include page="commons/head-link.jsp"/>
<!-- link end -->

<!-- lost script start -->
<script type="text/javascript" src="angular_js/js/base_uibootstrap.js"></script>
<script type="text/javascript" src="angular_js/js/controller/baseController.js"></script>
<script type="text/javascript" src="angular_js/js/service/addLostService.js"></script>
<script type="text/javascript" src="angular_js/js/controller/addLostController.js"></script>
<!--图片上传 开始-->
 <link href="fileUpload/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" crossorigin="anonymous">
 <link href="fileUpload/themes/explorer-fas/theme.css" media="all" rel="stylesheet" type="text/css"/>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
 <script src="fileUpload/js/plugins/sortable.js" type="text/javascript"></script>
 <script src="fileUpload/js/fileinput.js" type="text/javascript"></script>
 <script src="fileUpload/js/locales/zh.js" type="text/javascript"></script>
 <script src="fileUpload/themes/fas/theme.js" type="text/javascript"></script>
 <script src="fileUpload/themes/explorer-fas/theme.js" type="text/javascript"></script>
<!--图片上传结束 -->
<!-- lost script end -->
</head>
<body ng-app="portalRest" ng-controller="addLostController">
<!-- header start-->
<jsp:include page="commons/header.jsp"/>
<!-- //header end-->

<!-- breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>首页</a></li>
				<li class="active">寻物信息发布</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->

<!-- register -->
	<div class="register">
		<div class="container">
			<h3 class="animated wow zoomIn" data-wow-delay=".5s">寻物信息发布</h3>
			<p class="est animated wow zoomIn" data-wow-delay=".5s">请填写信息，<span class="glyphicon glyphicon-star"></span>为必填项，其他选填。</p>
			<div class="add-lostAndFound">
				<h5 class="animated wow slideInUp" data-wow-delay=".5s"></h5>
				<form class="animated wow slideInUp" data-wow-delay=".5s">
					

					<div class="input-group animated wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="500ms">
						<span class="input-group-addon" id="basic-addon1"><i class=" glyphicon glyphicon-star"></i></span>
						<input type="text" ng-model="entity.infotitle" id="lalala" class="form-control" placeholder="信息标题" aria-describedby="basic-addon1" required="">
					</div>
	
					<div class="input-group animated wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="500ms">
						<span class="input-group-addon" id="basic-addon1"><i class=" glyphicon glyphicon-star"></i></span>
						<input type="text" ng-model="entity.lostPlace" class="form-control" placeholder="丢失地点" aria-describedby="basic-addon1" required="">
					</div>
									
					<div class="form-inline">
						<div class="input-group animated wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="500ms">
							<span class="input-group-addon" id="basic-addon1"><i class=" glyphicon glyphicon-star"></i></span>
							<select class="form-control" required="" ng-model="entity.categoryId">
	                            <option value="">请选择失物类别</option>
	                            <option ng-repeat="categoryEntity in categoryList" value="{{categoryEntity.id}}">{{categoryEntity.categoryName}}</option>
	                        </select>
						</div>
					</div>
					
					<div class="input-group animated wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="500ms">
						<span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-picture"></i> 选择图片</span>
			        	<div class="file-loading">
							<input id="imagesFile" name="imagesFile" type="file" multiple>
						</div>
						<div id="errorBlocks" class="help-block"></div>
						<input type="text" ng-model="entity.images" hidden name="image"/>
					</div>
					
					<div class="form-inline">
						
						<div class="input-group animated wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="500ms">
							<p class="input-group">
								<span class="input-group-addon" id="basic-addon1"><i class=" glyphicon glyphicon-star"></i></span>
				                <input class="form-control" uib-datepicker-popup="{{format}}" ng-model="entity.lostTime" is-open="pop1.opened" 
				                     placeholder="请选择丢失日期" required="" popup-placement="top" close-text="关闭" clear-text="清空" current-text="今天" alt-input-formats="altInputFormats" datepicker-options="datepickerOptions1"/>
				                <span class="input-group-btn">
				                    <button class="btn btn-default" ng-click="openpop1()"><i class="glyphicon  glyphicon-calendar"></i></button>
				                </span>
				            </p>
						</div>
					
					</div>
					
					<div class="form-inline">				
						<div class="input-group animated wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="500ms">
							<span class="input-group-addon" id="basic-addon1">$</span>
							<input type="text" ng-model="entity.rewards" class="form-control" placeholder="悬赏金额" aria-describedby="basic-addon1">
							<span class="input-group-addon">不填则默认为空。</span>
						</div>			
					</div>
					
					<div class="form-inline">
											
						<div class="input-group animated wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="500ms">
							<span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-user"></i></span>
							<input type="text" ng-model="entity.contacts" class="form-control" placeholder="联系人" aria-describedby="basic-addon1">
						</div>
					
						<div class="input-group animated wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="500ms">
							<span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-earphone"></i></span>
							<input type="text" ng-model="entity.tel" class="form-control" placeholder="手机号码" aria-describedby="basic-addon1">
						</div>
					
					</div>
					
					<div class="form-inline">
						<div class="input-group animated wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="500ms">
							<span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-star"></i></span>
							<input type="email" ng-model="entity.email" class="form-control" required="" placeholder="联系邮箱" aria-describedby="basic-addon1">
						</div>
						
						<div class="input-group animated wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="500ms">
							<span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-plus"></i></span>
							<input type="text" ng-model="entity.QQ" class="form-control" placeholder="QQ号码" aria-describedby="basic-addon1">
						</div>					
					</div>	
					
					<div class="input-group animated wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="500ms">
						<span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-map-marker"></i></span>
						<input type="text" ng-model="entity.address" class="form-control" placeholder="联系地址" aria-describedby="basic-addon1">
					</div>
											
					<div class="input-group animated wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="500ms">
						<span class="input-group-addon" id="basic-addon1"><i class=" glyphicon glyphicon-star"></i></span>
						<textarea type="text"  style="height:100px" ng-model="entity.description" class="form-control" required="" placeholder="详情描述"></textarea>
					</div>
					
					<input type="submit" ng-click="add()" value="发布">
					
					<input type="reset" onclick="window.location.reload();" value="重置">
				</form>
			</div>
			
			<div class="register-home animated wow slideInUp" data-wow-delay=".5s">
				<a href="index.html">Home</a>
			</div>
			
		</div>
	</div>
<!-- //register -->
<script>
    $(document).ready(function () {
    	$("#imagesFile").fileinput({
	 		theme: 'fas',
	 		language: 'zh',
	 		showCaption: false, 
	 		dropZoneEnabled: false,
	 		showUpload: true,
	 		showRemove: false,
	 		uploadUrl: '../pic/upload.action',
	 		elErrorContainer: '#errorBlocks',
	 		allowedFileExtensions: ['jpg', 'png', 'gif','jpeg','webp'],
	 		fileActionSettings:{
	 			showRemove: true,
			    showUpload: true,
			    showZoom: false,
			    showDrag: true,
	 		}
	 	}).on('fileerror', function(event, data) {
        			layer.msg('上传失败', {icon: 2,time:1200});
				}).on('fileuploaded', function(event, data) {
						//设置image路径
						$("input[name='image']").val(data.response.url).trigger('change');
						layer.msg('上传成功', {icon: 1,time:1200});
         			});
    });

</script>

<!-- fooer start-->
<jsp:include page="commons/footer.jsp"/>
<!-- //footer end-->
</body>
</html>