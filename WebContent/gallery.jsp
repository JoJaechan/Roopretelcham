<%@page import="file.FileBean"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
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

<<<<<<< HEAD
<title>Roopretelcham</title>
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
</head>

<body class="skin-orange">
	<!-- 헤더파일들어가는 곳 -->
	<jsp:include page="top.jsp"></jsp:include>
	<!-- 헤더파일들어가는 곳 -->

	<section class="home">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="row">
						<div class="col-md-12">
							<ol class="breadcrumb">
								<li><a href="#">메인</a></li>
								<li class="active">갤러리</li>
							</ol>
						</div>
					</div>

					<div class="col-md-2">
						<button class="btn btn-primary btn-block"
							onclick="location.href='WriteFormGallery.jsp'">글쓰기</button>
					</div>
					<div class="line"></div>
					<div class="row">
						<%
						BoardDAO boardDAO = new BoardDAO();
						List<BoardBean> bbList = boardDAO.selectBoard("board_gallery");
						%>
						<div class="row">
							<!-- 갤러리 표시 시작 -->
							<%
							for (BoardBean b : bbList) {
								FileBean fb = boardDAO.getArticleThumbFile(b.getNum(), "file_gallery");
								String thumbPath = fb.getFile_name();
								System.out.println(thumbPath);
							%>
							<!-- 						<div class="col-md-4 col-sm-6 col-xs-12"> -->
							<div class="col">

								<article class="article col-md-4">
									<div class="inner">
										<figure>
											<a href="content_gallery.jsp?num=<%=b.getNum()%>"> <!-- 											<img src="images/news/img10.jpg" alt="Sample Article"> -->
												<img
												src="${pageContext.request.contextPath}/upload/<%=thumbPath%>" />
											</a>
										</figure>

										<div class="padding">
											<div class="detail">
												<div class="time"><%=b.getDate()%></div>
												<div class="category">
													<a href="#"><%=b.getName() %></a>
												</div>
											</div>
											<h2>
												<a href="#"><%=b.getSubject()%></a>
											</h2>
											<!-- 											<p>Lorem ipsum dolor sit amet, consectetur adipiscing -->
											<!-- 												elit, sed do eiusmod tempor incididunt ut labore et dolore -->
											<!-- 												magna aliqua. Ut enim ad minim veniam.</p> -->
											<footer>
												<a href="#" class="love"><i
													class="ion-android-favorite-outline"></i>
													<div><%=b.getReadcount()%></div></a> <a
													class="btn btn-primary more" href="#">
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
							<!-- 						</div> -->
							<%
							}
							%>

						</div>

					</div>
				</div>
			</div>
=======
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
</head>

