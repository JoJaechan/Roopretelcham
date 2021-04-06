<%@page import="table.Table"%>
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

<title>Roopretelcham</title>
<!-- Bootstrap -->
<link rel="stylesheet" href="/scripts/bootstrap/bootstrap.min.css">
<!-- IonIcons -->
<link rel="stylesheet" href="/scripts/ionicons/css/ionicons.min.css">
<!-- Toast -->
<link rel="stylesheet" href="/scripts/toast/jquery.toast.min.css">
<!-- OwlCarousel -->
<link rel="stylesheet"
	href="/scripts/owlcarousel/dist/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="/scripts/owlcarousel/dist/assets/owl.theme.default.min.css">
<!-- Magnific Popup -->
<link rel="stylesheet"
	href="/scripts/magnific-popup/dist/magnific-popup.css">
<link rel="stylesheet" href="/scripts/sweetalert/dist/sweetalert.css">
<!-- Custom style -->
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/skins/all.css">
<link rel="stylesheet" href="/css/demo.css">
</head>

<body class="skin-orange">
	<!-- 헤더파일들어가는 곳 -->
	<jsp:include page="/top.jsp"></jsp:include>
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
						//한페이지에 가져올 글개수 설정
						int pageSize=6;
						//시작하는 행번호 구하기
						int startRow=1;
						
						BoardDAO boardDAO = new BoardDAO();
						List<BoardBean> bbList = boardDAO.selectBoard("board_gallery", 1, 6);
						%>
						<div class="row">
							<!-- 갤러리 표시 시작 -->
							<%
							for (BoardBean b : bbList) {
								FileBean fb = boardDAO.getArticleThumbFile(b.getNum(), Table.FILE_GALLERY.name());
								String thumbPath = fb.getThumb_path();
								System.out.println("gallery.jsp -> thumbPath : " + thumbPath);
								
								if (thumbPath == null || thumbPath == "") {
									thumbPath = "noimg.gif";
								}
							%>
							<!-- 						<div class="col-md-4 col-sm-6 col-xs-12"> -->
							<div class="col">

								<article class="article col-md-4">
									<div class="inner">
										<figure>
											<a href="/gallery/content_gallery.jsp?num=<%=b.getNum()%>"> <!-- 											<img src="images/news/img10.jpg" alt="Sample Article"> -->
												<img
												src="${pageContext.request.contextPath}/upload/<%=thumbPath%>" />
											</a>
										</figure>

										<div class="padding">
											<div class="detail">
												<div class="time"><%=b.getDate()%></div>
												<div class="category">
													<a href="#"><%=b.getName()%></a>
												</div>
											</div>
											<h2>
												<a href="/gallery/content_gallery.jsp?num=<%=b.getNum()%>"><%=b.getSubject()%></a>
											</h2>
											<!-- 											<p>Lorem ipsum dolor sit amet, consectetur adipiscing -->
											<!-- 												elit, sed do eiusmod tempor incididunt ut labore et dolore -->
											<!-- 												magna aliqua. Ut enim ad minim veniam.</p> -->
											<footer>
												<a href="#" class="love"><i
													class="ion-android-favorite-outline"></i>
													<div><%=b.getReadcount()%></div></a> <a
													class="btn btn-primary more" href="/gallery/content_gallery.jsp?num=<%=b.getNum()%>">
													<div>더 보기</div>
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
		</div>
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