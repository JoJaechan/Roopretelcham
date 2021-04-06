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

<title>Magz &mdash; Responsive HTML5 &amp; CSS3 Magazine
	Template</title>
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

<link rel="stylesheet" href="/js/vegas/vegas.min.css">
</head>
<body>
	<!-- 헤더파일들어가는 곳 -->
	<jsp:include page="/top.jsp"></jsp:include>
	<!-- 헤더파일들어가는 곳 -->

	<%
	int startRow = 1;
	int pageSize = 3;
	BoardDAO boardDAO = new BoardDAO();
	%>

	<section class="home">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">

					<!-- 커뮤니티 -->
					<ol class="breadcrumb">
						<li><a href="#">메인</a></li>
						<li class="active">커뮤니티</li>
					</ol>
					<%
					List<BoardBean> bbList = boardDAO.selectBoard(Table.BOARD.name(), startRow, pageSize);
					if (bbList != null) {
						for (BoardBean bb : bbList) {
					%>
					<div class="row">
						<article class="col-md-12">
							<!-- 							<div class="inner"> -->
							<!-- 								<figure> -->
							<!-- 									<a href="single.jsp"> <img src="images/news/img01.jpg"> -->
							<!-- 									</a> -->
							<!-- 								</figure> -->
							<div class="details">
								<div class="detail">
									<div class="category">
										<!-- 										<a href="category.jsp">Film</a> -->
										<%=bb.getName()%>
									</div>
									<div class="time"><%=bb.getDate()%></div>
								</div>
								<h1>
									<a href="/community/content.jsp?num=<%=bb.getNum()%>"><%=bb.getSubject()%></a>
								</h1>
							</div>
<!-- 							<footer> -->
<!-- 									<a class="btn btn-primary more" -->
<%-- 										href="/community/content.jsp?num=<%=bb.getNum()%>"> --%>
<!-- 										<div>더 보기</div> -->
<!-- 										<div> -->
<!-- 											<i class="ion-ios-arrow-thin-right"></i> -->
<!-- 										</div> -->
<!-- 									</a> -->
<!-- 								</footer> -->

						</article>
					</div>
					<%
					}
					}
					%>
					<div class="line"></div>
					<!-- 			커뮤니티 끝 -->

					

						<!-- 					갤러리 시작 -->
						<div class="row">
							<div class="col-md-12">
								<ol class="breadcrumb">
									<li><a href="#">메인</a></li>
									<li class="active">갤러리</li>
								</ol>
							</div>
						</div>
						<div class="row">
							<%
							List<BoardBean> bbGaleryList = boardDAO.selectBoard(Table.BOARD_GALLERY.name(), startRow, pageSize);
							%>
							<div class="row">
								<!-- 갤러리 표시 시작 -->
								<%
								for (BoardBean b : bbGaleryList) {
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
												<a href="/gallery/content_gallery.jsp?num=<%=b.getNum()%>">
													<!-- 											<img src="images/news/img10.jpg" alt="Sample Article"> -->
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
														class="btn btn-primary more"
														href="/gallery/content_gallery.jsp?num=<%=b.getNum()%>">
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
				<!-- 			갤러리 끝 -->


<!-- 자료실 시작 -->
					<div class="line"></div>
					<div class="row">
						<div class="col-md-12">
							<ol class="breadcrumb">
								<li><a href="#">메인</a></li>
								<li class="active">자료실</li>
							</ol>
						</div>
						<!-- 					글목록 시작 -->
						<%
						List<BoardBean> pdsList = boardDAO.selectBoard(Table.BOARD_PDS.name(), startRow, pageSize);;
						%>
						<!-- 갤러리 표시 시작 -->
						<%
						for (BoardBean post : pdsList) {
							FileBean fb = boardDAO.getArticleThumbFile(post.getNum(), Table.FILE_PDS.name());
							String thumbPath = fb.getThumb_path();
							System.out.println("thumbPath : " + thumbPath);
							List<FileBean> fbList = boardDAO.getArticleFileList(post.getNum());
						%>

						<article class="col-md-12 article-list">
							<div class="inner">
								<figure>
									<%
									if (thumbPath != null) {
									%>
									<a href="/pds/content_download.jsp?num=<%=post.getNum()%>">
										<!-- 											<img src="images/news/img10.jpg" alt="Sample Article"> -->
										<img
										src="${pageContext.request.contextPath}/upload/<%=thumbPath%>" />
									</a>
									<br>
									<%
									} else {
									System.out.println("이미지없음, 대체이미지 표시");
									%>
									<a href="/pds/content_download.jsp?num=<%=post.getNum()%>">
										<!-- 											<img src="images/news/img10.jpg" alt="Sample Article"> -->
										<img src="/images/noimg.gif" />
									</a>
									<br>
									<%
									}
									%>
								</figure>
								<div class="details">
									<div class="detail">
										<div class="category">
											<a href="#"><%=post.getName()%></a>
										</div>
										<div class="time"><%=post.getDate()%></div>
									</div>
									<h1>
										<a href="/pds/content_download.jsp?num=<%=post.getNum()%>"><%=post.getSubject()%></a>
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
											<div><%=post.getReadcount()%></div></a> <a
											class="btn btn-primary more"
											href="/pds/content_download.jsp?num=<%=post.getNum()%>">
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




			</div>
		</div>
	</section>
	<!-- 					갤러리 끝 -->


	<!-- 							</div> -->


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
		$(document).ready(function() {
			var imagecollection = [ {
				src : 'images/bg.jpg'
			}, {
				src : 'images/bg2.gif'
			}, {
				src : 'images/bg3.gif'
			}, ];

			$("#ShowSlideShowHere").vegas({
				slides : imagecollection,
				transition : 'fade',
				preloadImage : true,
				timer : true,
				shuffle : true,
				delay : 5000,
				animation : 'kenburns',
				cover : true
			});
		});
	</script>

</body>
</html>