<body class="skin-orange">
	<header class="primary">
		<div class="firstbar">
			<div class="container">
				<div class="row">
					<div class="col-md-3 col-sm-12">
						<div class="brand">
							<!-- 									<img src="images/logo.png" alt="Magz Logo"> -->
							<h2>
								<a href="index.jsp">Roopretelcham </a>
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
							<li><a href="register.jsp"><i class="ion-person-add"></i>
									<div>회원 가입</div></a></li>
							<li><a href="login.jsp"><i class="ion-person"></i>
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
					<h5>
						<a href="index.jsp"><sub>Roopretelcham</sub> </a>
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
						<li class="for-tablet"><a href="login.jsp">Login</a></li>
						<li class="for-tablet"><a href="register.jsp">Register</a></li>
						<li><a href="community.jsp">커뮤니티</a></li>
						<li><a href="gallery.jsp">갤러리</a></li>
						<li><a href="download.jsp">자료실</a></li>

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

	<section class="home">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="line">
						<div>갤러리</div>
					</div>

					<%
					BoardDAO boardDAO = new BoardDAO();
					List<BoardBean> bbList = boardDAO.selectBoard("board_gallery");
					%>
					<div class="row">
						<!-- 갤러리 표시 시작 -->
						<%
						for (BoardBean b : bbList) {							
							FileBean fb = boardDAO.getArticleThumbFile(b.getNum(), "file_gallery");
							String thumbPath = fb.getFile_name();
							System.out.println(thumbPath);
						%>
						<!-- 						<div class="col-md-4 col-sm-6 col-xs-12"> -->
						<div class="col">
						
							<article class="article col-md-4">
								<div class="inner">

									<figure>
										<a href="#"> <!-- 											<img src="images/news/img10.jpg" alt="Sample Article"> -->
											<img src="${pageContext.request.contextPath}/upload/<%=thumbPath%>" />
										</a>
									</figure>

									<div class="padding">
										<div class="detail">
											<div class="time"><%=b.getDate()%></div>
											<div class="category">
												<a href="category.jsp">Healthy</a>
											</div>
										</div>
										<h2>
											<a href="#"><%=b.getSubject()%></a>
										</h2>
										<!-- 											<p>Lorem ipsum dolor sit amet, consectetur adipiscing -->
										<!-- 												elit, sed do eiusmod tempor incididunt ut labore et dolore -->
										<!-- 												magna aliqua. Ut enim ad minim veniam.</p> -->
										<footer>
											<a href="#" class="love"><i
												class="ion-android-favorite-outline"></i>
												<div>1263</div></a> <a class="btn btn-primary more" href="#">
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
						<!-- 						</div> -->
						<%
						}
						%>


						<!-- 						<div class="col-md-4 col-sm-6 col-xs-12"> -->
						<!-- 							<div class="row"> -->

						<!-- 								<article class="article col-md-12"> -->
						<!-- 									<div class="inner"> -->
						<!-- 										<figure> -->
						<!-- 											<a href="#"> <img src="images/news/img05.jpg" -->
						<!-- 												alt="Sample Article"> -->
						<!-- 											</a> -->
						<!-- 										</figure> -->
						<!-- 										<div class="padding"> -->
						<!-- 											<div class="detail"> -->
						<!-- 												<div class="time">December 09, 2016</div> -->
						<!-- 												<div class="category"> -->
						<!-- 													<a href="category.jsp">Lifestyle</a> -->
						<!-- 												</div> -->
						<!-- 											</div> -->
						<!-- 											<h2> -->
						<!-- 												<a href="#">1행 2번째 글</a> -->
						<!-- 											</h2> -->
						<!-- 																						<p>Vivamus in efficitur mi. Nullam semper justo ut elit -->
						<!-- 																							lacinia lacinia. Class aptent taciti sociosqu ad litora -->
						<!-- 																							torquent per conubia nostra.</p> -->
						<!-- 											<footer> -->
						<!-- 												<a href="#" class="love"><i -->
						<!-- 													class="ion-android-favorite-outline"></i> -->
						<!-- 													<div>1083</div></a> <a class="btn btn-primary more" href="#"> -->
						<!-- 													<div>More</div> -->
						<!-- 													<div> -->
						<!-- 														<i class="ion-ios-arrow-thin-right"></i> -->
						<!-- 													</div> -->
						<!-- 												</a> -->
						<!-- 											</footer> -->
						<!-- 										</div> -->
						<!-- 									</div> -->
						<!-- 								</article> -->

						<!-- 								<article class="article col-md-12"> -->
						<!-- 									<div class="inner"> -->
						<!-- 										<figure> -->
						<!-- 											<a href="#"> <img src="images/news/img07.jpg" -->
						<!-- 												alt="Sample Article"> -->
						<!-- 											</a> -->
						<!-- 										</figure> -->
						<!-- 										<div class="padding"> -->
						<!-- 											<div class="detail"> -->
						<!-- 												<div class="time">December 21, 2016</div> -->
						<!-- 												<div class="category"> -->
						<!-- 													<a href="category.jsp">Sport</a> -->
						<!-- 												</div> -->
						<!-- 											</div> -->
						<!-- 											<h2> -->
						<!-- 												<a href="#">2행 2번째 글</a> -->
						<!-- 											</h2> -->
						<!-- 																						<p>Pellentesque habitant morbi tristique senectus et -->
						<!-- 																							netus et malesuada fames ac turpis egestas. Mauris elementum -->
						<!-- 																							libero at pharetra auctor.</p> -->
						<!-- 											<footer> -->
						<!-- 												<a href="#" class="love"><i -->
						<!-- 													class="ion-android-favorite-outline"></i> -->
						<!-- 													<div>980</div></a> <a class="btn btn-primary more" href="#"> -->
						<!-- 													<div>More</div> -->
						<!-- 													<div> -->
						<!-- 														<i class="ion-ios-arrow-thin-right"></i> -->
						<!-- 													</div> -->
						<!-- 												</a> -->
						<!-- 											</footer> -->
						<!-- 										</div> -->
						<!-- 									</div> -->
						<!-- 								</article> -->


						<!-- 							</div> -->
						<!-- 						</div> -->

						<!-- 												3행 -->

						<!-- 						<div class="col-md-4 col-sm-6 col-xs-12"> -->
						<!-- 							<div class="row"> -->

						<!-- 								<article class="article col-md-12"> -->
						<!-- 									<div class="inner"> -->
						<!-- 										<figure> -->
						<!-- 											<a href="#"> <img src="images/news/img05.jpg" -->
						<!-- 												alt="Sample Article"> -->
						<!-- 											</a> -->
						<!-- 										</figure> -->
						<!-- 										<div class="padding"> -->
						<!-- 											<div class="detail"> -->
						<!-- 												<div class="time">December 09, 2016</div> -->
						<!-- 												<div class="category"> -->
						<!-- 													<a href="category.jsp">Lifestyle</a> -->
						<!-- 												</div> -->
						<!-- 											</div> -->
						<!-- 											<h2> -->
						<!-- 												<a href="#">1행 3번째 글</a> -->
						<!-- 											</h2> -->
						<!-- 																						<p>Vivamus in efficitur mi. Nullam semper justo ut elit -->
						<!-- 																							lacinia lacinia. Class aptent taciti sociosqu ad litora -->
						<!-- 																							torquent per conubia nostra.</p> -->
						<!-- 											<footer> -->
						<!-- 												<a href="#" class="love"><i -->
						<!-- 													class="ion-android-favorite-outline"></i> -->
						<!-- 													<div>1083</div></a> <a class="btn btn-primary more" href="#"> -->
						<!-- 													<div>More</div> -->
						<!-- 													<div> -->
						<!-- 														<i class="ion-ios-arrow-thin-right"></i> -->
						<!-- 													</div> -->
						<!-- 												</a> -->
						<!-- 											</footer> -->
						<!-- 										</div> -->
						<!-- 									</div> -->
						<!-- 								</article> -->

						<!-- 								<article class="article col-md-12"> -->
						<!-- 									<div class="inner"> -->
						<!-- 										<figure> -->
						<!-- 											<a href="#"> <img src="images/news/img07.jpg" -->
						<!-- 												alt="Sample Article"> -->
						<!-- 											</a> -->
						<!-- 										</figure> -->
						<!-- 										<div class="padding"> -->
						<!-- 											<div class="detail"> -->
						<!-- 												<div class="time">December 21, 2016</div> -->
						<!-- 												<div class="category"> -->
						<!-- 													<a href="category.jsp">Sport</a> -->
						<!-- 												</div> -->
						<!-- 											</div> -->
						<!-- 											<h2> -->
						<!-- 												<a href="#">2행 3번째 글</a> -->
						<!-- 											</h2> -->
						<!-- 																						<p>Pellentesque habitant morbi tristique senectus et -->
						<!-- 																							netus et malesuada fames ac turpis egestas. Mauris elementum -->
						<!-- 																							libero at pharetra auctor.</p> -->
						<!-- 											<footer> -->
						<!-- 												<a href="#" class="love"><i -->
						<!-- 													class="ion-android-favorite-outline"></i> -->
						<!-- 													<div>980</div></a> <a class="btn btn-primary more" href="#"> -->
						<!-- 													<div>More</div> -->
						<!-- 													<div> -->
						<!-- 														<i class="ion-ios-arrow-thin-right"></i> -->
						<!-- 													</div> -->
						<!-- 												</a> -->
						<!-- 											</footer> -->
						<!-- 										</div> -->
						<!-- 									</div> -->
						<!-- 								</article> -->


						<!-- 							</div> -->
						<!-- 						</div> -->

						<!-- 						3행 끝 -->



					</div>

				</div>
			</div>
		</div>
>>>>>>> branch 'master' of https://github.com/imrutel/Roopretelcham.git
	</section>
	<!-- 					갤러리 끝 -->


	<!-- Start footer -->
	<footer class="footer">
		<div class="row">
			<div class="col-md-12">
				<div class="copyright">
					COPYRIGHT &copy; MAGZ 2017. ALL RIGHT RESERVED.
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