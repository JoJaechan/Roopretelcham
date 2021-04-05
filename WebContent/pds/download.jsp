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
<!-- Shareable -->
<!-- 		<meta property="og:title" content="HTML5 & CSS3 magazine template is based on Bootstrap 3" /> -->
<!-- 		<meta property="og:type" content="article" /> -->
<!-- 		<meta property="og:url" content="http://github.com/nauvalazhar/Magz" /> -->
<!-- 		<meta property="og:image" content="https://raw.githubusercontent.com/nauvalazhar/Magz/master/images/preview.png" /> -->
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
</head>

<body>
	<!-- 헤더파일들어가는 곳 -->
	<jsp:include page="/top.jsp"></jsp:include>
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
							onclick="location.href='WriteFormDownload.jsp'">글쓰기</button>
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
							FileBean fb = boardDAO.getArticleThumbFile(b.getNum(), Table.FILE_PDS.name());
							String thumbPath = fb.getThumb_path();
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
											<a href="#"><%=b.getName()%></a>
										</div>
										<div class="time"><%=b.getDate()%></div>
									</div>
									<h1>									
										<a href="content_download.jsp?num=<%=b.getNum()%>"><%=b.getSubject()%></a>
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
											class="btn btn-primary more" href="content_download.jsp?num=<%=b.getNum()%>">
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
								<%								
								int pageSize = 10; // 한페이지 당 글 개수
								int startRow = 1;
								String pageNum = request.getParameter("pageNum");

								if (pageNum == null) {
									pageNum = "1";
								}

								int count = 0;
								count = boardDAO.articleGetCount(Table.BOARD.name());
								int currentPage = Integer.parseInt(pageNum);
								startRow = (currentPage - 1) * pageSize + 1;
								
								int startPage = (currentPage - 1) / pageSize * pageSize + 1;
								int endPage = (startPage + pageSize) - 1;

								// 전체페이지수 구하기
								int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
									
								if (endPage > pageCount) {
									endPage = pageCount;
								}
								// 이전 10만큼 앞으로 페이지 이동
								if (startPage > pageSize) {
								%><li class="prev"><a href="list.jsp?pageNum=<%=startPage - pageSize%>"><i
										class="ion-ios-arrow-left"></i></a></li>
								<%
								}

								// 페이지 출력
								for (int i = 1; i <= endPage; i++) {
									if (i == Integer.parseInt(pageNum)) {
								%>
								<li class="active"><a href="community.jsp?pageNum=<%=i%>"><%=i%></a></li>
								<%
									} else {
								%><li><a href="community.jsp?pageNum=<%=i%>"><%=i%></a></li>
								<%
									}
								}
								%>
								
								<%
								//다음 10만큼 뒤로 페이지 이동
								//if(endPage < pageCount){
									%><li class="next"><a href="#"><i
										class="ion-ios-arrow-right"></i></a></li><%
								//}
								%>
								
							</ul>
							<div class="pagination-help-text">
								<%=count%>개 결과 중
								<%
								if (count < pageSize) {
									pageSize = count;
								}
								%>
								<%=pageSize%>개 표시 &mdash; 페이지
								<%=pageNum%>
							</div>
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