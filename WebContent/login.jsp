<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="description" content="Magz is a HTML5 & CSS3 magazine template is based on Bootstrap 3.">
		<meta name="author" content="Kodinger">
		<meta name="keyword" content="magz, html5, css3, template, magazine template">
		<!-- Shareable -->
<!-- 		<meta property="og:title" content="HTML5 & CSS3 magazine template is based on Bootstrap 3" /> -->
<!-- 		<meta property="og:type" content="article" /> -->
<!-- 		<meta property="og:url" content="http://github.com/nauvalazhar/Magz" /> -->
<!-- 		<meta property="og:image" content="https://raw.githubusercontent.com/nauvalazhar/Magz/master/images/preview.png" /> -->
		<title>Magz &mdash; Responsive HTML5 &amp; CSS3 Magazine Template</title>
		<!-- Bootstrap -->
		<link rel="stylesheet" href="scripts/bootstrap/bootstrap.min.css">
		<!-- IonIcons -->
		<link rel="stylesheet" href="scripts/ionicons/css/ionicons.min.css">
		<!-- Toast -->
		<link rel="stylesheet" href="scripts/toast/jquery.toast.min.css">
		<!-- OwlCarousel -->
		<link rel="stylesheet" href="scripts/owlcarousel/dist/assets/owl.carousel.min.css">
		<link rel="stylesheet" href="scripts/owlcarousel/dist/assets/owl.theme.default.min.css">
		<!-- Magnific Popup -->
		<link rel="stylesheet" href="scripts/magnific-popup/dist/magnific-popup.css">
		<link rel="stylesheet" href="scripts/sweetalert/dist/sweetalert.css">
		<!-- Custom style -->
		<link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/skins/all.css">
		<link rel="stylesheet" href="css/demo.css">
	</head>

	<body>
		<header class="primary">
		<div class="firstbar">
			<div class="container">
				<div class="row">
					<div class="col-md-3 col-sm-12">
						<div class="brand">
							<!-- 									<img src="images/logo.png" alt="Magz Logo"> -->
							<h2>
								<a href="index.html">Roopretelcham </a>
							</h2>
						</div>
					</div>

					<div class="col-md-4 col-sm-12">
						<form class="search" autocomplete="off">
							<div class="form-group">
								<div class="input-group">
									<input type="text" name="q" class="form-control"
										placeholder="Type something here">
									<div class="input-group-btn">
										<button class="btn btn-primary">
											<i class="ion-search"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="help-block">
								<div>Popular:</div>
								<ul>
									<li><a href="#">HTML5</a></li>
									<li><a href="#">CSS3</a></li>
									<li><a href="#">Bootstrap 3</a></li>
									<li><a href="#">jQuery</a></li>
									<li><a href="#">AnguarJS</a></li>
								</ul>
							</div>
						</form>
					</div>

					<div class="col-md-3 col-sm-12 text-right">
						<ul class="nav-icons">
							<li><a href="register.html"><i class="ion-person-add"></i>
									<div>회원 가입</div></a></li>
							<li><a href="login.html"><i class="ion-person"></i>
									<div>로그인</div></a></li>
						</ul>
					</div>

				</div>
			</div>
		</div>

		<!-- Start nav -->
		<nav class="menu">
			<div class="container">
				<div class="brand">
					<!-- 					<a href="#"> <img src="images/logo.png" alt="Magz Logo"> -->
					<!-- 					</a> -->
					<h5 >
						<a href="index.html"><sub>Roopretelcham</sub> </a>
					</h5>
				</div>
				<div class="mobile-toggle">
					<a href="#" data-toggle="menu" data-target="#menu-list"><i
						class="ion-navicon-round"></i></a>
				</div>
				<div class="mobile-toggle">
					<a href="#" data-toggle="sidebar" data-target="#sidebar"><i
						class="ion-ios-arrow-left"></i></a>
				</div>
				<div id="menu-list">
					<ul class="nav-list">
						<li class="for-tablet nav-title"><a>Menu</a></li>
						<li class="for-tablet"><a href="login.html">Login</a></li>
						<li class="for-tablet"><a href="register.html">Register</a></li>
						<li><a href="community.html">커뮤니티</a></li>
						<li><a href="gallery.html">갤러리</a></li>
						<li><a href="download.html">자료실</a></li>

						<!-- 						<li class="dropdown magz-dropdown"><a href="category.html">커뮤니티 -->
						<!-- 								<i class="ion-ios-arrow-right"></i> -->
						<!-- 						</a> -->
						<!-- 							<ul class="dropdown-menu"> -->
						<!-- 								<li><a href="search.html">여러 이야기</a></li> -->
						<!-- 								<li><a href="contact.html">Contact</a></li> -->
						<!-- 								<li class="dropdown magz-dropdown"><a href="#">Error <i -->
						<!-- 										class="ion-ios-arrow-right"></i></a> -->
						<!-- 									<ul class="dropdown-menu"> -->
						<!-- 										<li><a href="403.html">403</a></li> -->
						<!-- 										<li><a href="404.html">404</a></li> -->
						<!-- 										<li><a href="500.html">500</a></li> -->
						<!-- 										<li><a href="503.html">503</a></li> -->
						<!-- 									</ul></li> -->
						<!-- 							</ul></li> -->

						<li class="dropdown magz-dropdown"><a href="#">회원 정보 보기 <i
								class="ion-ios-arrow-right"></i>
						</a>
							<ul class="dropdown-menu">
								<li><a href="#"><i class="icon ion-person"></i> 내 정보 보기</a></li>
								<li><a href="#"><i class="icon ion-heart"></i> 작성 글 보기</a></li>
								<li><a href="#"><i class="icon ion-chatbox"></i> 작성
										댓글목록</a></li>
								<li><a href="#"><i class="icon ion-key"></i> 비밀번호 변경</a></li>
								<!-- 								<li><a href="#"><i class="icon ion-settings"></i> -->
								<!-- 										Settings</a></li> -->
								<li class="divider"></li>
								<li><a href="#"><i class="icon ion-log-out"></i> 로그아웃</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- End nav -->
	</header>

		<section class="login first grey">
			<div class="container">
				<div class="box-wrapper">				
					<div class="box box-border">
						<div class="box-body">
							<h4>Login</h4>
							<form  action="login" method="post" id="join">
								<div class="form-group">
									<label>아이디</label>
									<input type="text" name="id" class="form-control">
								</div>
								<div class="form-group">
									<label class="fw">비밀번호
										<a href="forgot.html" class="pull-right">비밀번호를 잊으셨나요?</a>
									</label>
									<input type="password" name="password" class="form-control">
								</div>
								<div class="form-group text-right">
									<button class="btn btn-primary btn-block">로그인</button>
								</div>
								<div class="form-group text-center">
									<span class="text-muted">계정이 없으신가요?</span> <a href="register.html">
									계정 만들기</a>
								</div>
								<div class="title-line">
									or
								</div>
              	<a href="#" class="btn btn-social btn-block facebook"><i class="ion-social-facebook"></i> Login with Facebook</a>
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
	<script src="js/jquery.js"></script>
	<script src="js/jquery.migrate.js"></script>
	<script src="scripts/bootstrap/bootstrap.min.js"></script>
	<script>
		var $target_end = $(".best-of-the-week");
	</script>
	<script src="scripts/jquery-number/jquery.number.min.js"></script>
	<script src="scripts/owlcarousel/dist/owl.carousel.min.js"></script>
	<script src="scripts/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
	<script src="scripts/easescroll/jquery.easeScroll.js"></script>
	<script src="scripts/sweetalert/dist/sweetalert.min.js"></script>
	<script src="scripts/toast/jquery.toast.min.js"></script>
	<script src="js/demo.js"></script>
	<script src="js/e-magz.js"></script>
</body>
</html>