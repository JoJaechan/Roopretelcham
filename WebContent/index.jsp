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
<!-- <!-- Shareable -->
<!-- <meta property="og:title" -->
<!-- 	content="HTML5 & CSS3 magazine template is based on Bootstrap 3" /> -->
<!-- <meta property="og:type" content="article" /> -->
<!-- <meta property="og:url" content="http://github.com/nauvalazhar/Magz" /> -->
<!-- <meta property="og:image" -->
<!-- 	content="https://raw.githubusercontent.com/nauvalazhar/Magz/master/images/preview.png" /> -->

<title>Magz &mdash; Responsive HTML5 &amp; CSS3 Magazine
	Template</title>
<!-- Bootstrap -->
<link rel="stylesheet" href="scripts/bootstrap/bootstrap.min.css">
<!-- IonIcons -->
<link rel="stylesheet" href="scripts/ionicons/css/ionicons.min.css">
<!-- Toast -->
<link rel="stylesheet" href="scripts/toast/jquery.toast.min.css">
<!-- OwlCarousel -->
<link rel="stylesheet"
	href="scripts/owlcarousel/dist/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="scripts/owlcarousel/dist/assets/owl.theme.default.min.css">
<!-- Magnific Popup -->
<link rel="stylesheet"
	href="scripts/magnific-popup/dist/magnific-popup.css">
<link rel="stylesheet" href="scripts/sweetalert/dist/sweetalert.css">
<!-- Custom style -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/skins/all.css">
<link rel="stylesheet" href="css/demo.css">

