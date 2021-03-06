<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description"
	content="Magz is a HTML5 & CSS3 magazine template is based on Bootstrap 3.">
<meta name="author" content="Kodinger">
<meta name="keyword"
	content="magz, html5, css3, template, magazine template">
<!-- Shareable -->
<!-- 		<meta property="og:title" content="HTML5 & CSS3 magazine template is based on Bootstrap 3" /> -->
<!-- 		<meta property="og:type" content="article" /> -->
<!-- 		<meta property="og:url" content="http://github.com/nauvalazhar/Magz" /> -->
<!-- 		<meta property="og:image" content="https://raw.githubusercontent.com/nauvalazhar/Magz/master/images/preview.png" /> -->
<title>Magz &mdash; Responsive HTML5 &amp; CSS3 Magazine
	Template</title>
<!-- Bootstrap -->
<link rel="stylesheet" href="../scripts/bootstrap/bootstrap.min.css">
<!-- IonIcons -->
<link rel="stylesheet" href="../scripts/ionicons/css/ionicons.min.css">
<!-- Toast -->
<link rel="stylesheet" href="../scripts/toast/jquery.toast.min.css">
<!-- OwlCarousel -->
<link rel="stylesheet"
	href="../scripts/owlcarousel/dist/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="../scripts/owlcarousel/dist/assets/owl.theme.default.min.css">
<!-- Magnific Popup -->
<link rel="stylesheet"
	href="../scripts/magnific-popup/dist/magnific-popup.css">
<link rel="stylesheet" href="../scripts/sweetalert/dist/sweetalert.css">
<!-- Custom style -->
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/skins/all.css">
<link rel="stylesheet" href="../css/demo.css">
</head>

<body>
	<!-- 헤더파일들어가는 곳 -->
	<jsp:include page="/top.jsp"></jsp:include>
	<!-- 헤더파일들어가는 곳 -->

	<section class="login first grey">
		<div class="container">
			<div class="box-wrapper">
				<div class="box box-border">
					<div class="box-body">
						<h4>Login</h4>
						<form action="/login" method="post" id="join">
							<div class="form-group">
								<label>아이디</label> <input type="text" name="id"
									class="form-control">
							</div>
							<div class="form-group">
								<label class="fw">비밀번호 <a href="forgot.jsp"
									class="pull-right">비밀번호를 잊으셨나요?</a>
								</label> <input type="password" name="password" class="form-control">
							</div>
							<div class="form-group text-right">
								<button class="btn btn-primary btn-block">로그인</button>
							</div>
							<div class="form-group text-center">
								<span class="text-muted">계정이 없으신가요?</span> <a
									href="register.jsp"> 계정 만들기</a>
							</div>
							
<!-- 							소셜 로그인 항목 -->
<!-- 							<div class="title-line">or</div> -->
<!-- 							<a href="#" class="btn btn-social btn-block facebook"><i -->
<!-- 								class="ion-social-facebook"></i> Login with Facebook</a> -->
								
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Start footer -->
	<footer class="footer">
		<div class="row">
			<div class="col-md-12">
				<div class="copyright">
					COPYRIGHT &copy; RUTEL 2021. ALL RIGHT RESERVED.
					<div>
						Made with <i class="ion-heart"></i> by <a
							href="http://kodinger.com">Kodinger</a>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- End Footer -->

	<!-- JS -->
	<script src="/js/jquery.js"></script>
	<script src="/js/jquery.migrate.js"></script>
	<script src="/scripts/bootstrap/bootstrap.min.js"></script>
	<script>
		var $target_end = $(".best-of-the-week");
	</script>
	<script src="/scripts/jquery-number/jquery.number.min.js"></script>
	<script src="/scripts/owlcarousel/dist/owl.carousel.min.js"></script>
	<script src="/scripts/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
	<script src="/scripts/easescroll/jquery.easeScroll.js"></script>
	<script src="/scripts/sweetalert/dist/sweetalert.min.js"></script>
	<script src="/scripts/toast/jquery.toast.min.js"></script>
	<script src="/js/demo.js"></script>
	<script src="/js/e-magz.js"></script>
</body>
</html>