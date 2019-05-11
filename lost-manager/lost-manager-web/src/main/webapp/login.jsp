<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>失物招领登录</title>

    <link href="../inspinia/css/bootstrap.min.css" rel="stylesheet">
    <link href="../inspinia/font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="../inspinia/css/animate.css" rel="stylesheet">
    <link href="../inspinia/css/style.css" rel="stylesheet">

<style type="text/css">
/*自定义css 开始*/
.bgImage {
	background:url("../inspinia/img/notebook.jpg") no-repeat center;
}
/*自定义css 结束*/
</style>

</head>

<body class="gray-bg bgImage">

    <div class="middle-box text-center loginscreen animated fadeInDown">
        <div>
            <div>

                <h1 class="logo-name">LOST</h1>

            </div>
            <h3>欢迎登录失物招领后台</h3>
            <p>等你来 领回去</p>
            <!-- onsubmit="return false;" 取消form表单提交响应 -->
            <form id="formlogin" method="post" action="/login">
            	<span style="color: red;">${sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message }</span>
                <div class="form-group">
                    <input type="text" id="loginname" name="username" placeholder="用户名" class="form-control" required="">
                </div>
                <div class="form-group">
                    <input type="password" id="loginpwd" name="password" class="form-control" placeholder="密码" required="">
                </div>
                <button type="submit" id="loginsubmit" class="btn btn-primary full-width">登录</button>

            </form>
            <p class="m-t"> <small>Copyright &copy; 2018-2019</small> </p>
        </div>
    </div>

    <!-- Mainly scripts -->
    <script type="text/javascript" src="../inspinia/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="../inspinia/js/bootstrap.min.js"></script>

	<script type="text/javascript">
	
		/*
		function login(){
			if($("#loginname").val() != "" && $("#loginpwd").val() != ""){
			
				$.post("/user/login.do",$("#formlogin").serialize(),function(data){
					if(data.status == 200){
						window.location = "/login";
					}else{
						$("#loginpwd").val("");
						$("#loginpwd").select();
						$("#msg").show();
					}
				});
					
			}
		}*/
	
	</script>


</body>

</html>