<link rel="stylesheet" href="/js/vegas/vegas.min.css">
</head>
<body >
	<!-- 헤더파일들어가는 곳 -->
	<div >
		<header class="primary" >
			<div class="firstbar" id="ShowSlideShowHere">
				<div class="container" >
					<div class="row"   >
						<div class="col-md-3 col-sm-12" >
							<div class="brand">
								<!-- 									<img src="images/logo.png" alt="Magz Logo"> -->
								<h2>
									<a href="/index.jsp">Roopretelcham </a>
								</h2>
							</div>
						</div>

						<div class="col-md-4 col-sm-12" >
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
						<%
						// String id = 세션값 가져와서 변수에 저장
						String id = (String) session.getAttribute("id");
						//세션값 없으면 로그인/가입 표시
						if (id == null) {
						%>
						<div class="col-md-3 col-sm-12 text-right">
							<ul class="nav-icons">
								<li><a href="/member/register.jsp"><i
										class="ion-person-add"></i>
										<div>회원 가입</div></a></li>
								<li><a href="/member/login.jsp"><i class="ion-person"></i>
										<div>로그인</div></a></li>
							</ul>
						</div>
						<%
						} else {
						%>
						<div class="col-md-3 col-sm-12 text-right">
							<ul class="nav-icons">
								<li><%=id%>님 |</li>
								<!-- 							<li><a href="#"><i class="icon ion-person"></i> 회원정보수정</a></li> -->
								<li><a href="logout"><i class="icon ion-log-out"></i>
										로그아웃</a></li>
							</ul>
						</div>
						<%
						}
						%>


					</div>
				</div>
			</div>

			

			<!-- Start nav -->
			<nav class="menu" >
				<div class="container">
					<div class="brand">
						<!-- 					<a href="#"> <img src="images/logo.png" alt="Magz Logo"> -->
						<!-- 					</a> -->
						<h5>
							<a href="/index.jsp"><sub>Roopretelcham</sub> </a>
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
							<li class="for-tablet nav-title"><a>메뉴</a></li>
							<li class="for-tablet"><a href="/member/login.jsp">로그인</a></li>
							<li class="for-tablet"><a href="/member/register.jsp">회원
									가입</a></li>
							<li><a href="/community/community.jsp">커뮤니티</a></li>
							<li><a href="/gallery/gallery.jsp">갤러리</a></li>
							<li><a href="/download/download.jsp">자료실</a></li>

							<!-- 						<li class="dropdown magz-dropdown"><a href="category.jsp">커뮤니티 -->
							<!-- 								<i class="ion-ios-arrow-right"></i> -->
							<!-- 						</a> -->
							<!-- 							<ul class="dropdown-menu"> -->
							<!-- 								<li><a href="search.jsp">여러 이야기</a></li> -->
							<!-- 								<li><a href="contact.jsp">Contact</a></li> -->
							<!-- 								<li class="dropdown magz-dropdown"><a href="#">Error <i -->
							<!-- 										class="ion-ios-arrow-right"></i></a> -->
							<!-- 									<ul class="dropdown-menu"> -->
							<!-- 										<li><a href="403.jsp">403</a></li> -->
							<!-- 										<li><a href="404.jsp">404</a></li> -->
							<!-- 										<li><a href="500.jsp">500</a></li> -->
							<!-- 										<li><a href="503.jsp">503</a></li> -->
							<!-- 									</ul></li> -->
							<!-- 							</ul></li> -->
							<%
							if (id != null) {
							%>
							<li class="dropdown magz-dropdown"><a href="#">회원 정보 관리
									<i class="ion-ios-arrow-right"></i>
							</a>
								<ul class="dropdown-menu">
									<li><a href="member/member_update.jsp"><i
											class="icon ion-person"></i> 회원 정보 수정</a></li>
									<!-- 								<li><a href="#"><i class="icon ion-heart"></i> 작성 글 보기</a></li> -->
									<li><a href="#"><i class="icon ion-chatbox"></i> 작성 글
											보기</a></li>
									<!-- 								<li><a href="#"><i class="icon ion-key"></i> 비밀번호 분실</a></li> -->
									<!-- 								<li><a href="#"><i class="icon ion-settings"></i> -->
									<!-- 										Settings</a></li> -->
									<li class="divider"></li>

									<!-- 								<li><a href="logout"><i class="icon ion-log-out"></i> -->
									<!-- 										로그아웃</a></li> -->

								</ul></li>
							<%
							}
							%>
						</ul>
					</div>
				</div>
			</nav>
			<!-- End nav -->
		</header>
	</div>	
	<!-- 헤더파일들어가는 곳 -->


	<section class="home">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="line">
						<div>갤러리</div>
					</div>

					<div class="row">
						<div class="col-md-4 col-sm-6 col-xs-12">
							<div class="row">

								<article class="article col-md-12">
									<div class="inner">
										<figure>
											<a href="single.jsp"> <img src="images/news/img10.jpg"
												alt="Sample Article">
											</a>
										</figure>
										<div class="padding">
											<div class="detail">
												<div class="time">December 10, 2016</div>
												<div class="category">
													<a href="category.jsp">Healthy</a>
												</div>
											</div>
											<h2>
												<a href="single.jsp">1행 첫번째 글</a>
											</h2>
											<!-- 											<p>Lorem ipsum dolor sit amet, consectetur adipiscing -->
											<!-- 												elit, sed do eiusmod tempor incididunt ut labore et dolore -->
											<!-- 												magna aliqua. Ut enim ad minim veniam.</p> -->
											<footer>
												<a href="#" class="love"><i
													class="ion-android-favorite-outline"></i>
													<div>1263</div></a> <a class="btn btn-primary more"
													href="single.jsp">
													<div>More</div>
													<div>
														<i class="ion-ios-arrow-thin-right"></i>
													</div>
												</a>
											</footer>
										</div>
									</div>
								</article>

								<article class="article col-md-12">
									<div class="inner">
										<figure>
											<a href="single.jsp"> <img src="images/news/img06.jpg"
												alt="Sample Article">
											</a>
										</figure>
										<div class="padding">
											<div class="detail">
												<div class="time">December 22, 2016</div>
												<div class="category">
													<a href="category.jsp">Healthy</a>
												</div>
											</div>
											<h2>
												<a href="single.jsp">2행 첫번째 글</a>
											</h2>
											<!-- 											<p>Maecenas accumsan tortor ut velit pharetra mollis. -->
											<!-- 												Proin eu nisl et arcu iaculis placerat sollicitudin ut est. -->
											<!-- 												In fringilla dui dui.</p> -->
											<footer>
												<a href="#" class="love"><i
													class="ion-android-favorite-outline"></i>
													<div>327</div></a> <a class="btn btn-primary more"
													href="single.jsp">
													<div>More</div>
													<div>
														<i class="ion-ios-arrow-thin-right"></i>
													</div>
												</a>
											</footer>
										</div>
									</div>
								</article>

							</div>
						</div>



						<div class="col-md-4 col-sm-6 col-xs-12">
							<div class="row">

								<article class="article col-md-12">
									<div class="inner">
										<figure>
											<a href="single.jsp"> <img src="images/news/img05.jpg"
												alt="Sample Article">
											</a>
										</figure>
										<div class="padding">
											<div class="detail">
												<div class="time">December 09, 2016</div>
												<div class="category">
													<a href="category.jsp">Lifestyle</a>
												</div>
											</div>
											<h2>
												<a href="single.jsp">1행 2번째 글</a>
											</h2>
											<!-- 											<p>Vivamus in efficitur mi. Nullam semper justo ut elit -->
											<!-- 												lacinia lacinia. Class aptent taciti sociosqu ad litora -->
											<!-- 												torquent per conubia nostra.</p> -->
											<footer>
												<a href="#" class="love"><i
													class="ion-android-favorite-outline"></i>
													<div>1083</div></a> <a class="btn btn-primary more"
													href="single.jsp">
													<div>More</div>
													<div>
														<i class="ion-ios-arrow-thin-right"></i>
													</div>
												</a>
											</footer>
										</div>
									</div>
								</article>

								<article class="article col-md-12">
									<div class="inner">
										<figure>
											<a href="single.jsp"> <img src="images/news/img07.jpg"
												alt="Sample Article">
											</a>
										</figure>
										<div class="padding">
											<div class="detail">
												<div class="time">December 21, 2016</div>
												<div class="category">
													<a href="category.jsp">Sport</a>
												</div>
											</div>
											<h2>
												<a href="single.jsp">2행 2번째 글</a>
											</h2>
											<!-- 											<p>Pellentesque habitant morbi tristique senectus et -->
											<!-- 												netus et malesuada fames ac turpis egestas. Mauris elementum -->
											<!-- 												libero at pharetra auctor.</p> -->
											<footer>
												<a href="#" class="love"><i
													class="ion-android-favorite-outline"></i>
													<div>980</div></a> <a class="btn btn-primary more"
													href="single.jsp">
													<div>More</div>
													<div>
														<i class="ion-ios-arrow-thin-right"></i>
													</div>
												</a>
											</footer>
										</div>
									</div>
								</article>


							</div>
						</div>

						<!-- 						3행 -->

						<div class="col-md-4 col-sm-6 col-xs-12">
							<div class="row">

								<article class="article col-md-12">
									<div class="inner">
										<figure>
											<a href="single.jsp"> <img src="images/news/img05.jpg"
												alt="Sample Article">
											</a>
										</figure>
										<div class="padding">
											<div class="detail">
												<div class="time">December 09, 2016</div>
												<div class="category">
													<a href="category.jsp">Lifestyle</a>
												</div>
											</div>
											<h2>
												<a href="single.jsp">1행 3번째 글</a>
											</h2>
											<!-- 											<p>Vivamus in efficitur mi. Nullam semper justo ut elit -->
											<!-- 												lacinia lacinia. Class aptent taciti sociosqu ad litora -->
											<!-- 												torquent per conubia nostra.</p> -->
											<footer>
												<a href="#" class="love"><i
													class="ion-android-favorite-outline"></i>
													<div>1083</div></a> <a class="btn btn-primary more"
													href="single.jsp">
													<div>More</div>
													<div>
														<i class="ion-ios-arrow-thin-right"></i>
													</div>
												</a>
											</footer>
										</div>
									</div>
								</article>

								<article class="article col-md-12">
									<div class="inner">
										<figure>
											<a href="single.jsp"> <img src="images/news/img07.jpg"
												alt="Sample Article">
											</a>
										</figure>
										<div class="padding">
											<div class="detail">
												<div class="time">December 21, 2016</div>
												<div class="category">
													<a href="category.jsp">Sport</a>
												</div>
											</div>
											<h2>
												<a href="single.jsp">2행 3번째 글</a>
											</h2>
											<!-- 											<p>Pellentesque habitant morbi tristique senectus et -->
											<!-- 												netus et malesuada fames ac turpis egestas. Mauris elementum -->
											<!-- 												libero at pharetra auctor.</p> -->
											<footer>
												<a href="#" class="love"><i
													class="ion-android-favorite-outline"></i>
													<div>980</div></a> <a class="btn btn-primary more"
													href="single.jsp">
													<div>More</div>
													<div>
														<i class="ion-ios-arrow-thin-right"></i>
													</div>
												</a>
											</footer>
										</div>
									</div>
								</article>


							</div>
						</div>

						<!-- 						3행 끝 -->



					</div>

				</div>
			</div>
		</div>
	</section>
	<!-- 					갤러리 끝 -->


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
	
<!-- 	<script src="http://code.jquery.com/jquery.min.js"></script> -->
<script src="/js/vegas/vegas.min.js"></script>
	 
	<script>
	$(document).ready(function() 
			  { 
			    var imagecollection = [ 
			    	{src: 'images/bg.jpg'}, 
			        {src: 'images/bg2.gif'},
			        {src: 'images/bg3.gif'},
			    ]; 

			    $("#ShowSlideShowHere").vegas({ 
			        slides: imagecollection, 
			        transition: 'fade', 
			        preloadImage: true, 
			        timer: true, 
			        shuffle: true,
			        delay: 5000, 
			        animation: 'kenburns', 
			        cover: true 
			    }); 
			  });
</script>
	
</body>
</html>