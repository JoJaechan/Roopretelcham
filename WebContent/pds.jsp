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
<!-- Shareable -->
<!-- 		<meta property="og:title" content="HTML5 & CSS3 magazine template is based on Bootstrap 3" /> -->
<!-- 		<meta property="og:type" content="article" /> -->
<!-- 		<meta property="og:url" content="http://github.com/nauvalazhar/Magz" /> -->
<!-- 		<meta property="og:image" content="https://raw.githubusercontent.com/nauvalazhar/Magz/master/images/preview.png" /> -->
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

<body>
	<!-- 헤더파일들어가는 곳 -->
	<jsp:include page="top.jsp"></jsp:include>
	<!-- 헤더파일들어가는 곳 -->

	<section class="category">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-left">
					<div class="row">
						<div class="col-md-12">
							<ol class="breadcrumb">
								<li><a href="#">메인</a></li>
								<li class="active">자료실</li>
							</ol>
							<!-- 							<h1 class="page-title">자료실</h1> -->
							<p class="page-subtitle">
								원하는 자료를 <i>업로드</i>하거나 <i>다운로드</i>할 수 있습니다.
							</p>
						</div>
					</div>

					<div class="col-md-2">
						<button class="btn btn-primary btn-block"
							onclick="location.href='WriteFormPDS.jsp'">글쓰기</button>
					</div>
					<div class="line"></div>
					<div class="row">

						<!-- 					글목록 시작 -->
						<%
						BoardDAO boardDAO = new BoardDAO();
						List<BoardBean> bbList = boardDAO.selectBoard("board_pds");
						%>
						<!-- 갤러리 표시 시작 -->
						<%
						for (BoardBean b : bbList) {
							FileBean fb = boardDAO.getArticleThumbFile(b.getNum(), "file_pds");
							String thumbPath = fb.getFile_name();
							System.out.println("thumbPath : " + thumbPath);
							List<FileBean> fbList = boardDAO.getArticleFileList(b.getNum());
						%>

						<article class="col-md-12 article-list">
							<div class="inner">
								<figure>
									<%
									if (thumbPath != null) {
									%>
									<a href="content_download.jsp?num=<%=b.getNum()%>"> <!-- 											<img src="images/news/img10.jpg" alt="Sample Article"> -->
										<img
										src="${pageContext.request.contextPath}/upload/<%=thumbPath%>" />
									</a>
									<br>
									<%
									} else {
									System.out.println("이미지없음, 대체이미지 표시");
									%>
									<a href="content_download.jsp?num=<%=b.getNum()%>"> <!-- 											<img src="images/news/img10.jpg" alt="Sample Article"> -->
										<img src="images/noimg.gif" />
									</a>
									<br>
									<%
									}
									%>
								</figure>
								<div class="details">
									<div class="detail">
										<div class="category">
											<a href="#"><%=b.getName()%></a>
										</div>
										<div class="time"><%=b.getDate()%></div>
									</div>
									<h1>
										<a href="#"><%=b.getSubject()%></a>
									</h1>

									<%-- 									<p><%=b.getContent()%></p> --%>
									<!-- 게시물에 대한 파일리스트 표시시작 -->
									<%
									for (FileBean file : fbList) {
										String filename = file.getFile_name();
									%>
									<a
										href="${pageContext.request.contextPath}/upload/<%=filename%>">
										<%=filename%>
									</a><br>
									<%
									}
									%>

									<footer>
										<a href="#" class="love"><i
											class="ion-android-favorite-outline"></i>
											<div><%=b.getReadcount()%></div></a> <a
											class="btn btn-primary more" href="single.html">
											<div>더 보기</div>
											<div>
												<i class="ion-ios-arrow-thin-right"></i>
											</div>
										</a>
									</footer>
								</div>
							</div>
						</article>
						<%
						}
						%>
						<!-- 						글 목록 끝 -->

						<div class="col-md-12 text-center">
							<ul class="pagination">
								<li class="prev"><a href="#"><i
										class="ion-ios-arrow-left"></i></a></li>
								<li class="active"><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">...</a></li>
								<li><a href="#">97</a></li>
								<li class="next"><a href="#"><i
										class="ion-ios-arrow-right"></i></a></li>
							</ul>
							<div class="pagination-help-text">Showing 8 results of 776
								&mdash; Page 1</div>
						</div>
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