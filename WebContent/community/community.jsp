<%@page import="table.Table"%>
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
								<li class="active">커뮤니티</li>
							</ol>
						</div>
					</div>

					<div class="col-md-2">
						<button class="btn btn-primary btn-block"
							onclick="location.href='writeForm.jsp'">글쓰기</button>
					</div>
					<div class="line"></div>
					<div class="row">
						<!-- 					글 시작 -->
						<%
						BoardDAO boardDAO = new BoardDAO();
						int pageSize = 10; // 한페이지 당 글 개수
						int startRow = 1;
						String pageNum = request.getParameter("pageNum");
						// 시작하는 행번호 구하기
						// 현페이지번호(currentPage)  한화면에보여줄 글개수(pageSize) => 행번호
						//  1    10    => (1-1)*10+1=>0*10+1=>  0+1=>  1
						//  2    10    => (2-1)*10+1=>1*10+1=> 10+1=> 11
						//  3    10    => (3-1)*10+1=>2*10+1=> 20+1=> 21
						if (pageNum == null) {
							pageNum = "1";
						}

						int count = 0;
						count = boardDAO.articleGetCount(Table.BOARD.name());
						int currentPage = Integer.parseInt(pageNum);
						startRow = (currentPage - 1) * pageSize + 1;

						List<BoardBean> bbList = boardDAO.selectBoard(Table.BOARD.name(), startRow, pageSize);

						if (bbList != null) {
							for (BoardBean b : bbList) {
						%>
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
										<%=b.getName()%>
									</div>
									<div class="time"><%=b.getDate()%></div>
								</div>
								<h1>
									<a href="content.jsp?num=<%=b.getNum()%>"><%=b.getSubject()%></a>
								</h1>

								<%-- 								<p><%=b.getContent()%></p> --%>

								<footer>
									<a href="#" class="love"><i
										class="ion-android-favorite-outline"></i>
										<div>237</div></a> <a class="btn btn-primary more"
										href="content.jsp?num=<%=b.getNum()%>">
										<div>더 보기</div>
										<div>
											<i class="ion-ios-arrow-thin-right"></i>
										</div>
									</a>
								</footer>
							</div>

							<!-- 							</div> -->
						</article>
						<%
						}
						}
						%>

						<div class="col-md-12 text-center">
							<ul class="pagination">
								<li class="prev"><a href="#"><i
										class="ion-ios-arrow-left"></i></a></li>
								<%
								int startPage = (currentPage - 1) / pageSize * pageSize + 1;
								// 현페이지번호 (currentPage)  한페이지 보여줄 페이지 개수(pageBlock) => startPage
								// 1~10     10    => (1~10 -1)/10 *10+1=>1~10  /10 *10+1=>0*10+1=> 0+1=>1
								// 11~20    10    => (11~20-1)/10*10+1 =>11~20/10*10+1=>1*10+1=>10+1=>11
								// 21~30    10    => (21~30-1)/10*10+1 =>21~30/10*10+1=>2*10+1=>20+1=>21

								// 1 2 3 4 5 6 7 8 9  /10 => 몫 0    10-1/10 => 0
								// 11 12 13 ~  19 /10 => 몫 1        20-1/10 => 1
								// 21 22 23 ~  29 /10 => 몫 2        30-1/10 => 2
								int endPage = (startPage + pageSize) - 1;

								// 전체페이지수 구하기
								int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);

								// 전체글 개수 구하기 

								// 끝페이지번호   전체페이지수  비교 
								//								    10     >      5
								// 끝페이지번호 대신에 전체페이지수 넣기
								//								    10 <= 5 변경
								if (endPage > pageCount) {
									endPage = pageCount;
								}

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
								<li class="next"><a href="#"><i
										class="ion-ios-arrow-right"></i></a></li>
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